from django.contrib.auth.models import User
from django.db import models


class ProjectStatus(models.Model):
    name = models.CharField(max_length=100)  # new -> submitted -> started -> finished

    def __unicode__(self):
        return self.name


class Contacts(models.Model):
    user = models.ForeignKey(User)
    value = models.CharField(max_length=300)

    def __unicode__(self):
        return '%s: %s' % (self.user, self.value)


class Project(models.Model):
    name = models.CharField(max_length=75)
    owner = models.ForeignKey(User)
    status = models.ForeignKey(ProjectStatus)
    real_result = models.FloatField()

    def __unicode__(self):
        return '%s [%s] (%s)' % (self.name, self.owner, self.status)


class GroupType(models.Model):
    group_type = models.CharField(max_length=45)  # enum/checkbox/radio

    def __unicode__(self):
        return self.group_type


class QuestionGroup(models.Model):
    position_No = models.IntegerField()
    group_header = models.CharField(max_length=300)
    group_type = models.ForeignKey(GroupType)
    regression_coefficient = models.FloatField()

    def __unicode__(self):
        return 'Group #%d: %s' % (self.position_No, self.group_header)

    class Meta:
        ordering = ["position_No"]


class Question(models.Model):
    position = models.IntegerField()
    text = models.CharField(max_length=300)
    id_question_group = models.ForeignKey(QuestionGroup)
    is_valuable = models.BooleanField()
    value = models.FloatField()

    def __unicode__(self):
        return '%s: %s [%s]' % (self.id_question_group, self.text, self.value)

    class Meta:
        ordering = ["id_question_group"]


class Answer(models.Model):
    project = models.ForeignKey(Project)
    question = models.ForeignKey(Question)
    value = models.CharField(max_length=300)

    def __unicode__(self):
        return '%s: %s - %s' % (self.project.name, self.question.text, self.value)