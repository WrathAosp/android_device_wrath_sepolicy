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
