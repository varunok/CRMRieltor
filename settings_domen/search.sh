#!/usr/bin/env bash
sites="dom6.batysdom.kz dom6.bizflat.kiev.ua dom6.bizflat.kz dom6.bizflat.od.ua dom6.dom-alexandria.kr.ua dom6.domcity.dp.ua
dom6.domgomel.by dom6.domik-bc.kiev.ua dom6.dom.lt.ua dom6.dom-mariupol.dn.ua
dom6.dom-nikolaev.com.ua dom6.dom.zt.ua dom6.gek.cv.ua dom6.gek.kr.ua
dom6.hata.km.ua dom6.houster.kh.ua dom6.neruhomist.volyn.ua dom6.usatba-krm.dn.ua dom6.xata.dp.ua dom6.xata.lviv.ua dom6.xata-spb.ru"

for site in $sites
do
short_name=${site:4}
short_name=${short_name//-/}
short_site=${short_name//./}
echo $site
echo $short_site
cd /hsphere/local/home/image2007/$site/$short_site
source ../data/bin/activate
pip install django-watson
#python manage.py makemigrations watson

python manage.py migrate watson

python manage.py buildwatson

cd $short_site

ln -s /hsphere/local/home/image2007/crm_rieltor/crm/add_settings.py


echo $site' done'

done