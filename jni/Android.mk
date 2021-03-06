LOCAL_PATH := $(call my-dir)
SPEEX	:= speex-1.2rc1
SILK     := silk

include $(CLEAR_VARS)
LOCAL_MODULE    := OSNetworkSystem
LOCAL_SRC_FILES := OSNetworkSystem.cpp
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := speex_jni
LOCAL_SRC_FILES := speex_jni.cpp \
		$(SPEEX)/libspeex/speex.c \
		$(SPEEX)/libspeex/speex_callbacks.c \
		$(SPEEX)/libspeex/bits.c \
		$(SPEEX)/libspeex/modes.c \
		$(SPEEX)/libspeex/nb_celp.c \
		$(SPEEX)/libspeex/exc_20_32_table.c \
		$(SPEEX)/libspeex/exc_5_256_table.c \
		$(SPEEX)/libspeex/exc_5_64_table.c \
		$(SPEEX)/libspeex/exc_8_128_table.c \
		$(SPEEX)/libspeex/exc_10_32_table.c \
		$(SPEEX)/libspeex/exc_10_16_table.c \
		$(SPEEX)/libspeex/filters.c \
		$(SPEEX)/libspeex/quant_lsp.c \
		$(SPEEX)/libspeex/ltp.c \
		$(SPEEX)/libspeex/lpc.c \
		$(SPEEX)/libspeex/lsp.c \
		$(SPEEX)/libspeex/vbr.c \
		$(SPEEX)/libspeex/gain_table.c \
		$(SPEEX)/libspeex/gain_table_lbr.c \
		$(SPEEX)/libspeex/lsp_tables_nb.c \
		$(SPEEX)/libspeex/cb_search.c \
		$(SPEEX)/libspeex/vq.c \
		$(SPEEX)/libspeex/window.c \
		$(SPEEX)/libspeex/high_lsp_tables.c

LOCAL_C_INCLUDES += 
LOCAL_CFLAGS = -DFIXED_POINT -DEXPORT="" -UHAVE_CONFIG_H -I$(LOCAL_PATH)/$(SPEEX)/include
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
BV16     := bx16_fixedp
LOCAL_MODULE    := bv16_jni
LOCAL_SRC_FILES := bv16_jni.cpp \
	$(BV16)/bvcommon/a2lsp.c \
	$(BV16)/bvcommon/allpole.c \
	$(BV16)/bvcommon/allzero.c  \
	$(BV16)/bvcommon/autocor.c \
	$(BV16)/bvcommon/basop32.c \
	$(BV16)/bvcommon/cmtables.c \
	$(BV16)/bvcommon/levdur.c \
	$(BV16)/bvcommon/lsp2a.c \
	$(BV16)/bvcommon/mathtables.c \
	$(BV16)/bvcommon/mathutil.c \
	$(BV16)/bvcommon/memutil.c \
	$(BV16)/bvcommon/ptdec.c \
	$(BV16)/bvcommon/stblzlsp.c \
	$(BV16)/bvcommon/utility.c \
	$(BV16)/bvcommon/vqdecode.c \
	$(BV16)/bv16/bitpack.c \
	$(BV16)/bv16/bv.c \
	$(BV16)/bv16/coarptch.c \
	$(BV16)/bv16/decoder.c \
	$(BV16)/bv16/encoder.c \
	$(BV16)/bv16/excdec.c \
	$(BV16)/bv16/excquan.c \
	$(BV16)/bv16/fineptch.c \
	$(BV16)/bv16/g192.c \
	$(BV16)/bv16/gaindec.c \
	$(BV16)/bv16/gainquan.c \
	$(BV16)/bv16/levelest.c \
	$(BV16)/bv16/lspdec.c \
	$(BV16)/bv16/lspquan.c \
	$(BV16)/bv16/plc.c \
	$(BV16)/bv16/postfilt.c \
	$(BV16)/bv16/preproc.c \
	$(BV16)/bv16/ptquan.c \
	$(BV16)/bv16/tables.c 
	
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(BV16)/bvcommon $(LOCAL_PATH)/$(BV16)/bv16 $(LOCAL_PATH)/$(BV16)
#LOCAL_CFLAGS = -O3 -marm -march=armv6 -mtune=arm1136j-s -DWMOPS=0 -DG192BITSTREAM=0
#LOCAL_CFLAGS = -O3 -DWMOPS=0 -DG192BITSTREAM=0
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
SPANDSP     := spandsp
LOCAL_MODULE    := g722_jni
LOCAL_SRC_FILES := g722_jni.cpp \
	$(SPANDSP)/g722.c \
	$(SPANDSP)/vector_int.c
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SPANDSP)/spandsp $(LOCAL_PATH)/$(SPANDSP)
LOCAL_CFLAGS = -O3
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
SPANDSP     := spandsp
LOCAL_MODULE    := gsm_jni
LOCAL_SRC_FILES := gsm_jni.cpp \
	$(SPANDSP)/gsm0610_decode.c \
	$(SPANDSP)/gsm0610_encode.c \
	$(SPANDSP)/gsm0610_lpc.c \
	$(SPANDSP)/gsm0610_preprocess.c \
	$(SPANDSP)/gsm0610_rpe.c \
	$(SPANDSP)/gsm0610_short_term.c \
	$(SPANDSP)/gsm0610_long_term.c
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SPANDSP)/spandsp $(LOCAL_PATH)/$(SPANDSP)
LOCAL_CFLAGS = -O3
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
G729A	:= g729a
LOCAL_MODULE = g729_jni
LOCAL_SRC_FILES	:= g729_jni.cpp \
	$(G729A)/src/acelp_ca.c \
	$(G729A)/src/basic_op.c \
	$(G729A)/src/bits.c \
	$(G729A)/src/cod_ld8a.c \
	$(G729A)/src/cor_func.c \
	$(G729A)/src/de_acelp.c \
	$(G729A)/src/dec_gain.c \
	$(G729A)/src/dec_lag3.c \
	$(G729A)/src/dec_ld8a.c \
	$(G729A)/src/dspfunc.c \
	$(G729A)/src/filter.c \
	$(G729A)/src/g729a_decoder.c \
	$(G729A)/src/g729a_encoder.c \
	$(G729A)/src/gainpred.c \
	$(G729A)/src/lpc.c \
	$(G729A)/src/lpcfunc.c \
	$(G729A)/src/lspdec.c \
	$(G729A)/src/lspgetq.c \
	$(G729A)/src/oper_32b.c \
	$(G729A)/src/p_parity.c \
	$(G729A)/src/pitch_a.c \
	$(G729A)/src/postfilt.c \
	$(G729A)/src/post_pro.c \
	$(G729A)/src/pre_proc.c \
	$(G729A)/src/pred_lt3.c \
	$(G729A)/src/qua_gain.c \
	$(G729A)/src/qua_lsp.c \
	$(G729A)/src/round.c \
	$(G729A)/src/tab_ld8a.c \
	$(G729A)/src/taming.c \
	$(G729A)/src/util.c
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(G729A)/include
LOCAL_CFLAGS = -O3
include $(BUILD_SHARED_LIBRARY)
