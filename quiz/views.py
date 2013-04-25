# -*- coding: utf-8 -*-
# Create your views here.
from django.http import Http404
from django.shortcuts import render_to_response
from django.template.context import RequestContext

from quiz.models import *


def err404(request):
    return render_to_response('common/404.html', {})


def default_question_sample(request):
    return question_sample(request, 1)


def question_sample(request, offset):
    if not request.user.is_authenticated():
        raise Http404()
    max = QuestionGroup.objects.all().__len__()
    questions_list = []
    i = 1
    while i <= max:
        questions_list.append(i)
        i += 1

    try:
        offset = int(offset)
        print offset
        if max < offset or offset < 1:
            raise Http404()
    except ValueError:
        raise Http404()

    if 'project_name' in request.POST:
        project = Project(name=str(request.POST['project_name']),
                          owner=request.user,
                          status=ProjectStatus.objects.get(name='New'),
                          real_result=0)
        project.save()
        request.session['project'] = project
    elif 'project' in request.session:
        project = request.session['project']
        saveAnswers(request=request, project=project, offset=offset - 1)
    else:
        raise Http404()

    if offset == max:
        next = '/finish/'
    else:
        next = '/quiz/' + str(offset + 1) + '/'

    group = QuestionGroup.objects.get(position_No=offset)
    objects = Question.objects.filter(id_question_group=group)
    answers = []
    for q in objects:
        try:
            answers.append((q, Answer.objects.get(project=project, question=q)))
        except Answer.DoesNotExist:
            answers.append((q, Answer(project=project, question=q, value='')))

    return render_to_response('client/question.html',
                              {'list': questions_list,
                               'active': offset,
                               'question_title': group.group_header,
                               'type': group.group_type.__unicode__(),
                               'answers': answers,
                               'project': project.name,
                               'next': next,
                               'active_section': 'new'}, RequestContext(request))


def new(request):
    return render_to_response('client/new_project.html',
                              {'active_section': 'new'},
                              RequestContext(request))


def my_projects(request):
    projects = Project.objects.filter(owner=request.user)
    return render_to_response('client/my_projects.html',
                              {'projects': projects,
                               'active_section': 'projects'},
                              RequestContext(request))


def finish(request):
    if not request.user.is_authenticated():
        raise Http404()
    offset = QuestionGroup.objects.all().__len__()
    if 'project' in request.session:
        project = request.session['project']
        saveAnswers(request=request, project=project, offset=offset)
    else:
        raise Http404()
    return render_to_response('common/404.html',
                              {'active_section': 'new'},
                              RequestContext(request))


def main(request):
    group1 = QuestionGroup.objects.get(position_No=1)
    objects1 = Question.objects.filter(id_question_group=group1)
    group2 = QuestionGroup.objects.get(position_No=2)
    objects2 = Question.objects.filter(id_question_group=group2)
    group3 = QuestionGroup.objects.get(position_No=3)
    objects3 = Question.objects.filter(id_question_group=group3)
    return render_to_response('common/welcome.html',
                              {'question_title1': group1.group_header,
                               'objects1': objects1,
                               'type1': group1.group_type.__unicode__(),
                               'question_title2': group2.group_header,
                               'objects2': objects2,
                               'type2': group2.group_type.__unicode__(),
                               'question_title3': group3.group_header,
                               'objects3': objects3,
                               'type3': group3.group_type.__unicode__()}, RequestContext(request))


def register(request):
    return render_to_response('common/404.html', {})


def login(request):
    return render_to_response('common/404.html', {})


def saveAnswers(request, project, offset):
    if request.POST.values().__len__() > 0:
        try:
            prev_group = QuestionGroup.objects.get(position_No=int(offset))
            prev_group_type = prev_group.group_type.__unicode__()
            prev_questions = Question.objects.filter(id_question_group=prev_group)
            if prev_group_type == 'radio':
                for q in prev_questions:
                    if str(q.id) == request.POST['group']:
                        result = '1'
                    else:
                        result = '0'
                    try:
                        answer = Answer.objects.get(project=project, question=q)
                        answer.value = result
                        answer.save()
                    except Answer.DoesNotExist:
                        answer = Answer(project=project, question=q, value=result)
                        answer.save()
            elif prev_group_type == 'enum':
                # split: str(answer.value).split('\\n')
                for q in prev_questions:
                    result = request.POST['textarea']
                    try:
                        answer = Answer.objects.get(project=project, question=q)
                        answer.value = result
                        answer.save()
                    except Answer.DoesNotExist:
                        answer = Answer(project=project, question=q, value=result)
                        answer.save()
            elif prev_group_type == 'checkbox':
                for q in prev_questions:
                    if str(q.id) in request.POST:
                        result = '1'
                    else:
                        result = '0'
                    try:
                        answer = Answer.objects.get(project=project, question=q)
                        answer.value = result
                        answer.save()
                    except Answer.DoesNotExist:
                        answer = Answer(project=project, question=q, value=result)
                        answer.save()
        except Question.DoesNotExist:
            print("can't find Question for id=" + str(request.POST['group']))