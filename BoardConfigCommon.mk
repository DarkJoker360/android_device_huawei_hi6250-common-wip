#
# Copyright 2020 The LineageOS Project
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
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

include build/make/target/board/generic_arm64_a/BoardConfig.mk

VENDOR_PATH := device/huawei/hi6250-common

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(VENDOR_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
TARGET_CAMERA_NEEDS_ADD_STATES_IN_ENUMERATE := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2080000U

# Graphics
TARGET_EXFAT_DRIVER := exfat

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := /dev/null

ifneq ($(TARGET_AOSP_BASED),)
PRODUCT_COPY_FILES += \
        $(TARGET_PREBUILT_KERNEL):kernel
endif

# LineageOS Hardware
BOARD_HARDWARE_CLASS += \
    $(VENDOR_PATH)/lineagehw

# Partitions
ifeq ($(BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE),)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3707764736
endif
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop

# Radio
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Recovery
BOARD_PROVIDES_BOOTLOADER_MESSAGE := true
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/rootdir/etc/fstab.hi6250

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(VENDOR_PATH)/releasetools

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(VENDOR_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(VENDOR_PATH)/sepolicy/public

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib64/libdisplayenginesvc_1_0.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libdisplayenginesvc_1_1.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libhwsmartdisplay_jni.so|libshims_hwsmartdisplay_jni.so \
    /vendor/bin/hw/vendor.huawei.hardware.hisupl@1.0-service|libshims_hisupl.so

# Vintf
DEVICE_FRAMEWORK_MANIFEST_FILE := $(VENDOR_PATH)/framework_manifest.xml
