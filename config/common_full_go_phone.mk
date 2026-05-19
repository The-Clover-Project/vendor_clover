# Set Clover specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Clover stuff
$(call inherit-product, vendor/clover/config/common_full_phone.mk)
