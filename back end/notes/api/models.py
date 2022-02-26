from django.db import models


class Note(models.Model):
    objects = None
    object = None
    body = models.TextField()
    update = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.body[0:50]

    class Meta:
        ordering = ['-update']

