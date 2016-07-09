# -*- coding: utf-8 -*-


from facility.models import ImagesFacility, AddressFacilityData


def save_photo(request, last_id):
    images = request.FILES.getlist('image', [])
    for image in images:
        img = ImagesFacility(album_id=last_id, image=image)
        img.save()
    images_count = AddressFacilityData.objects.get(id=last_id)
    images_count.images_count = len(images)
    images_count.save()
