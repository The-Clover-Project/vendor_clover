PRODUCT_VERSION_MAJOR = 3
PRODUCT_VERSION_MINOR = 8

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

CLOVER_BUILDTYPE ?= UNOFFICIAL

CLOVER_VERSION := CloverProject-v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(CURRENT_DEVICE)-$(CLOVER_BUILDTYPE)-$(shell date -u +%Y%m%d-%H%M)

# Display version
CLOVER_DISPLAY_VERSION := v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

# The Clover Project version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.clover.version=$(CLOVER_VERSION) \
    ro.clover.device=$(CLOVER_BUILD) \
    ro.clover.maintainer=$(CLOVER_MAINTAINER) \
    ro.clover.display.version=$(CLOVER_DISPLAY_VERSION) \
    ro.clover.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.clover.releasetype=$(CLOVER_BUILDTYPE)

# Signing
-include vendor/clover-priv/keys/keys.mk