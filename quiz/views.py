# -*- coding: utf-8 -*-
# Create your views here.
from django.http import Http404
from django.shortcuts import render_to_response
from quiz.models import Question, QuestionGroup
from django.template.context import RequestContext


def err404(request):
    return render_to_response('common/404.html', {})


def default_question_sample(request):
    return question_sample(request, 1)


def question_sample(request, offset):
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
    group = QuestionGroup.objects.get(position_No=offset)
    objects = Question.objects.filter(id_question_group=group)

    return render_to_response('client/question.html',
                              {'list': questions_list,
                               'active': offset,
                               'question_title': group.group_header,
                               'objects': objects,
                               'type': group.group_type.__unicode__()})


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