PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 0

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(CLOVER_VERSION_APPEND_TIME_OF_DAY),true)
    CLOVER_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    CLOVER_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

CLOVER_BUILDTYPE ?= UNOFFICIAL

WITH_GMS ?= true
ifeq ($(WITH_GMS),true)
CLOVER_FLAVOUR := GMS
else
CLOVER_FLAVOUR := VANILLA
endif

CLOVER_VERSION := CloverProject-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(CLOVER_BUILD_DATE)-$(CLOVER_BUILDTYPE)-$(CURRENT_DEVICE)-$(CLOVER_FLAVOUR)

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
