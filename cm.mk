## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := tass

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/tass/device_tass.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tass
PRODUCT_NAME := cm_tass
PRODUCT_BRAND := samsung
PRODUCT_MODEL := tass
PRODUCT_MANUFACTURER := samsung
