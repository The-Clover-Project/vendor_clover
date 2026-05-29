PRODUCT_PACKAGES += \
    Camelot \
	CloverSetupWizard \
	Contacts \
    Dialer \
    DeskClock \
    Etar \
    ExactCalculator \
    Glimpse \
    Jelly \
	LatinIME \
	Launcher3QuickStep \
    messaging \
	Recorder \
    SettingsIntelligence \
    ThemePicker \
    Twelve \
    WallpaperPicker2

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/clover/overlay/vanilla

PRODUCT_PACKAGES += \
    LatinIMEOverlayVanilla \
    SettingsOverlayVanilla

# Prebuilts
include vendor/prebuilts/prebuilts.mk
