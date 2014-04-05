#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.opengles.version=131072 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    persist.sys.usb.config=mtp,adb


PRODUCT_PROPERTY_OVERRIDES += ro.dinfo.radio=Wifi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    audio.primary.tegra
    
# ramdisk - fstab is the same for all AX0X devices
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/ramdisk/fstab.t20:root/fstab.t20

# Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Misc configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
    $(LOCAL_PATH)/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    $(LOCAL_PATH)/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/prebuilt/etc/wifi/fw_bcm4329.bin:system/etc/wifi/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/etc/wifi/fw_bcm4329_apsta.bin:system/etc/wifi/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/prebuilt/gsm::root/sbin/gsm
    
# Huawei_3GUSB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/libhuawei-ril.so:system/lib/libhuawei-ril.so \
    $(LOCAL_PATH)/prebuilt/bin/rild:system/bin/rild \
    $(LOCAL_PATH)/prebuilt/etc/init.d/02ppp.sh:system/etc/init.d/02ppp.sh \
    $(LOCAL_PATH)/prebuilt/etc/ppp/peers/3g:system/etc/ppp/peers/3g \
    $(LOCAL_PATH)/prebuilt/etc/ppp/peers/gprs:system/etc/ppp/peers/gprs \
    $(LOCAL_PATH)/prebuilt/etc/ppp/peers/pppd-ril.options:system/etc/ppp/peers/pppd-ril.options \
    $(LOCAL_PATH)/prebuilt/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \
    $(LOCAL_PATH)/prebuilt/etc/ppp/gprs-connect-chat:system/etc/ppp/gprs-connect-chat \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-down-HUAWEI:system/etc/ppp/ip-down-HUAWEI \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up-HUAWEI:system/etc/ppp/ip-up-HUAWEI \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up-vpn:system/etc/ppp/ip-up-vpn \
    $(LOCAL_PATH)/prebuilt/etc/ppp/options.huawei:system/etc/ppp/options.huawei \
    $(LOCAL_PATH)/prebuilt/etc/ppp/pap-secrets:system/etc/ppp/pap-secrets     

# keychars/layout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/keychars/Acer-AK00LB.kcm:system/usr/keychars/Acer-AK00LB.kcm \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Acer-AK00LB.kl:system/usr/keylayout/Acer-AK00LB.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl
