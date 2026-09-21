# Inherit mobile mini common Clover stuff
$(call inherit-product, vendor/clover/config/common_mobile_mini.mk)

# Inherit tablet common Clover stuff
$(call inherit-product, vendor/clover/config/tablet.mk)

$(call inherit-product, vendor/clover/config/telephony.mk)
