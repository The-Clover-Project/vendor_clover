# Inherit mobile full common Clover stuff
$(call inherit-product, vendor/clover/config/common_mobile_full.mk)

# Inherit tablet common Clover stuff
$(call inherit-product, vendor/clover/config/tablet.mk)

$(call inherit-product, vendor/clover/config/telephony.mk)
