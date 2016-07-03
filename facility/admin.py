from django.contrib import admin
from facility.models import TypeFacility, AddressFacilityData, TypeOperations, TypeContactOwner
# Register your models here.

admin.site.register(TypeFacility)
admin.site.register(AddressFacilityData)
admin.site.register(TypeOperations)
admin.site.register(TypeContactOwner)