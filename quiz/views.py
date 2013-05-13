# -*- coding: utf-8 -*-
# Create your views here.
from django.contrib import auth
from django.db import IntegrityError
from django.http import Http404, HttpResponseRedirect
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
    elif 'pid' in request.POST:
        try:
            project = Project.objects.get(id=request.POST['pid'], owner=request.user)
            request.session['project'] = project
        except Project.DoesNotExist:
            raise Http404()
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
    if group.group_type.group_type == 'enum':
        for q in objects:
            try:
                tmp_set = Answer.objects.filter(project=project, question=q)
                for item in tmp_set:
                    answers.append((q, item))
            except Answer.DoesNotExist:
                answers.append((q, Answer(project=project, question=q, value='')))
    else:
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
    if not request.user.is_staff:
        projects = Project.objects.filter(owner=request.user)
        return render_to_response('client/my_projects.html',
                                  {'projects': projects,
                                   'active_section': 'projects'},
                                  RequestContext(request))

    projects = Project.objects.all()
    return render_to_response('manager/all_projects.html',
                              {'projects': projects,
                               'active_section': 'projects'},
                              RequestContext(request))


def project_info(request):
    if 'pid' in request.GET:
        id = request.GET['pid']
        try:
            project = Project.objects.get(owner=request.user, id=id)
            info = getInfo(project)
        except Project.DoesNotExist:
            raise Http404()
    else:
        raise Http404()
    return render_to_response('client/project_info.html',
                              {'project': project,
                               'info': info,
                               'active_section': 'new'},
                              RequestContext(request))


def contacts(request):
    if not request.user.is_authenticated:
        raise Http404()
    try:
        contact = Contacts.objects.get(user=request.user)
    except Contacts.DoesNotExist:
        contact = Contacts(user=request.user, value='')
    if 'text' in request.POST:
        contact.value = request.POST['text']
        contact.save()
    return render_to_response('client/contacts.html',
                              {'active_section': 'contacts',
                               'value': contact.value},
                              RequestContext(request))


def clients(request):
    if not request.user.is_authenticated or not request.user.is_staff:
        raise Http404()
    contacts = Contacts.objects.all()
    return render_to_response('manager/clients.html',
                              {'active_section': 'contacts',
                               'contacts': contacts},
                              RequestContext(request))


def finish(request):
    if not request.user.is_authenticated():
        raise Http404()
    offset = QuestionGroup.objects.all().__len__()
    if 'project' in request.session:
        project = request.session['project']
        saveAnswers(request=request, project=project, offset=offset)
        info = getInfo(project)
    else:
        raise Http404()
    return render_to_response('client/project_info.html',
                              {'project': project,
                               'info': info,
                               'active_section': 'new'},
                              RequestContext(request))


def submitted(request):
    if 'pid' in request.POST:
        id = request.POST['pid']
        try:
            project = Project.objects.get(owner=request.user, id=id)
            status = ProjectStatus.objects.get(name='Submitted')
            project.status = status
            project.save()
        except Project.DoesNotExist:
            raise Http404()
    return render_to_response('client/submitted.html',
                              {'project': project,
                               'active_section': 'new'},
                              RequestContext(request))


def getInfo(project):
    groups = QuestionGroup.objects.all()
    info = []
    for group in groups:
        objects = Question.objects.filter(id_question_group=group)
        answers = []
        for q in objects:
            try:
                if group.group_type.group_type == 'enum':
                    tmp_set = Answer.objects.filter(project=project, question=q)
                    for answer in tmp_set:
                        answers.append(answer.value)
                else:
                    answer = Answer.objects.get(project=project, question=q)
                    if not (answer.value == '0' or answer.value == ''):
                        answers.append(str(q.text))
            except Answer.DoesNotExist:
                print 'show must go on'
        info.append((group.group_header, answers))
    return info


def main_default(request):
    return main(request=request, username_is_ok=True, username='')


def main(request, username_is_ok, username):
    if request.user.is_authenticated():
        projects = Project.objects.filter(owner=request.user)
        return render_to_response('client/my_projects.html',
                                  {'projects': projects,
                                   'active_section': 'projects'},
                                  RequestContext(request))

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
                               'type3': group3.group_type.__unicode__(),
                               'username_is_ok': username_is_ok,
                               'username': username}, RequestContext(request))


def register(request):
    try:
        user = User.objects.create_user(username=request.POST['inputName'],
                                        email=request.POST['inputEmail'],
                                        password=request.POST['inputPassword'])
        user.first_name = request.POST['inputFirst']
        user.last_name = request.POST['inputLast']
        user.is_staff = False
        user.save()
        user = auth.authenticate(username=user.username, password=request.POST['inputPassword'])
        if user is not None and user.is_active:
            # Правильный пароль и пользователь "активен"
            auth.login(request, user)
            # Перенаправление на "правильную" страницу
            project = Project(owner=user,
                              name=request.POST['first_project_name'],
                              status=ProjectStatus.objects.get(name='New'),
                              real_result=0)
            project.save()
            request.session['project'] = project

            saveFromWelcomePage(request=request, project=project, offset=1)
            saveFromWelcomePage(request=request, project=project, offset=2)
            saveFromWelcomePage(request=request, project=project, offset=3)

            return HttpResponseRedirect("/quiz/4/")
        else:
            # Отображение страницы с ошибкой
            return HttpResponseRedirect("/404/")
    except IntegrityError:
        return main(request, False, request.POST['inputName'])


def saveFromWelcomePage(request, project, offset):
    try:
        prev_group = QuestionGroup.objects.get(position_No=int(offset))
        prev_group_type = prev_group.group_type.__unicode__()
        prev_questions = Question.objects.filter(id_question_group=prev_group)
        if prev_group_type == 'radio':
            for q in prev_questions:
                if str(q.id) == request.POST['radiogroup' + str(offset)]:
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


def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = auth.authenticate(username=username, password=password)
    if user is not None and user.is_active:
        # Правильный пароль и пользователь "активен"
        auth.login(request, user)
        # Перенаправление на "правильную" страницу
        return HttpResponseRedirect("/projects/")
    else:
        # Отображение страницы с ошибкой
        return HttpResponseRedirect("/404/")


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect("/")


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
                i = 0
                for q in prev_questions:
                    try:
                        tmp_set = Answer.objects.filter(project=project, question=q)
                        for answer in tmp_set:
                            answer.delete()
                    except Answer.DoesNotExist:
                        print 'nothing to delete'

                    while 'text' + str(i) in request.POST:
                        result = request.POST['text' + str(i)]
                        i += 1
                        if not result == '':
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