# Copyright (C) 2012-2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

COMMON_PATH := device/sony/tamsui-common

DEVICE_PACKAGE_OVERLAYS += device/sony/tamsui-common/overlay

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \

# Ramdisk
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.sony.rc:root/init.sony.rc \
    $(COMMON_PATH)/rootdir/ueventd.sony.rc:root/ueventd.sony.rc \
    $(COMMON_PATH)/rootdir/init.recovery.sony.rc:root/init.recovery.sony.rc

# reboot to recovery
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(COMMON_PATH)/rootdir/pre-recovery.sh:root/sbin/pre-recovery.sh

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# thermald config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/thermald.conf:system/etc/thermald.conf

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libgenlock \
    libI420colorconvert \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libqdutils \
    libtilerenderer \
    memtrack.msm7x27a

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    libaudioutils

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(COMMON_PATH)/rootdir/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# QCOM Power
PRODUCT_PACKAGES += \
    power.msm7x27a \

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27a  

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw \
    libdashplayer

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor
	
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Boot Logo
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/boot/$(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT).rle:root/logo.rle

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a

# Light
PRODUCT_PACKAGES += \
    lights.msm7x27a

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Enable Sony apps in play store
PRODUCT_PACKAGES += \
ro.com.google.clientidbase.ms=android-sonymobile

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# system props for the MM modules
PRODUCT_PROPERTY_OVERRIDES += \
   media.stagefright.enable-player=true \
   media.stagefright.enable-meta=false \
   media.stagefright.enable-scan=true \
   media.stagefright.enable-http=true \
   media.stagefright.enable-fma2dp=true \
   media.stagefright.enable-aac=true \
   media.stagefright.enable-qcp=true \
   debug.camcorder.disablemeta=1   

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyQualcommRIL7x27a \
    ro.telephony.ril.v3=skipnullaid, qcomdsds \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    keyguard.no_require_sim=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.use_data_netmgrd=true \
    persist.data_netmgrd_nint=3 \
    ro.ril.transmitpower=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    com.qc.hardware=true \
    debug.sf.hw=1 \
    debug.composition.type=gpu \
    debug.gr.numframebuffers=3 \
    ro.bq.gpu_to_cpu_unsupported=1
    
# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb    

# Fix legacy fb on kitkat
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=1

## Reference values from CAF
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    ro.max.fling_velocity=4000

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true

# QCOM CpuGovernorService
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

# proprietary side of the board
$(call inherit-product, vendor/sony/tamsui-common/tamsui-common-vendor.mk)
