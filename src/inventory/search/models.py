from django.db import models

class Location(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Status(models.Model):
    name = models.CharField(max_length=25)

    def __str__(self):
        return self.name

class Part(models.Model):
    part_number = models.CharField(max_length=100)
    description = models.TextField()
    manufacturer_part_number = models.CharField(max_length=100)
    quantity = models.IntegerField()
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    status = models.ForeignKey(Status, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.part_number
