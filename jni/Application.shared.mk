# APP_STL := stlport_static
APP_STL := gnustl_static 
APP_OPTIM := debug
APP_ABI := armeabi-v7a armeabi
APP_PLATFORM := android-19
#NDK_TOOLCHAIN_VERSION := 4.8 # (4.8 is for 32-bit, 4.9 is for 64-bit)
APP_PIE := false # target early android as well, will not work with 5.0+
