#
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/flyer/init.flyer.rc:root/init.flyer.rc \
    device/htc/flyer/init.flyer.usb.rc:root/init.flyer.usb.rc \
    device/htc/flyer/ueventd.flyer.rc:root/ueventd.flyer.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/flyer/flyer-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Script for telling ICS boot is complete - needed for init.d support
PRODUCT_COPY_FILES += \
    device/htc/flyer/init.d/100complete:system/etc/init.d/100complete

# Nexus Prime bootanimation
PRODUCT_COPY_FILES += \
    device/htc/flyer/media/bootanimation.zip:system/media/bootanimation.zip

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

# I think this is not needed because we disabled it anyway
DEVICE_PACKAGE_OVERLAYS += device/htc/flyer/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/flyer/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    lights.flyer \
    sensors.flyer \
    audio.a2dp.default \
    gps.flyer \
    hwcomposer.msm7x30 \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libgenlock \
    libmemalloc \
#   liboverlay \
    libaudioutils \
    libtinyalsa \
    libcyanogen-dsp \
    com.android.future.usb.accessory \
    libQcomUI \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    librs_jni

# missing packages
PRODUCT_PACKAGES += \
    Mms \
#   Stk \
    Superuser

# Live Wallpapers
PRODUCT_PACKAGES += \
	Basic \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
	MagicSmoke \
	NoiseField \
	PhaseBeam \
	LivePicker \
	HoloSpiral \
	Galaxy4 \
	DSPManager \
	Gallery2 \
	FileManager \
	Torch \
	CMSettings \
	Trebuchet \
	VoiceDialer


# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/flyer/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/flyer/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/flyer/keychars/flyer-keypad-v0.kcm.bin:system/usr/keychars/flyer-keypad-v0.kcm.bin \
    device/htc/flyer/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/flyer/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/flyer/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/flyer/keylayout/flyer-keypad.kl:system/usr/keylayout/flyer-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/flyer/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/flyer/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/flyer/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/flyer/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/flyer/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/flyer/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/flyer/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/flyer/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/flyer/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/flyer/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/flyer/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/flyer/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/flyer/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/flyer/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/flyer/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/flyer/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/flyer/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/flyer/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/flyer/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/flyer/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/flyer/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/flyer/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/flyer/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/flyer/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/flyer/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/flyer/dsp/gps.conf:/system/etc/gps.conf

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/flyer/nam/default.acdb:system/etc/nam/default.acdb \
    device/htc/flyer/nam/default_org.acdb:system/etc/nam/default_org.acdb \
    device/htc/flyer/nam/AdieHWCodec.csv:system/etc/nam/AdieHWCodec.csv \
    device/htc/flyer/nam/AIC3254_REG_DualMic_MCLK.csv:system/etc/nam/AIC3254_REG_DualMic_MCLK.csv \
    device/htc/flyer/nam/CodecDSPID_MCLK.txt:system/etc/nam/CodecDSPID_MCLK.txt \
    device/htc/flyer/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/flyer/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/flyer/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/flyer/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/flyer/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/flyer/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/flyer/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/flyer/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/flyer/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/flyer/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/flyer/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/flyer/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/flyer/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/flyer/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/flyer/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/flyer/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/flyer/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/flyer/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/flyer/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/flyer/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/flyer/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/flyer/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt \
    device/htc/flyer/nam/gps.conf:system/etc/nam/gps.conf

PRODUCT_COPY_FILES += \
    device/htc/flyer/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/flyer/kernel/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/flyer/kernel/modules/qc_pcm_in.ko:system/lib/modules/qc_pcm_in.ko
#   device/htc/ace/kernel/modules/cifs.ko:system/lib/modules/cifs.ko 
#   device/htc/ace/kernel/modules/tun.ko:system/lib/modules/tun.ko

LOCAL_KERNEL := device/htc/flyer/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
#$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# High-density art, but English locale
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media profiles and capabilities spec
#$(call inherit-product, device/htc/ace/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/flyer/media_htcaudio.mk)

#$(call inherit-product-if-exists, vendor/htc/ace/ace-vendor.mk)


# prop

PRODUCT_COPY_FILES += \
    device/htc/flyer/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for ace
PRODUCT_COPY_FILES += \
    device/htc/flyer/proprietary/akmd:/system/bin/akmd \
    device/htc/flyer/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/flyer/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/flyer/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/flyer/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/flyer/proprietary/snd3254:/system/bin/snd3254 \
    device/htc/flyer/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/flyer/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/flyer/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/flyer/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/flyer/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/flyer/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/flyer/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/flyer/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/flyer/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/flyer/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/flyer/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/flyer/proprietary/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/flyer/proprietary/libC2D2.so:/system/lib/libC2D2.so \
    device/htc/flyer/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \
    device/htc/flyer/proprietary/libsc-a2xx.so:/system/lib/libsc-a2xx.so

# idc
PRODUCT_COPY_FILES += \
    device/htc/flyer/idc/synaptics-rmi-touchscreen.idc:/system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/ace/idc/Ntrig-touchscreen.idc:/system/usr/idc/Ntrig-touchscreen.idc \
    device/htc/flyer/idc/Ntrig-Pen-touchscreen.idc:/system/usr/idc/Ntrig-Pen-touchscreen.idc \

PRODUCT_NAME := htc_flyer
PRODUCT_DEVICE := flyer
PRODUCT_MODEL := HTC Flyer
PRODUCT_MANUFACTURER := HTC

PRODUCT_PROPERTY_OVERRIDES += \
 ro.telephony.ril.v3=signalstrength
