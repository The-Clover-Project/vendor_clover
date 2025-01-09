PRODUCT_VERSION_MAJOR = 2
PRODUCT_VERSION_MINOR = 1

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

CLOVER_BUILDTYPE ?= UNOFFICIAL

CLOVER_VERSION := CloverProject-v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(CURRENT_DEVICE)-$(CLOVER_BUILDTYPE)-$(shell date -u +%Y%m%d-%H%M)

# Display version
CLOVER_DISPLAY_VERSION := v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

# The Clover Project version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.clover.version=$(CLOVER_VERSION) \
    ro.clover.device=$(CLOVER_BUILD) \
    ro.clover.display.version=$(CLOVER_DISPLAY_VERSION) \
    ro.clover.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.clover.releasetype=$(CLOVER_BUILDTYPE) \
    ro.modversion=$(CLOVER_VERSION)

# Signing
-include vendor/clover-priv/keys/keys.mk