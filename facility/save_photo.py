# -*- coding: utf-8 -*-


import os
from facility.models import ImagesFacility, AddressFacilityData
from watermark.wm import AddWatermark
from watermark.models import Watermark


def save_photo(request, last_id):
    images = request.FILES.getlist('image', [])
    list_tmp_img = os.listdir('media/tmpimg/')
    # cover_img = True
    for image in images:
        if str(image) in list_tmp_img:
            if images.index(image):
                if not ImagesFacility.objects.filter(album_id=last_id, cover=1).exists():
                    img = ImagesFacility(album_id=last_id, image=image, cover=1)
                    img.save()
                    watermarks(img)
                else:
                    img = ImagesFacility(album_id=last_id, image=image)
                    img.save()
                    watermarks(img)
            else:
                if not ImagesFacility.objects.filter(album_id=last_id, cover=1).exists():
                    img = ImagesFacility(album_id=last_id, image=image, cover=1)
                    img.save()
                    watermarks(img)
                else:
                    img = ImagesFacility(album_id=last_id, image=image)
                    img.save()
                    watermarks(img)

        try:
            os.remove(''.join(('media/tmpimg/', str(image))))
        except:
            continue
    images_count = AddressFacilityData.objects.get(id=last_id)
    count_image = ImagesFacility.objects.filter(album=images_count).count()
    images_count.images_count = count_image
    images_count.save()


def watermarks(img):
    img_from = ''.join([os.getcwd(), '/media/'])
    on_off, create = Watermark.objects.get_or_create(id=1)
    if on_off.on_off:
        AddWatermark(img_from + str(img.image), img_from + str(img.image))
