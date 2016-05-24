# ==========================================================
# LUAINC contains the following header files:
# ==========================================================
# -rw-rw-r-- 1 aaron aaron  6006 May 18 01:16 lauxlib.h
# -rw-rw-r-- 1 aaron aaron  4762 May 18 01:16 luaconf.h
# -rw-rw-r-- 1 aaron aaron 11964 May 18 01:16 lua.h
# -rw-rw-r-- 1 aaron aaron  1113 May 18 01:16 lualib.h
# ==========================================================
# LUALIB contains the following luajit library(ies):
# ==========================================================
# -rw-rw-r-- 1 aaron aaron  560370 May 18 14:05 libluajit.a
# -rwxrwxr-x 1 aaron aaron  386364 May 18 14:05 libluajit.so
# ==========================================================
# FIXME: Assumes armeabi-v7a shared library will be installed
# ==========================================================
##== LUASOCKET ==
LOCAL_PATH 		:= $(call my-dir)
include 		$(CLEAR_VARS)
LUAROOT			:= /data/local/tmp/lib/lua/5.1
LUAETC			:= /data/local/tmp/etc
LUALIB			:= /data/local/tmp/lib
LUAINC			:= /data/local/tmp/lib/luajit-2.0

include 		$(CLEAR_VARS)
LOCAL_MODULE    	:= libluajit
LOCAL_MODULE_FILENAME 	:= libluajit
LOCAL_SRC_FILES 	:= $(LUALIB)/libluajit.so
include 		$(PREBUILT_SHARED_LIBRARY)

include 		$(CLEAR_VARS)
LOCAL_ARM_MODE 		:= arm   
LOCAL_MODULE		:= luasocket
LOCAL_SRC_FILES 	:= auxiliar.c  buffer.c  except.c  \
			inet.c  io.c luasocket.c  mime.c  \
			options.c  select.c  tcp.c  timeout.c  \
			udp.c unix.c  usocket.c 
LOCAL_C_INCLUDES	+= $(LOCAL_PATH) $(LOCAL_PATH)/../lua $(LUAINC)
LOCAL_LDLIBS		:= -O -shared -fpic
LOCAL_CFLAGS 		:= -pedantic -Wall -O2 -fpic -DLUASOCKET_DEBUG 
LOCAL_SHARED_LIBRARIES	:= luajit
include 		$(BUILD_SHARED_LIBRARY)


include 		$(CLEAR_VARS)
LOCAL_ARM_MODE 		:= arm   
LOCAL_MODULE		:= mime
LOCAL_SRC_FILES 	:= mime.c 
LOCAL_C_INCLUDES	+= $(LOCAL_PATH) $(LOCAL_PATH)/../lua $(LUAINC)
LOCAL_LDLIBS		:= -O -shared -fpic
LOCAL_CFLAGS 		:= -pedantic -Wall -O2 -fpic -DLUASOCKET_DEBUG 
LOCAL_SHARED_LIBRARIES	:= luajit
#LOCAL_LDLIBS 		:= -L$(LOCAL_PATH)/../libs/armeabi 
include 		$(BUILD_SHARED_LIBRARY)


all:
	-mkdir /data 2>/dev/null
	-mkdir /data/local 2>/dev/null
	-mkdir /data/local/tmp 2>/dev/null
	-mkdir $(LUAETC) 2>/dev/null
	-mkdir $(LUAETC)/luasocket 2>/dev/null
	-mkdir $(LUAETC)/luasocket/doc 2>/dev/null
	-mkdir $(LUAETC)/luasocket/samples 2>/dev/null
	-mkdir $(LUAETC)/luasocket/test 2>/dev/null
	-mkdir /data/local/tmp/lib 2>/dev/null
	-mkdir /data/local/tmp/lib/lua 2>/dev/null
	-mkdir $(LUAROOT) 2>/dev/null
	-mkdir $(LUAROOT)/socket 2>/dev/null
	-mkdir $(LUAROOT)/mime 2>/dev/null
	cp $(LOCAL_PATH)/socket.lua $(LUAROOT)
	cp $(LOCAL_PATH)/ltn12.lua $(LUAROOT)
	cp $(LOCAL_PATH)/ftp.lua $(LUAROOT)/socket
	cp $(LOCAL_PATH)/http.lua $(LUAROOT)/socket
	cp $(LOCAL_PATH)/mime.lua $(LUAROOT)/socket
	cp $(LOCAL_PATH)/mime.lua $(LUAROOT)
	cp $(LOCAL_PATH)/smtp.lua $(LUAROOT)/socket
	cp $(LOCAL_PATH)/tp.lua $(LUAROOT)/socket
	cp $(LOCAL_PATH)/url.lua $(LUAROOT)/socket
	rm $(LUAROOT)/socket/core.so 2>/dev/null
	cp $(LOCAL_PATH)/../libs/armeabi-v7a/libluasocket.so $(LUAROOT)/socket/core.so
	rm $(LUALIB)/libluasocket.so 2>/dev/null
	cp $(LOCAL_PATH)/../libs/armeabi-v7a/libluasocket.so $(LUALIB)/libluasocket.so
	rm $(LUAROOT)/mime/core.so 2>/dev/null
	cp $(LOCAL_PATH)/../libs/armeabi-v7a/libmime.so $(LUAROOT)/mime/core.so
	cp $(LOCAL_PATH)/../etc/README $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/b64.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/check-links.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/check-memory.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/dict.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/dispatch.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/eol.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/forward.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/get.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/lp.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/qp.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../etc/tftp.lua $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../doc/dns.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/ftp.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/http.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/index.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/installation.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/introduction.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/ltn12.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/luasocket.png $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/mime.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/reference.css $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/reference.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/smtp.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/socket.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/tcp.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/udp.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../doc/url.html $(LUAETC)/luasocket/doc
	cp $(LOCAL_PATH)/../samples/cddb.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/daytimeclnt.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/echoclnt.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/echosrvr.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/listener.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/lpr.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/README $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/talker.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../samples/tinyirc.lua $(LUAETC)/luasocket/samples
	cp $(LOCAL_PATH)/../test/README $(LUAETC)/luasocket/test
	cp $(LOCAL_PATH)/../test/testclnt.lua $(LUAETC)/luasocket/test
	cp $(LOCAL_PATH)/../test/testsrvr.lua $(LUAETC)/luasocket/test
	cp $(LOCAL_PATH)/../test/testsupport.lua $(LUAETC)/luasocket/test
	cp $(LOCAL_PATH)/../LICENSE $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../NEW $(LUAETC)/luasocket
	cp $(LOCAL_PATH)/../README $(LUAETC)/luasocket
