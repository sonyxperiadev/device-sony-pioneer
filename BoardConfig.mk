# Copyright 2014 The Android Open Source Project
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

include device/sony/nile/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %h3113,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := H3113
else ifneq (,$(filter %h4113,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := H4113
else
TARGET_BOOTLOADER_BOARD_NAME := H3113
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := nile

# NFC
NXP_CHIP_TYPE := PN553
NXP_CHIP_FW_TYPE := PN553

BOARD_KERNEL_CMDLINE += androidboot.hardware=pioneer

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3036676096
# Reserve space for data encryption (21474836480-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474820096
