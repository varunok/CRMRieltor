# -*- coding: utf-8 -*-


def change_form_text(form):
    form._errors['rooms_from'] = '• Введите число'
    form._errors['rooms_to'] = '• Введите число'
    form._errors['floors_from'] = '• Введите число'
    form._errors['floors_to'] = '• Введите число'
    form._errors['area_from'] = '• Введите число'
    form._errors['area_to'] = '• Введите число'
    form._errors['price_from'] = '• Введите число'
    form._errors['price_to'] = '• Введите число'
    form._errors['phone_first'] = '• Введите число'
    form._errors['phone_second'] = '• Введите число'
    return form
