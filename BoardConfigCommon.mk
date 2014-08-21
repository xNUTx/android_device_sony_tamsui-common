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

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/sony/tamsui-common/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/tamsui-common/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Init
BOARD_WANTS_EMMC_BOOT := true

# Platform
TARGET_BOOTLOADER_BOARD_NAME := tamsui
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_VARIANT := cortex-a5
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ARCH_LOWMEM := true

ARCH_ARM_HAVE_TLS_REGISTER := true

COMMON_GLOBAL_CFLAGS += -DANCIENT_GL -DEGL_NEEDS_FNW
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_KERNEL_SOURCE := kernel/sony/msm7x27a
BOARD_KERNEL_BASE := 0x00200000
BOARD_RECOVERY_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_BOOT_ADDRESS := 0x00208000
BOARD_SONY_RAMDISK_ADDRESS := 0x01400000

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_USES_ION := true
TARGET_NO_HW_VSYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_USES_QCOM_BSP := true
BOARD_EGL_CFG := device/sony/tamsui-common/rootdir/system/etc/egl.cfg

# libEGL: allow devices to workaround Google bug 10194508
BOARD_EGL_WORKAROUND_BUG_10194508 := true

TARGET_PROVIDES_LIBLIGHT := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_PROVIDES_LIBAUDIO := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB
BOARD_USES_LEGACY_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DNO_TUNNELED_SOURCE

# Video
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_LEGACY_OMX := true
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Camera
COMMON_GLOBAL_CFLAGS += -DSONY_CAMERA -DQCOM_SONY_HARDWARE
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DQCOM_ICS_DECODERS -DQCOM_ICS_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DNEEDS_VECTORIMPL_SYMBOLS 
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_PMEM_ADSP := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/sony/tamsui-common/vibrator/vibrator.c

# Custom boot
TARGET_NO_SEPARATE_RECOVERY := true
TARGET_RECOVERY_PRE_COMMAND := "/sbin/pre-recovery.sh"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/tamsui-common/custombootimg.mk
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sony/tamsui-common/recovery/recovery-keys.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# RIL
BOARD_RIL_CLASS := ../../../device/sony/tamsui-common/ril/

# Web Rendering
TARGET_FORCE_CPU_UPLOAD := true
ENABLE_WEBGL := true

# Disable adb RSA security and enable adb root when debug
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
ADDITIONAL_DEFAULT_PROPERTIES := ro.adb.secure=0	\
	ro.secure=0
endif
