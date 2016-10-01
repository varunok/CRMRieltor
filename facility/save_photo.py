# -*- coding: utf-8 -*-


import os
from facility.models import ImagesFacility, AddressFacilityData


def save_photo(request, last_id):
    images = request.FILES.getlist('image', [])
    list_tmp_img = os.listdir('media/tmpimg/')
    count_image = 0
    cover_img = True
    for image in images:
        if str(image) in list_tmp_img:
            if images.index(image):
                if cover_img:
                    img = ImagesFacility(album_id=last_id, image=image, cover=1)
                    img.save()
                    count_image += 1
                    cover_img = False
                else:
                    img = ImagesFacility(album_id=last_id, image=image)
                    img.save()
                    count_image += 1

            else:
                img = ImagesFacility(album_id=last_id, image=image, cover=1)
                img.save()
                count_image += 1
                cover_img = False
        try:
            os.remove(''.join(('media/tmpimg/', str(image))))
        except:
            continue
    images_count = AddressFacilityData.objects.get(id=last_id)
    images_count.images_count = count_image
    images_count.save()
