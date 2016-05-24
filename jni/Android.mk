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
	-mkdir /data
	-mkdir /data/local
	-mkdir /data/local/tmp
	-mkdir $(LUAETC)
	-mkdir $(LUAETC)/luasocket
	-mkdir $(LUAETC)/luasocket/doc
	-mkdir $(LUAETC)/luasocket/samples
	-mkdir $(LUAETC)/luasocket/test
	-mkdir /data/local/tmp/lib
	-mkdir /data/local/tmp/lib/lua
	-mkdir $(LUAROOT)
	-mkdir $(LUAROOT)/socket
	-mkdir $(LUAROOT)/mime
	cp socket.lua $(LUAROOT)
	cp ltn12.lua $(LUAROOT)
	cp ftp.lua $(LUAROOT)/socket
	cp http.lua $(LUAROOT)/socket
	cp mime.lua $(LUAROOT)/socket
	cp mime.lua $(LUAROOT)
	cp smtp.lua $(LUAROOT)/socket
	cp tp.lua $(LUAROOT)/socket
	cp url.lua $(LUAROOT)/socket
	-ln -s ../libs/armeabi-v7a/libluasocket.so $(LUAROOT)/socket/core.so
	-ln -s ../libs/armeabi-v7a/libmime.so $(LUAROOT)/mime/core.so
	cp ../etc/README $(LUAETC)/luasocket
	cp ../etc/b64.lua $(LUAETC)/luasocket
	cp ../etc/check-links.lua $(LUAETC)/luasocket
	cp ../etc/check-memory.lua $(LUAETC)/luasocket
	cp ../etc/dict.lua $(LUAETC)/luasocket
	cp ../etc/dispatch.lua $(LUAETC)/luasocket
	cp ../etc/eol.lua $(LUAETC)/luasocket
	cp ../etc/forward.lua $(LUAETC)/luasocket
	cp ../etc/get.lua $(LUAETC)/luasocket
	cp ../etc/lp.lua $(LUAETC)/luasocket
	cp ../etc/qp.lua $(LUAETC)/luasocket
	cp ../etc/tftp.lua $(LUAETC)/luasocket
	cp ../doc/dns.html $(LUAETC)/luasocket/doc
	cp ../doc/ftp.html $(LUAETC)/luasocket/doc
	cp ../doc/http.html $(LUAETC)/luasocket/doc
	cp ../doc/index.html $(LUAETC)/luasocket/doc
	cp ../doc/installation.html $(LUAETC)/luasocket/doc
	cp ../doc/introduction.html $(LUAETC)/luasocket/doc
	cp ../doc/ltn12.html $(LUAETC)/luasocket/doc
	cp ../doc/luasocket.png $(LUAETC)/luasocket/doc
	cp ../doc/mime.html $(LUAETC)/luasocket/doc
	cp ../doc/reference.css $(LUAETC)/luasocket/doc
	cp ../doc/reference.html $(LUAETC)/luasocket/doc
	cp ../doc/smtp.html $(LUAETC)/luasocket/doc
	cp ../doc/socket.html $(LUAETC)/luasocket/doc
	cp ../doc/tcp.html $(LUAETC)/luasocket/doc
	cp ../doc/udp.html $(LUAETC)/luasocket/doc
	cp ../doc/url.html $(LUAETC)/luasocket/doc
	cp ../samples/cddb.lua $(LUAETC)/luasocket/samples
	cp ../samples/daytimeclnt.lua $(LUAETC)/luasocket/samples
	cp ../samples/echoclnt.lua $(LUAETC)/luasocket/samples
	cp ../samples/echosrvr.lua $(LUAETC)/luasocket/samples
	cp ../samples/listener.lua $(LUAETC)/luasocket/samples
	cp ../samples/lpr.lua $(LUAETC)/luasocket/samples
	cp ../samples/README $(LUAETC)/luasocket/samples
	cp ../samples/talker.lua $(LUAETC)/luasocket/samples
	cp ../samples/tinyirc.lua $(LUAETC)/luasocket/samples
	cp ../test/README $(LUAETC)/luasocket/test
	cp ../test/testclnt.lua $(LUAETC)/luasocket/test
	cp ../test/testsrvr.lua $(LUAETC)/luasocket/test
	cp ../test/testsupport.lua $(LUAETC)/luasocket/test
	cp ../LICENSE $(LUAETC)/luasocket
	cp ../NEW $(LUAETC)/luasocket
	cp ../README $(LUAETC)/luasocket
