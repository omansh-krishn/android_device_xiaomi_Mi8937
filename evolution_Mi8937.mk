#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common Evolution-X stuff.
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)
include device/evolution/sepolicy/qcom/sepolicy.mk

# OTA
EVO_OTA_VERSION_CODE := thirteen
PRODUCT_PRODUCT_PROPERTIES += \
    org.evolution.ota.version_code=$(EVO_OTA_VERSION_CODE)

# FLAGS
EVO_BUILD_TYPE := COMMUNITY-OmanshKrishn
EVO_SIGNED := true
TARGET_SUPPORTS_TOUCHGESTURES := true
TARGET_BUILD_APERTURE_CAMERA := true
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_PIXEL_STAND_SUPPORTED := true
TARGET_IS_PIXEL_7 := true
TARGET_IS_PIXEL := true
TARGET_USES_PICO_GAPPS := true
TARGET_BOOT_ANIMATION_RES := 1080

ifeq ($(NEED_GCAM), true)
PRODUCT_PACKAGES += \
    GoogleCamera \
    SCONE
endif

ifeq ($(pixelify), true)
PRODUCT_PACKAGES += \
    NowPlayingOverlay \
    PixelBatteryHealthOverlay \
    PixelDisableLEDOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlay2021 \
    ClearCallingSettingsOverlay2022 \
    PixelConnectivityOverlay2022 \
    DreamlinerOverlay
endif

# Kernel
TARGET_KERNEL_VERSION := 4.9

# Inherit from Mi8937 device
$(call inherit-product, device/xiaomi/Mi8937/device.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    xiaomi_landtoni_overlay_lineage \
    xiaomi_prada_overlay_lineage \
    xiaomi_riva_overlay_lineage \
    xiaomi_rolex_overlay_lineage \
    xiaomi_ulysse_overlay_lineage

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Mi8937
PRODUCT_NAME := evolution_Mi8937
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MSM8937
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="land-user 6.0.1 MMB29M V10.2.2.0.MALMIXM release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "Xiaomi/land/land:6.0.1/MMB29M/V10.2.2.0.MALMIXM:user/release-keys"