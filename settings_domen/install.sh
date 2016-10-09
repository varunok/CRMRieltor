#!/bin/bash
site=$1
full_name=$1
full_name_not_dot=${full_name//./}
full_name=${full_name:4}
short_name=${site:4}
short_name=${short_name//./}



echo 'Create python virtualenv...'
virtualenv-2.7 data --no-site-packages  
echo 'Activate python virtualenv...'
source data/bin/activate
echo 'Activated'


echo 'Check requirements.txt'
requirements='../crm_rieltor/settings_domen/requirements.txt'
if [ -e $requirements ]; then
    echo "Exists requirements.txt"
else
    echo "Requirements.txt does not exists"
    exit 0
fi
echo 'Start install packages'
pip install -r $requirements
echo 'installed packages'

echo 'Create .htaccess'
sed 's/crm/'$short_name'/g' ../crm_rieltor/settings_domen/.htaccess>.htaccess
echo 'Created'

echo 'Create' ${short_name}'.fcgi'
sed 's/site/'$site'/g' ../crm_rieltor/settings_domen/crm.fcgi>tmp.fcgi
sed 's/crm/'$short_name'/g' tmp.fcgi>$short_name.fcgi
chmod 755 $short_name.fcgi
echo 'Created'

echo 'Create' $short_name 'directory'
mkdir $short_name
echo 'Created'

echo 'Create' $short_name '/' $short_name 'directory'
mkdir $short_name/$short_name
echo 'Created'

echo 'Create' $short_name'/img directory'
mkdir $short_name/img
echo 'Created'

echo 'Create' $short_name'/media directory'
mkdir $short_name/media
mkdir $short_name/media/admin_futer_avatar
cp ../crm_rieltor/settings_domen/img/1.png $short_name/media/admin_futer_avatar/1.png 
mkdir $short_name/media/auto_backup
mkdir $short_name/media/avatar
mkdir $short_name/media/backup_global
mkdir $short_name/media/backup_xls
mkdir $short_name/media/img_obj
mkdir $short_name/media/restore
mkdir $short_name/media/temp_email_logo
mkdir $short_name/media/tmpimg
mkdir $short_name/media/watermark
cp admin-photo_HRGFvAo.jpg $short_name/media/avatar/
cp ../crm_rieltor/settings_domen/phantomjs $short_name/media/phantomjs 
cp -r ../crm_rieltor/templates $short_name/templates 
echo 'Created'
echo 'Create simlink'
cd $short_name
ln -s /hsphere/local/home/image2007/crm_rieltor/arendator
ln -s /hsphere/local/home/image2007/crm_rieltor/backupbd_crm
ln -s /hsphere/local/home/image2007/crm_rieltor/buyer
ln -s /hsphere/local/home/image2007/crm_rieltor/extuser
ln -s /hsphere/local/home/image2007/crm_rieltor/facility
ln -s /hsphere/local/home/image2007/crm_rieltor/homes
ln -s /hsphere/local/home/image2007/crm_rieltor/learning
ln -s /hsphere/local/home/image2007/crm_rieltor/makler
ln -s /hsphere/local/home/image2007/crm_rieltor/meeting
ln -s /hsphere/local/home/image2007/crm_rieltor/notes
ln -s /hsphere/local/home/image2007/crm_rieltor/parsings
ln -s /hsphere/local/home/image2007/crm_rieltor/posting
ln -s /hsphere/local/home/image2007/crm_rieltor/searching
ln -s /hsphere/local/home/image2007/crm_rieltor/send_messege_user
ln -s /hsphere/local/home/image2007/crm_rieltor/sender_email
ln -s /hsphere/local/home/image2007/crm_rieltor/setting_globall
ln -s /hsphere/local/home/image2007/crm_rieltor/setting_street
ln -s /hsphere/local/home/image2007/crm_rieltor/setting_superadmin
ln -s /hsphere/local/home/image2007/crm_rieltor/setting_mail_delivery
ln -s /hsphere/local/home/image2007/crm_rieltor/single_arendator
ln -s /hsphere/local/home/image2007/crm_rieltor/single_buyer
ln -s /hsphere/local/home/image2007/crm_rieltor/single_object
ln -s /hsphere/local/home/image2007/crm_rieltor/tasking
ln -s /hsphere/local/home/image2007/crm_rieltor/trash_object
ln -s /hsphere/local/home/image2007/crm_rieltor/watermark
ln -s /hsphere/local/home/image2007/crm_rieltor/who_online
ln -s /hsphere/local/home/image2007/crm_rieltor/static
cd ..
echo 'Created'

echo 'Create cron.py'
sed 's/crm/'$short_name'/g' ../crm_rieltor/settings_domen/cron.py>$short_name/$short_name/cron.py
echo 'Created'

echo 'Create manage.py'
sed 's/crm/'$short_name'/g' ../crm_rieltor/settings_domen/manage.py>$short_name/manage.py
echo 'Created'


echo 'Create backup_dropbox_settings.py'
cp ../crm_rieltor/crm/backup_dropbox_settings.py $short_name/$short_name/backup_dropbox_settings.py
echo 'Created'

echo 'Create backup_dropbox_settings.py'
sed 's/site/'$site'/g' ../crm_rieltor/settings_domen/settings.py>tmp.py
sed 's/full_name/'$site'/g' tmp.py>tmp2.py
sed 's/carma/'$short_name'/g' tmp2.py>$short_name/$short_name/settings.py
echo 'Created'

echo 'Create urls.py'
cp ../crm_rieltor/crm/urls.py $short_name/$short_name/urls.py
echo 'Created'

echo 'Create backup_dropbox_settings.py'
sed 's/crm/'$short_name'/g' ../crm_rieltor/settings_domen/wsgi.py>$short_name/$short_name/wsgi.py
echo 'Created'

rm tmp.fcgi
rm tmp.py
rm tmp2.py

ln -s /hsphere/local/home/image2007/$site/$short_name/media
ln -s /hsphere/local/home/image2007/crm_rieltor/homes/static

echo 'Dump databases'
psql image20_$full_name_not_dot -W Mongo2nips  -U image20_rieltor < ../crm_rieltor/settings_domen/dump.psql
echo 'Done'

rm install.sh


# pg_dump image20_dom6usatbakrmdnua -U image20_rieltor > dump.psql
#  psql image20_dom6usatbakrmdnua  -U image20_rieltor < dump.psql










# echo 'Delete start.sh'
# rm copy_start.sh