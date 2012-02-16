$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/arthur/arthur-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/arthur/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/arthur/recovery_kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/zte/arthur/recovery/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery\
    device/zte/arthur/recovery/sbin/recovery.sh:/root/sbin/recovery.sh\
    device/zte/arthur/recovery/etc/usb.conf:/root/usb.conf

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_arthur
PRODUCT_DEVICE := arthur
PRODUCT_BRAND := zte

pathmap_INCL := recovery:device/zte/arthur/recovery


