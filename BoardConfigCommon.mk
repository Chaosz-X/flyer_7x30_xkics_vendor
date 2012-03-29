# Copyright (C) 2011 The CyanogenMod Project
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

-include device/htc/msm7x30-common/BoardConfigCommon.mk

# inherit from common msm7x30 Recovery
-include device/htc/7x30-recovery/BoardConfigCommon.mk
BOARD_USES_QCOM_HARDWARE := true
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
ARCH_ARM_HAVE_VFP := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/ace/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER 	 := WEXT
WPA_SUPPLICANT_VERSION 		 := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER 		 := WEXT
BOARD_HOSTAPD_PRIVATE_LIB 	 := lib_driver_cmd_wext
BOARD_WLAN_DEVICE 		 := bcm4329
WIFI_DRIVER_FW_PATH_PARAM 	 := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH 	 := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA 	 := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP 		 := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_STA_PATH 	 := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH 		 := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_VOIPMUTE := true
BOARD_USES_QCOM_RESETALL := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 1200

BOARD_EGL_CFG := device/htc/ace/egl.cfg

#BOARD_EGL_GRALLOC_USAGE_FILTER := true
#BOARD_NO_RGBX_8888 := true
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE

TARGET_USES_CPUUPLOAD := true
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

#HW accel
BOARD_USES_ADRENO_200 := true

ENABLE_WTF_USE_ACCELERATED_COMPOSITING := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
USE_OPENGL_RENDERER := true
BOARD_USES_GENLOCK := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_QCOM_HDMI_OUT := false
TARGET_USES_OVERLAY := true
TARGET_GRALLOC_USES_ASHMEM := true

#USB mount
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

#BOARD_CAMERA_USE_GETBUFFERINFO := true

#BOARD_OVERLAY_FORMAT_YCbCr_420_SP := true

BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

#EGL hack flags
#USE_OPENGL_RENDERER := false
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_GRALLOC_BUFFERS -DMISSING_EGL_PIXEL_FORMAT_YV12
