ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),pico)
    include $(call all-subdir-makefiles)
endif
