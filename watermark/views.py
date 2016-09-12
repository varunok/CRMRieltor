# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from watermark.models import Watermark
from wm import CreateWatermark


def setting_watermark(request):
	try:
		wm = Watermark.objects.filter(id=1).get()
	except:
		class Fake():
			text=''
			watermark_img=''
		wm = Fake()
	return render(request, 'watermark/setting_watermark.html', {'wm': wm})


def create_watermark(request):
	if request.method == 'POST':
		if CreateWatermark(request.POST['wm']).isCreated:
			wm, created = Watermark.objects.update_or_create(id=1, watermark_img='watermark/watermark.png')
			wm.text = request.POST['wm']
			wm.save()
			return HttpResponse(wm.watermark_img.url)
	else:
		return HttpResponse(status=500)