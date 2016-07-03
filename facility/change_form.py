# -*- coding: utf-8 -*-


def change_form_text(form):
    form._errors['street_obj'] = 'Обязательное поле'
    form._errors['district_obj'] = 'Обязательное поле'
    form._errors['subway_obj'] = 'Обязательное поле'
    form._errors['type_facilit'] = 'Обязательное поле'
    return form