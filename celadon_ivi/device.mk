# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/dynamic-partitions/true/product.mk
##############################################################
# Enable dynamic partitions feature
PRODUCT_USE_DYNAMIC_PARTITIONS := true

#Enable userspace fastboot
PRODUCT_PACKAGES += fastbootd \
                    android.hardware.fastboot@1.0-impl-mock

#copy fstab to ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/fstab:$(TARGET_COPY_OUT_RAMDISK)/fstab.$(TARGET_PRODUCT)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/fstab:$(PRODUCT_OUT)/recovery/root/first_stage_ramdisk/fstab.$(TARGET_PRODUCT)

SUPER_IMG_IN_FLASHZIP := true
##############################################################
# Source: device/intel/mixins/groups/slot-ab/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    libavb \
    bootctrl.avb \
    bootctrl.intel \
    bootctrl.intel.static \
    update_engine_sideload \
    avbctl \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.bootctrl=intel

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/slot-ab/postinstall.sh:vendor/bin/postinstall
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/slot-ab/postinstall.sh:recovery/root/vendor/bin/postinstall
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/product.mk
##############################################################
TARGET_UEFI_ARCH := x86_64

# Android Kernelflinger uses the OpenSSL library to support the
# bootloader policy
KERNELFLINGER_SSL_LIBRARY := openssl

BIOS_VARIANT := release


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(TARGET_PRODUCT)

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.verified_boot.xml:vendor/etc/permissions/android.software.verified_boot.xml

# Allow Kernelflinger to ignore the non-standard RSCI ACPI table
# to get reset and wake source from PMIC for bringup phase if
# the table reports incorrect data
KERNELFLINGER_IGNORE_RSCI := true
# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.oem_unlock_supported=1
# Allow Kernelflinger to ignore the RSCI reset source "not_applicable"
# when setting the bootreason
KERNELFLINGER_IGNORE_NOT_APPLICABLE_RESET := true

KERNELFLINGER_SUPPORT_SELF_USB_DEVICE_MODE_PROTOCOL := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/persistent

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/boot-arch/update_ifwi_ab.sh:vendor/bin/update_ifwi_ab
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/boot-arch/update_ifwi_ab.sh:recovery/root/vendor/bin/update_ifwi_ab

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

KERNELFLINGER_SUPPORT_KEYBOX_PROVISION := true
##############################################################
# Source: device/intel/mixins/groups/wlan/iwlwifi/product.mk
##############################################################
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_cli \
    iw

PRODUCT_PACKAGES += \
  android.hardware.wifi@1.0-service

# FW and PNVM
PRODUCT_PACKAGES += \
    iwl-nvm

# iwlwifi USC
PRODUCT_PACKAGES += \
    wifi_intel_usc

#copy iwlwifi wpa config files
PRODUCT_COPY_FILES += \
        $(INTEL_PATH_COMMON)/wlan/wpa_supplicant-common.conf:vendor/etc/wifi/wpa_supplicant.conf \
        $(INTEL_PATH_COMMON)/wlan/iwlwifi/wpa_supplicant_overlay.conf:vendor/etc/wifi/wpa_supplicant_overlay.conf \
        $(INTEL_PATH_COMMON)/wlan/iwlwifi/p2p_supplicant_overlay.conf:vendor/etc/wifi/p2p_supplicant_overlay.conf \
        frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:vendor/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
    vendor/linux/firmware/iwlwifi-9260-th-b0-jf-b0-43.ucode:$(TARGET_COPY_OUT_VENDOR)/firmware/iwlwifi-9260-th-b0-jf-b0-43.ucode \
    vendor/linux/firmware/iwlwifi-3168-29.ucode:$(TARGET_COPY_OUT_VENDOR)/firmware/iwlwifi-3168-29.ucode \
    vendor/linux/firmware/iwlwifi-8265-36.ucode:$(TARGET_COPY_OUT_VENDOR)/firmware/iwlwifi-8265-36.ucode


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.wifi.softap_dualband_allow=false

PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/wlan/overlay-disable_keepalive_offload
##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/product.mk.1
##############################################################
TARGET_KERNEL_ARCH := x86_64

##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/product.mk
##############################################################

KERNEL_MODULES_ROOT_PATH ?= vendor/lib/modules
KERNEL_MODULES_ROOT ?= $(KERNEL_MODULES_ROOT_PATH)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.boot.moduleslocation=/$(KERNEL_MODULES_ROOT_PATH)
##############################################################
# Source: device/intel/mixins/groups/sepolicy/enforcing/product.mk
##############################################################
PRODUCT_PACKAGES += sepolicy-areq-checker
##############################################################
# Source: device/intel/mixins/groups/bluetooth/btusb/product.mk
##############################################################
# Bluetooth tools eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    hciconfig \
    btmon \
    hcitool
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    vendor/linux/firmware/intel/ibt-18-16-1.ddc:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-18-16-1.ddc \
    vendor/linux/firmware/intel/ibt-18-16-1.sfi:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-18-16-1.sfi \
    vendor/linux/firmware/intel/ibt-18-2.ddc:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-18-2.ddc \
    vendor/linux/firmware/intel/ibt-18-2.sfi:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-18-2.sfi \
    vendor/linux/firmware/intel/ibt-12-16.ddc:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-12-16.ddc \
    vendor/linux/firmware/intel/ibt-12-16.sfi:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-12-16.sfi \
    vendor/linux/firmware/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq:$(TARGET_COPY_OUT_VENDOR)/firmware/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/extra_files/bluetooth/bluetooth_auto_detection.sh:vendor/bin/bluetooth_auto_detection.sh

PRODUCT_PROPERTY_OVERRIDES += bluetooth.rfkill=1

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service.vbt \
    libbt-vendor \

PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/bluetooth/overlay-car
PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/bluetooth/intel/car/overlay


##############################################################
# Source: device/intel/mixins/groups/audio/project-celadon/product.mk
##############################################################
TARGET_BOARD_PLATFORM := broxton

# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo \
    tinyprobe

# Audio HALs
PRODUCT_PACKAGES += meta.package.audio

# Sound Trigger HAL
PRODUCT_PACKAGES += \
       sound_trigger.primary.$(TARGET_BOARD_PLATFORM)

# Audio Primary HAL
PRODUCT_PACKAGES += \
       audio.primary.$(TARGET_BOARD_PLATFORM)

# Extended Audio HALs
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio.usb.default \
    audio.usb.$(TARGET_BOARD_PLATFORM) \
    audio.hdmi.$(TARGET_BOARD_PLATFORM) \
    audio_policy.default.so \
    audio_configuration_files

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@2.0-service

#Audio policy engine configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_criteria.conf:vendor/etc/audio_policy_criteria.conf \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_engine_product_strategies.xml:vendor/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_engine_configuration.xml:vendor/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_engine_criteria.xml:vendor/etc/audio_policy_engine_criteria.xml \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_engine_criterion_types.xml.in:vendor/etc/audio_policy_engine_criterion_types.xml.in

# Vendor audio configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_configuration.xml:vendor/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/a2dp_audio_policy_configuration.xml:vendor/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/r_submix_audio_policy_configuration.xml:vendor/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/usb_audio_policy_configuration.xml:vendor/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/hdmi_audio_policy_configuration.xml:vendor/etc/hdmi_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_volumes.xml:vendor/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default/policy/default_volume_tables.xml:vendor/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/default/effect/audio_effects.xml:vendor/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/default/mixer_paths_0.xml:vendor/etc/mixer_paths_0.xml

#fallback
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/fallback/audio_policy_configuration_generic.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/primary_audio_policy_configuration.xml:system/etc/primary_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/default_volume_tables.xml:system/etc/default_volume_tables.xml


PRODUCT_PROPERTY_OVERRIDES += audio.safemedia.bypass=true

PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/audio/overlay-car-legacy
##############################################################
# Source: device/intel/mixins/groups/device-type/car/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/car_core_hardware.xml:vendor/etc/permissions/car_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:vendor/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:vendor/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.broadcastradio.xml:vendor/etc/permissions/android.hardware.broadcastradio.xml \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:vendor/etc/permissions/android.software.activities_on_secondary_displays.xml \
    $(INTEL_PATH_COMMON)/framework/android.software.cant_save_state.xml:vendor/etc/permissions/android.software.cant_save_state.xml

# Make sure vendor car product overlays take precedence than google definition
# under packages/services/Car/car_product/overlay/
PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/device-type/overlay-car
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

PRODUCT_PACKAGES += \
    radio.fm.default \
    CarSettings \
    VmsPublisherClientSample \
    VmsSubscriberClientSample \


PRODUCT_PACKAGES += android.hardware.automotive.audiocontrol@1.0-service.intel

PRODUCT_PACKAGES += android.hardware.automotive.vehicle@2.0-service \
    android.hardware.automotive.vehicle@2.0-impl

VEHICLE_HAL_PROTO_TYPE := google-emulator
##############################################################
# Source: device/intel/mixins/groups/device-specific/celadon_ivi/product.mk
##############################################################
TARGET_BOARD_PLATFORM := broxton

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.rc:root/init.recovery.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \

PRODUCT_PACKAGES += android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service \
                    android.hardware.wifi@1.0-service \
                    android.hardware.bluetooth@1.0-service.vbt \
                    android.hardware.usb@1.0-impl \
                    android.hardware.usb@1.0-service \
                    android.hardware.dumpstate@1.0-impl \
                    android.hardware.dumpstate@1.0-service \
                     android.hardware.graphics.mapper@2.0-impl-2.1  \
                    android.hardware.graphics.allocator@2.0-impl \
                    android.hardware.graphics.allocator@2.0-service \
                    android.hardware.renderscript@1.0-impl \
                    android.hardware.graphics.composer@2.3-service \
                    libbt-vendor

PRODUCT_COPY_FILES += $(LOCAL_PATH)/manifest.xml:vendor/manifest.xml

PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=enforce
##############################################################
# Source: device/intel/mixins/groups/trusty/true/product.mk
##############################################################

KM_VERSION := 2

ifeq ($(KM_VERSION),2)
PRODUCT_PACKAGES += \
	keystore.trusty
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.keystore=trusty
endif

ifeq ($(KM_VERSION),1)
PRODUCT_PACKAGES += \
	keystore.${TARGET_BOARD_PLATFORM}
endif

PRODUCT_PACKAGES += \
	libtrusty \
	storageproxyd \
	libinteltrustystorage \
	libinteltrustystorageinterface \
	gatekeeper.trusty \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service \

PRODUCT_PACKAGES_DEBUG += \
	intel-secure-storage-unit-test \
	gatekeeper-unit-tests \
	libscrypt_static \
	scrypt_test \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.gatekeeper=trusty \
##############################################################
# Source: device/intel/mixins/groups/vendor-partition/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/sh_recovery:recovery/root/vendor/bin/sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/mkshrc_recovery:recovery/root/vendor/etc/mkshrc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/toolbox_recovery:recovery/root/vendor/bin/toolbox_static
PRODUCT_PACKAGES += \
     toybox_static \
     toybox_vendor \
##############################################################
# Source: device/intel/mixins/groups/display-density/medium/product.mk
##############################################################
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
##############################################################
# Source: device/intel/mixins/groups/dalvik-heap/tablet-10in-xhdpi-2048/product.mk
##############################################################
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

##############################################################
# Source: device/intel/mixins/groups/pstore/ram_dummy/product.mk
##############################################################
PRODUCT_PACKAGES += \
    pstore-clean
##############################################################
# Source: device/intel/mixins/groups/media/mesa/product.mk
##############################################################
# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw

# Open source media_driver
PRODUCT_PACKAGES += i965_drv_video
PRODUCT_PACKAGES += libigfxcmrt

# Open source hdcp
PRODUCT_PACKAGES += libhdcpsdk
PRODUCT_PACKAGES += lihdcpcommon

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxhw64
endif


BOARD_HAVE_MEDIASDK_OPEN_SOURCE := true

BOARD_HAVE_OMX_SRC := true

PRODUCT_PACKAGES += \
    libpciaccess
##############################################################
# Source: device/intel/mixins/groups/graphics/mesa/product.mk
##############################################################
# Mesa
PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android

PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libsync \
    libmd

PRODUCT_PACKAGES += ufo_prebuilts

# i915 firmwares
$(foreach fw,$(I915_FW),$(eval PRODUCT_PACKAGES += $(notdir $(fw))))

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/graphics/drirc:system/etc/drirc


# HWComposer IA
PRODUCT_PACKAGES += \
    hwcomposer.$(TARGET_BOARD_PLATFORM)

PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware.hwcomposer=$(TARGET_BOARD_PLATFORM)

INTEL_HWC_CONFIG := $(INTEL_PATH_VENDOR)/external/hwcomposer-intel

ifeq ($(findstring _acrn,$(TARGET_PRODUCT)),_acrn)
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display_virt.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
else
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
endif


# Mini gbm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=$(TARGET_BOARD_PLATFORM)

PRODUCT_PACKAGES += \
    gralloc.$(TARGET_BOARD_PLATFORM)



# Mesa
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:vendor/etc/permissions/android.hardware.opengles.aep.xml

# GLES version
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196610

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:vendor/etc/permissions/android.hardware.vulkan.level.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:vendor/etc/permissions/android.hardware.vulkan.compute.xml


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:vendor/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_PACKAGES += \
    vulkan.$(TARGET_BOARD_PLATFORM) \
    libvulkan_intel

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=$(TARGET_BOARD_PLATFORM)
##############################################################
# Source: device/intel/mixins/groups/ethernet/dhcp/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml
##############################################################
# Source: device/intel/mixins/groups/camera-ext/ext-camera-only/product.mk
##############################################################
# Camera: Device-specific configuration files. Supports only External USB camera, no CSI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:vendor/etc/permissions/android.hardware.camera.external.xml \
    $(LOCAL_PATH)/extra_files/camera-ext/external_camera_config.xml:vendor/etc/external_camera_config.xml

# External camera service
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-external-service \
                    android.hardware.camera.provider@2.4-impl

# Only include test apps in eng or userdebug builds.
PRODUCT_PACKAGES_DEBUG += TestingCamera

PRODUCT_PACKAGES += MultiCameraApp
##############################################################
# Source: device/intel/mixins/groups/rfkill/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/rfkill/rfkill-init.sh:vendor/bin/rfkill-init.sh
##############################################################
# Source: device/intel/mixins/groups/codecs/configurable/product.mk
##############################################################
# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:vendor/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs.xml:vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core.conf:vendor/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles_1080p.xml:vendor/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_bxt.xml:vendor/etc/media_codecs_performance.xml
##############################################################
# Source: device/intel/mixins/groups/usb/host/product.mk
##############################################################
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:vendor/etc/permissions/android.hardware.usb.host.xml

##############################################################
# Source: device/intel/mixins/groups/usb-gadget/configfs/product.mk
##############################################################
ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable Secure Debugging
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1

ifeq ($(BUILD_FOR_CTS_AUTOMATION),true)
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
endif #BUILD_FOR_CTS_AUTOMATION == true
endif #TARGET_BUILD_VARIANT == user

# Add Intel adb keys for userdebug/eng builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
endif
##############################################################
# Source: device/intel/mixins/groups/midi/true/product.mk
##############################################################
# MIDI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:vendor/etc/permissions/android.software.midi.xml
##############################################################
# Source: device/intel/mixins/groups/touch/galax7200/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:vendor/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml\
        $(INTEL_PATH_COMMON)/touch/Vendor_0eef_Product_7200.idc:system/usr/idc/Vendor_0eef_Product_7200.idc
##############################################################
# Source: device/intel/mixins/groups/debug-tools/true/product.mk
##############################################################
PRODUCT_PACKAGES_DEBUG += \
    AndroidTerm \
    libjackpal-androidterm4 \
    peeknpoke \
    pytimechart-record \
    lspci \
    llvm-symbolizer
##############################################################
# Source: device/intel/mixins/groups/fota/true/product.mk
##############################################################
# Enable FOTA for non user builds
PRODUCT_PACKAGES_DEBUG += AFotaApp

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.fota.ota_stream=disabled

AFOTAAPP_EULA_PATH := 
AFOTAAPP_LOG_LEVEL := DEBUG
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/fota
endif
##############################################################
# Source: device/intel/mixins/groups/thermal/thermal-daemon/product.mk
##############################################################
# thermal-daemon
PRODUCT_PACKAGES += thermal-daemon
PRODUCT_COPY_FILES += \
	$(INTEL_PATH_COMMON)/thermal/thermal-daemon/thermal-conf.xml:/vendor/etc/thermal-daemon/thermal-conf.xml \
	$(INTEL_PATH_COMMON)/thermal/thermal-daemon/thermal-cpu-cdev-order.xml:/vendor/etc/thermal-daemon/thermal-cpu-cdev-order.xml

# Thermal Hal
PRODUCT_PACKAGES += android.hardware.thermal@2.0-service.intel
##############################################################
# Source: device/intel/mixins/groups/debug-crashlogd/true/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
MIXIN_DEBUG_LOGS := true
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/extra_files/debug-crashlogd/init.crashlogd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.crashlogd.rc \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/extra_files/debug-crashlogd/crashlog.conf:$(TARGET_COPY_OUT_VENDOR)/etc/crashlog.conf)
PRODUCT_PACKAGES += crashlogd \
	dumpstate_dropbox.sh \
	elogs.sh \
	aplog.sh \
	logfs.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.crashlogd.data_quota=50
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.service.default_logfs=apklogfs
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.logd.kernel.raw_message=False
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.logd.logpersistd.count=20
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.logd.logpersistd.rotate_kbytes=5000
endif
##############################################################
# Source: device/intel/mixins/groups/debug-phonedoctor/true/product.mk
##############################################################
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_PACKAGES += crash_package
endif
##############################################################
# Source: device/intel/mixins/groups/power/true/product.mk
##############################################################
# Power HAL
PRODUCT_PACKAGES += power.$(TARGET_BOARD_PLATFORM) \
                    android.hardware.power@1.2-service \
                    android.hardware.power@1.2-impl \
                    power_hal_helper

##############################################################
# Source: device/intel/mixins/groups/debug-usb-config/true/product.mk
##############################################################
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.debug.dvc.protocol=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.debug.dvc.source_dev=dvcith-0-msc0
##############################################################
# Source: device/intel/mixins/groups/intel_prop/true/product.mk
##############################################################

ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PACKAGES += intel_prop

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/intel_prop/intel_prop.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/intel_prop.cfg
endif
##############################################################
# Source: device/intel/mixins/groups/memtrack/true/product.mk
##############################################################
# memtrack HAL
PRODUCT_PACKAGES += \
        memtrack.$(TARGET_BOARD_PLATFORM) \
	android.hardware.memtrack@1.0-service \
	android.hardware.memtrack@1.0-impl
##############################################################
# Source: device/intel/mixins/groups/health/true/product.mk
##############################################################
PRODUCT_PACKAGES += health

PRODUCT_PACKAGES += android.hardware.health@2.0-service.intel
##############################################################
# Source: device/intel/mixins/groups/abota-fw/true/product.mk
##############################################################
ABOTA_BOOTARCH=project-celadon


##############################################################
# Source: device/intel/mixins/groups/usb-otg-switch/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/usb-otg-switch/usb_otg_switch.sh:vendor/bin/usb_otg_switch.sh
##############################################################
# Source: device/intel/mixins/groups/public-libraries/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/public-libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
##############################################################
# Source: device/intel/mixins/groups/hdcpd/true/product.mk
##############################################################
# Enable media content protection services

# HDCP Daemon
PRODUCT_PACKAGES += hdcpd
##############################################################
# Source: device/intel/mixins/groups/neuralnetworks/true/product.mk
##############################################################
# neuralnetworks HAL
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.2-generic-service \
    android.hardware.neuralnetworks@1.2-generic-impl \
    android.hardware.neuralnetworks@1.2-service-gpgpu

PRODUCT_PACKAGES += \
    libinference_engine

PRODUCT_PACKAGES += \
    libMKLDNNPlugin\
    libmkldnn

PRODUCT_PACKAGES += \
    graphtest_cpu
##############################################################
# Source: device/intel/mixins/groups/load_modules/true/product.mk
##############################################################
PRODUCT_PACKAGES += load_modules.sh
##############################################################
# Source: device/intel/mixins/groups/swap/zram_auto/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/check_lowmem.sh:$(TARGET_COPY_OUT_VENDOR)/bin/check_lowmem.sh
##############################################################
# Source: device/intel/mixins/groups/art-config/true/product.mk
##############################################################
# This is needed to enable silver art optimizer.
VENDOR_ART_PATH ?= $(INTEL_PATH_VENDOR)/art-extension

PRODUCT_PACKAGES_TESTS += \
    art-run-tests \
    libarttest \
    libnativebridgetest \
    libart-gtest
##############################################################
# Source: device/intel/mixins/groups/psdapp/true/product.mk
##############################################################
PRODUCT_PACKAGES += psdapp
##############################################################
# Source: device/intel/mixins/groups/filesystem_config/common/product.mk
##############################################################
PRODUCT_PACKAGES += \
	fs_config_files \
	fs_config_dirs

##############################################################
# Source: device/intel/mixins/groups/dbc/true/product.mk
##############################################################
# set default DBC configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.usb.adbover=dwc
##############################################################
# Source: device/intel/mixins/groups/atrace/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service
##############################################################
# Source: device/intel/mixins/groups/firmware/true/product.mk
##############################################################
FIRMWARES_DIR ?= vendor/linux/firmware

$(call inherit-product,device/intel/common/firmware.mk)
##############################################################
# Source: device/intel/mixins/groups/evs/true/product.mk
##############################################################
PRODUCT_PACKAGES += android.hardware.automotive.evs@1.0-sample \
                    evs_app \
                    evs_app_default_resources
##############################################################
# Source: device/intel/mixins/groups/default-drm/true/product.mk
##############################################################
#only enable default drm service
PRODUCT_PACKAGES += android.hardware.drm@1.0-service \
                    android.hardware.drm@1.0-impl \
                    android.hardware.drm@1.2-service.clearkey

##############################################################
# Source: device/intel/mixins/groups/debug-unresponsive/default/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dropbox.max_size_kb=4096

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.binder_stats.uiwdt=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.binder_stats.anr=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.peer_depth=3

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.stacks_timeout=1500

endif
# ------------------ END MIX-IN DEFINITIONS ------------------
