from django.contrib import admin
import facility.models
# Register your models here.

admin.site.register(facility.models.TypeFacility)
admin.site.register(facility.models.AddressFacilityData)
admin.site.register(facility.models.TypeOperations)
admin.site.register(facility.models.TypeContactOwner)
admin.site.register(facility.models.ContactOwner)
admin.site.register(facility.models.PhoneOwner)
admin.site.register(facility.models.TypeBuilding)
admin.site.register(facility.models.TypeRepairs)