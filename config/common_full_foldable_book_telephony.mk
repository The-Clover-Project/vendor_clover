# Inherit mobile full common Clover stuff
$(call inherit-product, vendor/clover/config/common_mobile_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# Inherit tablet common Clover stuff
$(call inherit-product, vendor/clover/config/tablet.mk)

$(call inherit-product, vendor/clover/config/telephony.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/clover/overlay/foldable_book
