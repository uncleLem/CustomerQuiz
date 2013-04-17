from django.db import models


class User(models.Model):
    login = models.EmailField()
    passwd = models.CharField(max_length=45)
    username = models.CharField(max_length=45)

    def __unicode__(self):
        return '%s (%s)' % (self.username, self.login)


class ProjectStatus(models.Model):
    name = models.CharField(max_length=100)  # new -> submitted -> started -> finished

    def __unicode__(self):
        return self.name


class Project(models.Model):
    name = models.CharField(max_length=75)
    owner = models.ForeignKey(User)
    status = models.ForeignKey(ProjectStatus)

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

    def __unicode__(self):
        return 'Group #%d: %s' % (self.position_No, self.group_header)


class Question(models.Model):
    position = models.IntegerField()
    text = models.CharField(max_length=300)
    id_question_group = models.ForeignKey(QuestionGroup)
    is_valuable = models.BooleanField()
    value = models.IntegerField()

    def __unicode__(self):
        return '%s: %s [%d]' % (self.id_question_group, self.text, self.value)

    class Meta:
        ordering = ["position"]


class Answer(models.Model):
    project = models.ForeignKey(Project)
    question = models.ForeignKey(Question)
    value = models.CharField(max_length=300)

    def __unicode__(self):
        return '%s' % self.value