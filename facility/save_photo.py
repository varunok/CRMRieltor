# -*- coding: utf-8 -*-


import os
import uuid
from django.conf import settings
from facility.models import ImagesFacility, AddressFacilityData


def save_photo(request, last_id):
    images = request.FILES.getlist('image', [])
    list_tmp_img = os.listdir('media/tmpimg/')

    cover_img = True
    for image in images:
        if str(image) in list_tmp_img:
            if images.index(image):
                if not ImagesFacility.objects.filter(album_id=last_id, cover=1).exists():
                    print('image #', images.index(image), 'not cover')
                    img = ImagesFacility(album_id=last_id, image=image, cover=1)
                    img.save()
                else:
                    img = ImagesFacility(album_id=last_id, image=image)
                    img.save()
            else:
                if not ImagesFacility.objects.filter(album_id=last_id, cover=1).exists():
                    img = ImagesFacility(album_id=last_id, image=image, cover=1)
                    img.save()
                else:
                    img = ImagesFacility(album_id=last_id, image=image)
                    img.save()


        try:
            os.remove(''.join(('media/tmpimg/', str(image))))
        except:
            continue
    images_count = AddressFacilityData.objects.get(id=last_id)
    count_image = ImagesFacility.objects.filter(album=images_count).count()
    images_count.images_count = count_image
    images_count.save()
