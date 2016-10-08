#!/bin/bash
directory="img"
param1=$1
echo 'Create python virtualenv...'
# . /data/work/buildouts/python/bin/virtualenv-2.7 data --no-site-packages  
echo 'Activate python virtualenv...'
source $param1/bin/activate
echo 'Activated'
echo 'Check requirements.txt'
requirements='requirements.txt'
if [ -e $requirements.txt ]; then
echo "Exists requirements.txt"
else
echo "Requirements.txt does not exists"
# exit 0
fi
echo 'Start install packages'
# pip install requirements.txt
echo 'installed packages'
echo 'Create' $param1 'directory'
mkdir $param1
echo 'Created'
echo 'Create .htaccess'
touch .htaccess
echo 'Created'
echo 'Create' $param1'.fsgi'
fsgi_file=$param1'.fsgi'
touch $fsgi_file
echo 'Created'

# dom6.neruhomist.volyn.ua
# dom6.gek.cv.ua
# dom6.gek.kr.ua
# dom6.bizflat.kiev.ua
# dom6.domgomel.by
# dom6.bizflat.kz
# dom6.batysdom.kz
# dom6.hata.km.ua
# dom6.dom-alexandria.kr.ua
# dom6.xata.dp.ua
