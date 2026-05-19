# Set Clover specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Clover stuff
$(call inherit-product, vendor/clover/config/common_mini_phone.mk)
