#
# This policy configuration will be used by all qcom products
# that inherit from Wrath
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/wrath/sepolicy/qcom/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/wrath/sepolicy/qcom/dynamic \
    device/wrath/sepolicy/qcom/system
else
BOARD_SEPOLICY_DIRS += \
    device/wrath/sepolicy/qcom/dynamic \
    device/wrath/sepolicy/qcom/vendor
endif

ifneq ($(filter msm8226 msm8610 msm8974 msm8909 msm8916 msm8952 msm8992 msm8994,$(TARGET_BOARD_PLATFORM)),)
BOARD_SEPOLICY_DIRS += \
    device/wrath/sepolicy/qcom/legacy-vendor
endif
