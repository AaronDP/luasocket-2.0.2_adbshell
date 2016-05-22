##== LUASOCKET ==
LOCAL_PATH := $(call my-dir)
LUALIB=/data/local/tmp/lib/lua-5.2.4/armeabi-v7a
LUAINC=/data/local/tmp/lib/lua-5.2.4
LUALIB=/data/local/tmp/lib/
LUAINC=/data/local/tmp/lib/include/luajit-2.0

include $(CLEAR_VARS)
#LOCAL_MODULE    := libluajit
#LOCAL_MODULE_FILENAME := libluajit
#LOCAL_SRC_FILES := $(LOCAL_PATH)/libluajit.a
LOCAL_MODULE    := libluajit
LOCAL_MODULE_FILENAME := libluajit
LOCAL_SRC_FILES := $(LUALIB)/libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:=luasocket
LOCAL_SRC_FILES := auxiliar.c  buffer.c  except.c  inet.c  io.c \
luasocket.c  mime.c  options.c  select.c  tcp.c  timeout.c  udp.c \
unix.c  usocket.c 
#LOCAL_C_INCLUDES+= $(LOCAL_PATH) $(LOCAL_PATH)/../lua /opt/StudioProjects/Android-Terminal-Emulator/luajit-2.0/jni/
LOCAL_C_INCLUDES+= $(LOCAL_PATH) $(LOCAL_PATH)/../lua $(LUAINC)
#LOCAL_STATIC_LIBRARIES:=lua
LOCAL_SHARED_LIBRARIES:=luajit
include $(BUILD_STATIC_LIBRARY)
