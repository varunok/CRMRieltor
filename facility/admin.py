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
admin.site.register(facility.models.TypeActuality)
admin.site.register(facility.models.TypeCondition)
admin.site.register(facility.models.TypeNumberOfPerson)
admin.site.register(facility.models.TypeEquipment)
admin.site.register(facility.models.TypeWhereToStay)
admin.site.register(facility.models.TypeThePresenceOfHotWater)
admin.site.register(facility.models.TypePrepayment)
admin.site.register(facility.models.TypeWindows)
admin.site.register(facility.models.TypeHeating)
admin.site.register(facility.models.TypeLavatory)
admin.site.register(facility.models.TypeFurniture)
admin.site.register(facility.models.TypeRooms)
