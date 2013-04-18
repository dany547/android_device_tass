$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/tass/tass-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/tass/overlay

LOCAL_PATH := device/samsung/tass
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_tass
PRODUCT_DEVICE := tass

## Modules
PRODUCT_COPY_FILES += \
    device/samsung/tass/recovery/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/tass/recovery/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/tass/recovery/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/tass/ramdisk/ueventd.gt-s5570board.rc:root/ueventd.gt-s5570board.rc \
    device/samsung/tass/ramdisk/init.gt-s5570board.rc:root/init.gt-s5570board.rc \
    device/samsung/tass/ramdisk/init.gt-s5570board.usb.rc:root/init.gt-s5570board.usb.rc \
    #device/samsung/tass/ramdisk/TASS.rle:root/TASS.rle 


# ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1

