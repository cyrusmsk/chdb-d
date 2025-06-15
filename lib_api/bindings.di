// D import file generated from 'chdb_capi.c'
extern (C)
{
	alias __uint16_t = ushort;
	alias __uint32_t = uint;
	alias __uint64_t = ulong;
	alias ptrdiff_t = long;
	alias size_t = ulong;
	alias wchar_t = int;
	alias max_align_t = real;
	alias int8_t = byte;
	alias int16_t = short;
	alias int32_t = int;
	alias int64_t = long;
	alias uint8_t = ubyte;
	alias uint16_t = ushort;
	alias uint32_t = uint;
	alias uint64_t = ulong;
	alias int_least8_t = byte;
	alias int_least16_t = short;
	alias int_least32_t = int;
	alias int_least64_t = long;
	alias uint_least8_t = ubyte;
	alias uint_least16_t = ushort;
	alias uint_least32_t = uint;
	alias uint_least64_t = ulong;
	alias int_fast8_t = byte;
	alias int_fast16_t = short;
	alias int_fast32_t = int;
	alias int_fast64_t = long;
	alias uint_fast8_t = ubyte;
	alias uint_fast16_t = ushort;
	alias uint_fast32_t = uint;
	alias uint_fast64_t = ulong;
	alias __int8_t = byte;
	alias __uint8_t = ubyte;
	alias __int16_t = short;
	alias __uint16_t = ushort;
	alias __int32_t = int;
	alias __int64_t = long;
	alias __darwin_intptr_t = long;
	alias __darwin_natural_t = uint;
	alias __darwin_ct_rune_t = int;
	union __mbstate_t
	{
		char[128] __mbstate8 = void;
		ptrdiff_t _mbstateL = void;
	}
	alias __darwin_mbstate_t = __mbstate_t;
	alias __darwin_ptrdiff_t = long;
	alias __darwin_size_t = ulong;
	alias __darwin_va_list = __builtin_va_list;
	alias __darwin_wchar_t = int;
	alias __darwin_rune_t = int;
	alias __darwin_wint_t = int;
	alias __darwin_clock_t = ulong;
	alias __darwin_socklen_t = uint;
	alias __darwin_ssize_t = long;
	alias __darwin_time_t = long;
	alias __darwin_blkcnt_t = long;
	alias __darwin_blksize_t = int;
	alias __darwin_dev_t = int;
	alias __darwin_fsblkcnt_t = uint;
	alias __darwin_fsfilcnt_t = uint;
	alias __darwin_gid_t = uint;
	alias __darwin_id_t = uint;
	alias __darwin_ino64_t = ulong;
	alias __darwin_ino_t = ulong;
	alias __darwin_mach_port_name_t = uint;
	alias __darwin_mach_port_t = uint;
	alias __darwin_mode_t = ushort;
	alias __darwin_off_t = long;
	alias __darwin_pid_t = int;
	alias __darwin_sigset_t = uint;
	alias __darwin_suseconds_t = int;
	alias __darwin_uid_t = uint;
	alias __darwin_useconds_t = uint;
	alias __darwin_uuid_t = ubyte[16];
	alias __darwin_uuid_string_t = char[37];
	struct __darwin_pthread_handler_rec
	{
		void function(void*) __routine = void;
		void* __arg = void;
		__darwin_pthread_handler_rec* __next = void;
	}
	struct _opaque_pthread_attr_t
	{
		ptrdiff_t __sig = void;
		char[56] __opaque = void;
	}
	struct _opaque_pthread_cond_t
	{
		ptrdiff_t __sig = void;
		char[40] __opaque = void;
	}
	struct _opaque_pthread_condattr_t
	{
		ptrdiff_t __sig = void;
		char[8] __opaque = void;
	}
	struct _opaque_pthread_mutex_t
	{
		ptrdiff_t __sig = void;
		char[56] __opaque = void;
	}
	struct _opaque_pthread_mutexattr_t
	{
		ptrdiff_t __sig = void;
		char[8] __opaque = void;
	}
	struct _opaque_pthread_once_t
	{
		ptrdiff_t __sig = void;
		char[8] __opaque = void;
	}
	struct _opaque_pthread_rwlock_t
	{
		ptrdiff_t __sig = void;
		char[192] __opaque = void;
	}
	struct _opaque_pthread_rwlockattr_t
	{
		ptrdiff_t __sig = void;
		char[16] __opaque = void;
	}
	struct _opaque_pthread_t
	{
		ptrdiff_t __sig = void;
		__darwin_pthread_handler_rec* __cleanup_stack = void;
		char[8176] __opaque = void;
	}
	alias __darwin_pthread_attr_t = _opaque_pthread_attr_t;
	alias __darwin_pthread_cond_t = _opaque_pthread_cond_t;
	alias __darwin_pthread_condattr_t = _opaque_pthread_condattr_t;
	alias __darwin_pthread_key_t = ulong;
	alias __darwin_pthread_mutex_t = _opaque_pthread_mutex_t;
	alias __darwin_pthread_mutexattr_t = _opaque_pthread_mutexattr_t;
	alias __darwin_pthread_once_t = _opaque_pthread_once_t;
	alias __darwin_pthread_rwlock_t = _opaque_pthread_rwlock_t;
	alias __darwin_pthread_rwlockattr_t = _opaque_pthread_rwlockattr_t;
	alias __darwin_pthread_t = _opaque_pthread_t*;
	alias intptr_t = long;
	alias uintptr_t = ulong;
	alias intmax_t = long;
	alias uintmax_t = ulong;
	struct local_result
	{
		char* buf = void;
		size_t len = void;
		void* _vec = void;
		double elapsed = void;
		uint64_t rows_read = void;
		uint64_t bytes_read = void;
	}
	struct local_result_v2
	{
		char* buf = void;
		size_t len = void;
		void* _vec = void;
		double elapsed = void;
		uint64_t rows_read = void;
		uint64_t bytes_read = void;
		char* error_message = void;
	}
	struct chdb_conn
	{
		void* server = void;
		bool connected = void;
		void* queue = void;
	}
	struct chdb_streaming_result
	{
		void* internal_data = void;
	}
	struct chdb_result_
	{
		void* internal_data = void;
	}
	struct chdb_connection_
	{
	    void* internal_data = void;
	}
	alias chdb_result = chdb_result_;
	alias chdb_connection = chdb_connection_;
	local_result* query_stable(wchar_t argc, char** argv);
	void free_result(local_result* result);
	local_result_v2* query_stable_v2(wchar_t argc, char** argv);
	void free_result_v2(local_result_v2* result);
	chdb_conn** connect_chdb(wchar_t argc, char** argv);
	void close_conn(chdb_conn** conn);
	local_result_v2* query_conn(chdb_conn* conn, const(char)* query, const(char)* format);
	chdb_streaming_result* query_conn_streaming(chdb_conn* conn, const(char)* query, const(char)* format);
	const(char)* chdb_streaming_result_error(chdb_streaming_result* result);
	local_result_v2* chdb_streaming_fetch_result(chdb_conn* conn, chdb_streaming_result* result);
	void chdb_streaming_cancel_query(chdb_conn* conn, chdb_streaming_result* result);
	void chdb_destroy_result(chdb_streaming_result* result);
	chdb_connection* chdb_connect(wchar_t argc, char** argv);
	void chdb_close_conn(chdb_connection* conn);
	chdb_result* chdb_query(chdb_connection conn, const(char)* query, const(char)* format);
	chdb_result* chdb_query_cmdline(wchar_t argc, char** argv);
	chdb_result* chdb_stream_query(chdb_connection conn, const(char)* query, const(char)* format);
	chdb_result* chdb_stream_fetch_result(chdb_connection conn, chdb_result* result);
	void chdb_stream_cancel_query(chdb_connection conn, chdb_result* result);
	void chdb_destroy_query_result(chdb_result* result);
	char* chdb_result_buffer(chdb_result* result);
	size_t chdb_result_length(chdb_result* result);
	double chdb_result_elapsed(chdb_result* result);
	uint64_t chdb_result_rows_read(chdb_result* result);
	uint64_t chdb_result_bytes_read(chdb_result* result);
	uint64_t chdb_result_storage_rows_read(chdb_result* result);
	uint64_t chdb_result_storage_bytes_read(chdb_result* result);
	const(char)* chdb_result_error(chdb_result* result);
	enum wchar_t __llvm__ = 1;
	enum wchar_t __clang__ = 1;
	enum wchar_t __clang_major__ = 17;
	enum wchar_t __clang_minor__ = 0;
	enum wchar_t __clang_patchlevel__ = 0;
	enum __clang_version__ = "17.0.0 (clang-1700.0.13.5)";
	enum wchar_t __GNUC__ = 4;
	enum wchar_t __GNUC_MINOR__ = 2;
	enum wchar_t __GNUC_PATCHLEVEL__ = 1;
	enum wchar_t __GXX_ABI_VERSION = 1002;
	enum wchar_t __ATOMIC_RELAXED = 0;
	enum wchar_t __ATOMIC_CONSUME = 1;
	enum wchar_t __ATOMIC_ACQUIRE = 2;
	enum wchar_t __ATOMIC_RELEASE = 3;
	enum wchar_t __ATOMIC_ACQ_REL = 4;
	enum wchar_t __ATOMIC_SEQ_CST = 5;
	enum wchar_t __MEMORY_SCOPE_SYSTEM = 0;
	enum wchar_t __MEMORY_SCOPE_DEVICE = 1;
	enum wchar_t __MEMORY_SCOPE_WRKGRP = 2;
	enum wchar_t __MEMORY_SCOPE_WVFRNT = 3;
	enum wchar_t __MEMORY_SCOPE_SINGLE = 4;
	enum wchar_t __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
	enum wchar_t __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
	enum wchar_t __OPENCL_MEMORY_SCOPE_DEVICE = 2;
	enum wchar_t __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
	enum wchar_t __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
	enum wchar_t __FPCLASS_SNAN = 1;
	enum wchar_t __FPCLASS_QNAN = 2;
	enum wchar_t __FPCLASS_NEGINF = 4;
	enum wchar_t __FPCLASS_NEGNORMAL = 8;
	enum wchar_t __FPCLASS_NEGSUBNORMAL = 16;
	enum wchar_t __FPCLASS_NEGZERO = 32;
	enum wchar_t __FPCLASS_POSZERO = 64;
	enum wchar_t __FPCLASS_POSSUBNORMAL = 128;
	enum wchar_t __FPCLASS_POSNORMAL = 256;
	enum wchar_t __FPCLASS_POSINF = 512;
	enum wchar_t __PRAGMA_REDEFINE_EXTNAME = 1;
	/+enum __VERSION__ = "Apple LLVM 17.0.0 (clang-1700.0.13.5)"+/;
	enum wchar_t __STRICT_ANSI__ = 1;
	enum wchar_t __OBJC_BOOL_IS_BOOL = 1;
	enum wchar_t __CONSTANT_CFSTRINGS__ = 1;
	enum __clang_literal_encoding__ = "UTF-8";
	enum __clang_wide_literal_encoding__ = "UTF-32";
	enum wchar_t __ORDER_LITTLE_ENDIAN__ = 1234;
	enum wchar_t __ORDER_BIG_ENDIAN__ = 4321;
	enum wchar_t __ORDER_PDP_ENDIAN__ = 3412;
	enum wchar_t __LITTLE_ENDIAN__ = 1;
	enum wchar_t _LP64 = 1;
	enum wchar_t __LP64__ = 1;
	enum wchar_t __CHAR_BIT__ = 8;
	enum wchar_t __BOOL_WIDTH__ = 8;
	enum wchar_t __SHRT_WIDTH__ = 16;
	enum wchar_t __INT_WIDTH__ = 32;
	enum wchar_t __LONG_WIDTH__ = 64;
	enum wchar_t __LLONG_WIDTH__ = 64;
	enum wchar_t __BITINT_MAXWIDTH__ = 128;
	enum wchar_t __SCHAR_MAX__ = 127;
	enum wchar_t __SHRT_MAX__ = 32767;
	enum wchar_t __INT_MAX__ = 2147483647;
	enum ptrdiff_t __LONG_MAX__ = 9223372036854775807L;
	enum ptrdiff_t __LONG_LONG_MAX__ = 9223372036854775807L;
	enum wchar_t __WCHAR_MAX__ = 2147483647;
	enum wchar_t __WCHAR_WIDTH__ = 32;
	enum wchar_t __WINT_MAX__ = 2147483647;
	enum wchar_t __WINT_WIDTH__ = 32;
	enum ptrdiff_t __INTMAX_MAX__ = 9223372036854775807L;
	enum wchar_t __INTMAX_WIDTH__ = 64;
	enum __uint64_t __SIZE_MAX__ = 18446744073709551615LU;
	enum wchar_t __SIZE_WIDTH__ = 64;
	enum __uint64_t __UINTMAX_MAX__ = 18446744073709551615LU;
	enum wchar_t __UINTMAX_WIDTH__ = 64;
	enum ptrdiff_t __PTRDIFF_MAX__ = 9223372036854775807L;
	enum wchar_t __PTRDIFF_WIDTH__ = 64;
	enum ptrdiff_t __INTPTR_MAX__ = 9223372036854775807L;
	enum wchar_t __INTPTR_WIDTH__ = 64;
	enum __uint64_t __UINTPTR_MAX__ = 18446744073709551615LU;
	enum wchar_t __UINTPTR_WIDTH__ = 64;
	enum wchar_t __SIZEOF_DOUBLE__ = 8;
	enum wchar_t __SIZEOF_FLOAT__ = 4;
	enum wchar_t __SIZEOF_INT__ = 4;
	enum wchar_t __SIZEOF_LONG__ = 8;
	enum wchar_t __SIZEOF_LONG_DOUBLE__ = 8;
	enum wchar_t __SIZEOF_LONG_LONG__ = 8;
	enum wchar_t __SIZEOF_POINTER__ = 8;
	enum wchar_t __SIZEOF_SHORT__ = 2;
	enum wchar_t __SIZEOF_PTRDIFF_T__ = 8;
	enum wchar_t __SIZEOF_SIZE_T__ = 8;
	enum wchar_t __SIZEOF_WCHAR_T__ = 4;
	enum wchar_t __SIZEOF_WINT_T__ = 4;
	enum __INTMAX_FMTd__ = "ld";
	enum __INTMAX_FMTi__ = "li";
	enum __UINTMAX_FMTo__ = "lo";
	enum __UINTMAX_FMTu__ = "lu";
	enum __UINTMAX_FMTx__ = "lx";
	enum __UINTMAX_FMTX__ = "lX";
	enum __PTRDIFF_FMTd__ = "ld";
	enum __PTRDIFF_FMTi__ = "li";
	enum __INTPTR_FMTd__ = "ld";
	enum __INTPTR_FMTi__ = "li";
	enum __SIZE_FMTo__ = "lo";
	enum __SIZE_FMTu__ = "lu";
	enum __SIZE_FMTx__ = "lx";
	enum __SIZE_FMTX__ = "lX";
	enum wchar_t __SIG_ATOMIC_MAX__ = 2147483647;
	enum wchar_t __SIG_ATOMIC_WIDTH__ = 32;
	enum __UINTPTR_FMTo__ = "lo";
	enum __UINTPTR_FMTu__ = "lu";
	enum __UINTPTR_FMTx__ = "lx";
	enum __UINTPTR_FMTX__ = "lX";
	enum wchar_t __FLT16_HAS_DENORM__ = 1;
	enum wchar_t __FLT16_DIG__ = 3;
	enum wchar_t __FLT16_DECIMAL_DIG__ = 5;
	enum wchar_t __FLT16_HAS_INFINITY__ = 1;
	enum wchar_t __FLT16_HAS_QUIET_NAN__ = 1;
	enum wchar_t __FLT16_MANT_DIG__ = 11;
	enum wchar_t __FLT16_MAX_10_EXP__ = 4;
	enum wchar_t __FLT16_MAX_EXP__ = 16;
	auto __FLT16_MIN_10_EXP__()()
	{
		return -4;
	}
	auto __FLT16_MIN_EXP__()()
	{
		return -13;
	}
	enum float __FLT_DENORM_MIN__ = float.min_normal;
	enum float __FLT_NORM_MAX__ = float.max;
	enum wchar_t __FLT_HAS_DENORM__ = 1;
	enum wchar_t __FLT_DIG__ = 6;
	enum wchar_t __FLT_DECIMAL_DIG__ = 9;
	enum float __FLT_EPSILON__ = 0x1.000000102f4fdp-23F;
	enum wchar_t __FLT_HAS_INFINITY__ = 1;
	enum wchar_t __FLT_HAS_QUIET_NAN__ = 1;
	enum wchar_t __FLT_MANT_DIG__ = 24;
	enum wchar_t __FLT_MAX_10_EXP__ = 38;
	enum wchar_t __FLT_MAX_EXP__ = 128;
	enum float __FLT_MAX__ = float.max;
	auto __FLT_MIN_10_EXP__()()
	{
		return -37;
	}
	auto __FLT_MIN_EXP__()()
	{
		return -125;
	}
	enum float __FLT_MIN__ = float.min_normal;
	enum double __DBL_DENORM_MIN__ = double.min_normal;
	enum double __DBL_NORM_MAX__ = double.max;
	enum wchar_t __DBL_HAS_DENORM__ = 1;
	enum wchar_t __DBL_DIG__ = 15;
	enum wchar_t __DBL_DECIMAL_DIG__ = 17;
	enum double __DBL_EPSILON__ = 0x1p-52;
	enum wchar_t __DBL_HAS_INFINITY__ = 1;
	enum wchar_t __DBL_HAS_QUIET_NAN__ = 1;
	enum wchar_t __DBL_MANT_DIG__ = 53;
	enum wchar_t __DBL_MAX_10_EXP__ = 308;
	enum wchar_t __DBL_MAX_EXP__ = 1024;
	enum double __DBL_MAX__ = double.max;
	auto __DBL_MIN_10_EXP__()()
	{
		return -307;
	}
	auto __DBL_MIN_EXP__()()
	{
		return -1021;
	}
	enum double __DBL_MIN__ = 0x1p-1022;
	enum max_align_t __LDBL_DENORM_MIN__ = 4.94066e-324L;
	enum max_align_t __LDBL_NORM_MAX__ = 0x1.fffffffffffffp+1023L;
	enum wchar_t __LDBL_HAS_DENORM__ = 1;
	enum wchar_t __LDBL_DIG__ = 15;
	enum wchar_t __LDBL_DECIMAL_DIG__ = 17;
	enum max_align_t __LDBL_EPSILON__ = 0x1p-52L;
	enum wchar_t __LDBL_HAS_INFINITY__ = 1;
	enum wchar_t __LDBL_HAS_QUIET_NAN__ = 1;
	enum wchar_t __LDBL_MANT_DIG__ = 53;
	enum wchar_t __LDBL_MAX_10_EXP__ = 308;
	enum wchar_t __LDBL_MAX_EXP__ = 1024;
	enum max_align_t __LDBL_MAX__ = 0x1.fffffffffffffp+1023L;
	auto __LDBL_MIN_10_EXP__()()
	{
		return -307;
	}
	auto __LDBL_MIN_EXP__()()
	{
		return -1021;
	}
	enum max_align_t __LDBL_MIN__ = 0x1p-1022L;
	enum wchar_t __POINTER_WIDTH__ = 64;
	enum wchar_t __BIGGEST_ALIGNMENT__ = 8;
	enum __INT8_FMTd__ = "hhd";
	enum __INT8_FMTi__ = "hhi";
	enum __INT16_FMTd__ = "hd";
	enum __INT16_FMTi__ = "hi";
	enum __INT32_FMTd__ = "d";
	enum __INT32_FMTi__ = "i";
	enum __INT64_FMTd__ = "lld";
	enum __INT64_FMTi__ = "lli";
	enum __UINT8_FMTo__ = "hho";
	enum __UINT8_FMTu__ = "hhu";
	enum __UINT8_FMTx__ = "hhx";
	enum __UINT8_FMTX__ = "hhX";
	enum wchar_t __UINT8_MAX__ = 255;
	enum wchar_t __INT8_MAX__ = 127;
	enum __UINT16_FMTo__ = "ho";
	enum __UINT16_FMTu__ = "hu";
	enum __UINT16_FMTx__ = "hx";
	enum __UINT16_FMTX__ = "hX";
	enum wchar_t __UINT16_MAX__ = 65535;
	enum wchar_t __INT16_MAX__ = 32767;
	enum __UINT32_FMTo__ = "o";
	enum __UINT32_FMTu__ = "u";
	enum __UINT32_FMTx__ = "x";
	enum __UINT32_FMTX__ = "X";
	enum __uint32_t __UINT32_MAX__ = 4294967295u;
	enum wchar_t __INT32_MAX__ = 2147483647;
	enum __UINT64_FMTo__ = "llo";
	enum __UINT64_FMTu__ = "llu";
	enum __UINT64_FMTx__ = "llx";
	enum __UINT64_FMTX__ = "llX";
	enum __uint64_t __UINT64_MAX__ = 18446744073709551615LU;
	enum ptrdiff_t __INT64_MAX__ = 9223372036854775807L;
	enum wchar_t __INT_LEAST8_MAX__ = 127;
	enum wchar_t __INT_LEAST8_WIDTH__ = 8;
	enum __INT_LEAST8_FMTd__ = "hhd";
	enum __INT_LEAST8_FMTi__ = "hhi";
	enum wchar_t __UINT_LEAST8_MAX__ = 255;
	enum __UINT_LEAST8_FMTo__ = "hho";
	enum __UINT_LEAST8_FMTu__ = "hhu";
	enum __UINT_LEAST8_FMTx__ = "hhx";
	enum __UINT_LEAST8_FMTX__ = "hhX";
	enum wchar_t __INT_LEAST16_MAX__ = 32767;
	enum wchar_t __INT_LEAST16_WIDTH__ = 16;
	enum __INT_LEAST16_FMTd__ = "hd";
	enum __INT_LEAST16_FMTi__ = "hi";
	enum wchar_t __UINT_LEAST16_MAX__ = 65535;
	enum __UINT_LEAST16_FMTo__ = "ho";
	enum __UINT_LEAST16_FMTu__ = "hu";
	enum __UINT_LEAST16_FMTx__ = "hx";
	enum __UINT_LEAST16_FMTX__ = "hX";
	enum wchar_t __INT_LEAST32_MAX__ = 2147483647;
	enum wchar_t __INT_LEAST32_WIDTH__ = 32;
	enum __INT_LEAST32_FMTd__ = "d";
	enum __INT_LEAST32_FMTi__ = "i";
	enum __uint32_t __UINT_LEAST32_MAX__ = 4294967295u;
	enum __UINT_LEAST32_FMTo__ = "o";
	enum __UINT_LEAST32_FMTu__ = "u";
	enum __UINT_LEAST32_FMTx__ = "x";
	enum __UINT_LEAST32_FMTX__ = "X";
	enum ptrdiff_t __INT_LEAST64_MAX__ = 9223372036854775807L;
	enum wchar_t __INT_LEAST64_WIDTH__ = 64;
	enum __INT_LEAST64_FMTd__ = "lld";
	enum __INT_LEAST64_FMTi__ = "lli";
	enum __uint64_t __UINT_LEAST64_MAX__ = 18446744073709551615LU;
	enum __UINT_LEAST64_FMTo__ = "llo";
	enum __UINT_LEAST64_FMTu__ = "llu";
	enum __UINT_LEAST64_FMTx__ = "llx";
	enum __UINT_LEAST64_FMTX__ = "llX";
	enum wchar_t __INT_FAST8_MAX__ = 127;
	enum wchar_t __INT_FAST8_WIDTH__ = 8;
	enum __INT_FAST8_FMTd__ = "hhd";
	enum __INT_FAST8_FMTi__ = "hhi";
	enum wchar_t __UINT_FAST8_MAX__ = 255;
	enum __UINT_FAST8_FMTo__ = "hho";
	enum __UINT_FAST8_FMTu__ = "hhu";
	enum __UINT_FAST8_FMTx__ = "hhx";
	enum __UINT_FAST8_FMTX__ = "hhX";
	enum wchar_t __INT_FAST16_MAX__ = 32767;
	enum wchar_t __INT_FAST16_WIDTH__ = 16;
	enum __INT_FAST16_FMTd__ = "hd";
	enum __INT_FAST16_FMTi__ = "hi";
	enum wchar_t __UINT_FAST16_MAX__ = 65535;
	enum __UINT_FAST16_FMTo__ = "ho";
	enum __UINT_FAST16_FMTu__ = "hu";
	enum __UINT_FAST16_FMTx__ = "hx";
	enum __UINT_FAST16_FMTX__ = "hX";
	enum wchar_t __INT_FAST32_MAX__ = 2147483647;
	enum wchar_t __INT_FAST32_WIDTH__ = 32;
	enum __INT_FAST32_FMTd__ = "d";
	enum __INT_FAST32_FMTi__ = "i";
	enum __uint32_t __UINT_FAST32_MAX__ = 4294967295u;
	enum __UINT_FAST32_FMTo__ = "o";
	enum __UINT_FAST32_FMTu__ = "u";
	enum __UINT_FAST32_FMTx__ = "x";
	enum __UINT_FAST32_FMTX__ = "X";
	enum ptrdiff_t __INT_FAST64_MAX__ = 9223372036854775807L;
	enum wchar_t __INT_FAST64_WIDTH__ = 64;
	enum __INT_FAST64_FMTd__ = "lld";
	enum __INT_FAST64_FMTi__ = "lli";
	enum __uint64_t __UINT_FAST64_MAX__ = 18446744073709551615LU;
	enum __UINT_FAST64_FMTo__ = "llo";
	enum __UINT_FAST64_FMTu__ = "llu";
	enum __UINT_FAST64_FMTx__ = "llx";
	enum __UINT_FAST64_FMTX__ = "llX";
	enum wchar_t __NO_MATH_ERRNO__ = 1;
	enum wchar_t __FINITE_MATH_ONLY__ = 0;
	enum wchar_t __GNUC_STDC_INLINE__ = 1;
	enum wchar_t __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
	enum wchar_t __GCC_DESTRUCTIVE_SIZE = 64;
	enum wchar_t __GCC_CONSTRUCTIVE_SIZE = 64;
	enum wchar_t __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_INT_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
	enum wchar_t __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_INT_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_LONG_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
	enum wchar_t __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
	enum wchar_t __NO_INLINE__ = 1;
	enum wchar_t __PIC__ = 2;
	enum wchar_t __pic__ = 2;
	enum wchar_t __FLT_RADIX__ = 2;
	enum wchar_t __SSP__ = 1;
	enum wchar_t TARGET_OS_WIN32 = 0;
	enum wchar_t TARGET_OS_WINDOWS = 0;
	enum wchar_t TARGET_OS_LINUX = 0;
	enum wchar_t TARGET_OS_UNIX = 0;
	enum wchar_t TARGET_OS_MAC = 1;
	enum wchar_t TARGET_OS_OSX = 1;
	enum wchar_t TARGET_OS_IPHONE = 0;
	enum wchar_t TARGET_OS_IOS = 0;
	enum wchar_t TARGET_OS_TV = 0;
	enum wchar_t TARGET_OS_WATCH = 0;
	enum wchar_t TARGET_OS_DRIVERKIT = 0;
	enum wchar_t TARGET_OS_MACCATALYST = 0;
	enum wchar_t TARGET_OS_SIMULATOR = 0;
	enum wchar_t TARGET_OS_VISION = 0;
	enum wchar_t TARGET_OS_BRIDGE = 0;
	enum wchar_t TARGET_OS_EMBEDDED = 0;
	enum wchar_t TARGET_OS_NANO = 0;
	enum wchar_t TARGET_IPHONE_SIMULATOR = 0;
	enum wchar_t TARGET_OS_UIKITFORMAC = 0;
	enum wchar_t TARGET_OS_IOSMAC = 0;
	enum wchar_t TARGET_OS_XR = 0;
	enum wchar_t TARGET_OS_ARROW = 1;
	enum wchar_t __AARCH64EL__ = 1;
	enum wchar_t __aarch64__ = 1;
	enum wchar_t __GCC_ASM_FLAG_OUTPUTS__ = 1;
	enum wchar_t __AARCH64_CMODEL_SMALL__ = 1;
	enum wchar_t __ARM_ACLE = 200;
	enum wchar_t __ARM_ARCH = 8;
	enum wchar_t __ARM_ARCH_PROFILE = 65;
	enum wchar_t __ARM_64BIT_STATE = 1;
	enum wchar_t __ARM_PCS_AAPCS64 = 1;
	enum wchar_t __ARM_ARCH_ISA_A64 = 1;
	enum wchar_t __ARM_FEATURE_CLZ = 1;
	enum wchar_t __ARM_FEATURE_FMA = 1;
	enum wchar_t __ARM_FEATURE_LDREX = 15;
	enum wchar_t __ARM_FEATURE_IDIV = 1;
	enum wchar_t __ARM_FEATURE_DIV = 1;
	enum wchar_t __ARM_FEATURE_NUMERIC_MAXMIN = 1;
	enum wchar_t __ARM_FEATURE_DIRECTED_ROUNDING = 1;
	enum wchar_t __ARM_ALIGN_MAX_STACK_PWR = 4;
	enum wchar_t __ARM_STATE_ZA = 1;
	enum wchar_t __ARM_STATE_ZT0 = 1;
	enum wchar_t __ARM_FP = 14;
	enum wchar_t __ARM_FP16_FORMAT_IEEE = 1;
	enum wchar_t __ARM_FP16_ARGS = 1;
	enum wchar_t __ARM_SIZEOF_WCHAR_T = 4;
	enum wchar_t __ARM_SIZEOF_MINIMAL_ENUM = 4;
	enum wchar_t __ARM_NEON = 1;
	enum wchar_t __ARM_NEON_FP = 14;
	enum wchar_t __ARM_FEATURE_CRC32 = 1;
	enum wchar_t __ARM_FEATURE_RCPC = 1;
	enum wchar_t __HAVE_FUNCTION_MULTI_VERSIONING = 1;
	enum wchar_t __ARM_FEATURE_CRYPTO = 1;
	enum wchar_t __ARM_FEATURE_AES = 1;
	enum wchar_t __ARM_FEATURE_SHA2 = 1;
	enum wchar_t __ARM_FEATURE_SHA3 = 1;
	enum wchar_t __ARM_FEATURE_SHA512 = 1;
	enum wchar_t __ARM_FEATURE_PAUTH = 1;
	enum wchar_t __ARM_FEATURE_BTI = 1;
	enum wchar_t __ARM_FEATURE_UNALIGNED = 1;
	enum wchar_t __ARM_FEATURE_FP16_VECTOR_ARITHMETIC = 1;
	enum wchar_t __ARM_FEATURE_FP16_SCALAR_ARITHMETIC = 1;
	enum wchar_t __ARM_FEATURE_DOTPROD = 1;
	enum wchar_t __ARM_FEATURE_ATOMICS = 1;
	enum wchar_t __ARM_FEATURE_FP16_FML = 1;
	enum wchar_t __ARM_FEATURE_FRINT = 1;
	enum wchar_t __ARM_ARCH_8_3__ = 1;
	enum wchar_t __ARM_FEATURE_COMPLEX = 1;
	enum wchar_t __ARM_FEATURE_JCVT = 1;
	enum wchar_t __ARM_FEATURE_QRDMX = 1;
	enum wchar_t __ARM_ARCH_8_4__ = 1;
	enum wchar_t __ARM_ARCH_8_5__ = 1;
	enum wchar_t __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
	enum wchar_t __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
	enum wchar_t __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
	enum wchar_t __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
	enum wchar_t __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
	enum wchar_t __FP_FAST_FMA = 1;
	enum wchar_t __FP_FAST_FMAF = 1;
	enum wchar_t __AARCH64_SIMD__ = 1;
	enum wchar_t __ARM64_ARCH_8__ = 1;
	enum wchar_t __ARM_NEON__ = 1;
	enum wchar_t __arm64 = 1;
	enum wchar_t __arm64__ = 1;
	enum wchar_t __APPLE_CC__ = 6000;
	enum wchar_t __APPLE__ = 1;
	enum wchar_t __STDC_NO_THREADS__ = 1;
	enum wchar_t __apple_build_version__ = 17000013;
	enum wchar_t __DYNAMIC__ = 1;
	enum wchar_t __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = 110000;
	enum wchar_t __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__ = 110000;
	enum wchar_t __MACH__ = 1;
	enum wchar_t __STDC__ = 1;
	enum wchar_t __STDC_HOSTED__ = 1;
	enum ptrdiff_t __STDC_VERSION__ = 201112L;
	enum wchar_t __STDC_UTF_16__ = 1;
	enum wchar_t __STDC_UTF_32__ = 1;
	enum wchar_t __STDC_EMBED_NOT_FOUND__ = 0;
	enum wchar_t __STDC_EMBED_FOUND__ = 1;
	enum wchar_t __STDC_EMBED_EMPTY__ = 2;
	enum wchar_t __GCC_HAVE_DWARF2_CFI_ASM = 1;
	enum wchar_t __IMPORTC__ = 1;
	auto __builtin_isnan(__MP1)(__MP1 x)
	{
		return isnan(x);
	}
	auto __builtin_isfinite(__MP2)(__MP2 x)
	{
		return finite(x);
	}
	auto __has_feature(__MP3)(__MP3 x)
	{
		return 0;
	}
	auto __has_extension(__MP4)(__MP4 x)
	{
		return 0;
	}
	auto __builtin___memmove_chk(__MP5, __MP6, __MP7, __MP8)(__MP5 dest, __MP6 src, __MP7 len, __MP8 x)
	{
		return memmove(dest, src, len);
	}
	auto __builtin___memcpy_chk(__MP9, __MP10, __MP11, __MP12)(__MP9 dest, __MP10 src, __MP11 len, __MP12 x)
	{
		return memcpy(dest, src, len);
	}
	auto __builtin___memset_chk(__MP13, __MP14, __MP15, __MP16)(__MP13 dest, __MP14 val, __MP15 len, __MP16 x)
	{
		return memset(dest, val, len);
	}
	auto __builtin___stpcpy_chk(__MP17, __MP18, __MP19)(__MP17 dest, __MP18 src, __MP19 x)
	{
		return stpcpy(dest, src);
	}
	auto __builtin___stpncpy_chk(__MP20, __MP21, __MP22, __MP23)(__MP20 dest, __MP21 src, __MP22 len, __MP23 x)
	{
		return stpncpy(dest, src, len);
	}
	auto __builtin___strcat_chk(__MP24, __MP25, __MP26)(__MP24 dest, __MP25 src, __MP26 x)
	{
		return strcat(dest, src);
	}
	auto __builtin___strcpy_chk(__MP27, __MP28, __MP29)(__MP27 dest, __MP28 src, __MP29 x)
	{
		return strcpy(dest, src);
	}
	auto __builtin___strncat_chk(__MP30, __MP31, __MP32, __MP33)(__MP30 dest, __MP31 src, __MP32 len, __MP33 x)
	{
		return strncat(dest, src, len);
	}
	auto __builtin___strncpy_chk(__MP34, __MP35, __MP36, __MP37)(__MP34 dest, __MP35 src, __MP36 len, __MP37 x)
	{
		return strncpy(dest, src, len);
	}
	auto __builtin___strlcat_chk(__MP38, __MP39, __MP40, __MP41)(__MP38 dest, __MP39 src, __MP40 x, __MP41 n)
	{
		return strlcat(dest, src, x);
	}
	auto __builtin___strlcpy_chk(__MP42, __MP43, __MP44, __MP45)(__MP42 dest, __MP43 src, __MP44 x, __MP45 n)
	{
		return strlcpy(dest, src, x);
	}
	enum wchar_t __STDC_NO_VLA__ = 1;
	enum wchar_t __bool_true_false_are_defined = 1;
	auto NULL()()
	{
		return cast(void*)0;
	}
	auto offsetof(__MP50, __MP51)(__MP50 t, __MP51 d)
	{
		return __builtin_offsetof(t, d);
	}
	enum wchar_t __WORDSIZE = 64;
	auto __has_cpp_attribute(__MP52)(__MP52 x)
	{
		return 0;
	}
	auto __P(__MP53)(__MP53 protos)
	{
		return protos;
	}
	auto __COPYRIGHT(__MP72)(__MP72 s)
	{
		return __IDSTRING(copyright, s);
	}
	auto __RCSID(__MP73)(__MP73 s)
	{
		return __IDSTRING(rcsid, s);
	}
	auto __SCCSID(__MP74)(__MP74 s)
	{
		return __IDSTRING(sccsid, s);
	}
	auto __PROJECT_VERSION(__MP75)(__MP75 s)
	{
		return __IDSTRING(project_version, s);
	}
	enum wchar_t __has_safe_buffers = 1;
	enum wchar_t __DARWIN_ONLY_64_BIT_INO_T = 1;
	enum wchar_t __DARWIN_ONLY_UNIX_CONFORMANCE = 1;
	enum wchar_t __DARWIN_ONLY_VERS_1050 = 1;
	enum wchar_t __DARWIN_UNIX03 = 1;
	enum wchar_t __DARWIN_64_BIT_INO_T = 1;
	enum wchar_t __DARWIN_VERS_1050 = 1;
	enum wchar_t __DARWIN_NON_CANCELABLE = 0;
	enum __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(__MP184)(__MP184 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(__MP185)(__MP185 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(__MP186)(__MP186 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(__MP187)(__MP187 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(__MP188)(__MP188 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(__MP189)(__MP189 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(__MP190)(__MP190 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(__MP191)(__MP191 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(__MP192)(__MP192 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(__MP193)(__MP193 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(__MP194)(__MP194 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(__MP195)(__MP195 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(__MP196)(__MP196 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(__MP197)(__MP197 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(__MP198)(__MP198 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(__MP199)(__MP199 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(__MP200)(__MP200 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(__MP201)(__MP201 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(__MP202)(__MP202 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(__MP203)(__MP203 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(__MP204)(__MP204 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(__MP205)(__MP205 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(__MP206)(__MP206 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(__MP207)(__MP207 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(__MP208)(__MP208 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(__MP209)(__MP209 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(__MP210)(__MP210 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(__MP211)(__MP211 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(__MP212)(__MP212 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(__MP213)(__MP213 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(__MP214)(__MP214 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1(__MP215)(__MP215 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_4(__MP216)(__MP216 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_10_16(__MP217)(__MP217 x)
	{
		return x;
	}
	auto __DARWIN_ALIAS_STARTING_MAC___MAC_11_0(__MP218)(__MP218 x)
	{
		return x;
	}
	enum ptrdiff_t __DARWIN_C_ANSI = 4096L;
	enum ptrdiff_t __DARWIN_C_FULL = 900000L;
	enum wchar_t __DARWIN_NO_LONG_LONG = 0;
	enum wchar_t _DARWIN_FEATURE_64_BIT_INODE = 1;
	enum wchar_t _DARWIN_FEATURE_ONLY_64_BIT_INODE = 1;
	enum wchar_t _DARWIN_FEATURE_ONLY_VERS_1050 = 1;
	enum wchar_t _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;
	enum wchar_t _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;
	enum wchar_t __has_ptrcheck = 0;
	enum wchar_t __has_bounds_safety_attributes = 0;
	auto __unsafe_forge_single(__MP268, __MP269)(__MP268 T, __MP269 P)
	{
		return T(P);
	}
	auto __unsafe_forge_terminated_by(__MP270, __MP271, __MP272)(__MP270 T, __MP271 P, __MP272 E)
	{
		return T(P);
	}
	auto __unsafe_forge_null_terminated(__MP273, __MP274)(__MP273 T, __MP274 P)
	{
		return T(P);
	}
	auto __unsafe_forge_bidi_indexable(__MP275, __MP276, __MP277)(__MP275 T, __MP276 P, __MP277 S)
	{
		return T(P);
	}
	auto __terminated_by_to_indexable(__MP278)(__MP278 P)
	{
		return P;
	}
	auto __unsafe_terminated_by_to_indexable(__MP279)(__MP279 P)
	{
		return P;
	}
	auto __null_terminated_to_indexable(__MP280)(__MP280 P)
	{
		return P;
	}
	auto __unsafe_null_terminated_to_indexable(__MP281)(__MP281 P)
	{
		return P;
	}
	auto __DARWIN_NULL()()
	{
		return cast(void*)0;
	}
	enum wchar_t __PTHREAD_SIZE__ = 8176;
	enum wchar_t __PTHREAD_ATTR_SIZE__ = 56;
	enum wchar_t __PTHREAD_MUTEXATTR_SIZE__ = 8;
	enum wchar_t __PTHREAD_MUTEX_SIZE__ = 56;
	enum wchar_t __PTHREAD_CONDATTR_SIZE__ = 8;
	enum wchar_t __PTHREAD_COND_SIZE__ = 40;
	enum wchar_t __PTHREAD_ONCE_SIZE__ = 8;
	enum wchar_t __PTHREAD_RWLOCK_SIZE__ = 192;
	enum wchar_t __PTHREAD_RWLOCKATTR_SIZE__ = 16;
	auto __offsetof(__MP283, __MP284)(__MP283 type, __MP284 field)
	{
		return __builtin_offsetof(type, field);
	}
	auto INT8_C(__MP285)(__MP285 v)
	{
		return v;
	}
	auto INT16_C(__MP286)(__MP286 v)
	{
		return v;
	}
	auto INT32_C(__MP287)(__MP287 v)
	{
		return v;
	}
	auto UINT8_C(__MP289)(__MP289 v)
	{
		return v;
	}
	auto UINT16_C(__MP290)(__MP290 v)
	{
		return v;
	}
	enum wchar_t INT8_MAX = 127;
	enum wchar_t INT16_MAX = 32767;
	enum wchar_t INT32_MAX = 2147483647;
	enum ptrdiff_t INT64_MAX = 9223372036854775807L;
	enum wchar_t INT8_MIN = -128;
	enum wchar_t INT16_MIN = -32768;
	auto INT32_MIN()()
	{
		return -INT32_MAX - 1;
	}
	auto INT64_MIN()()
	{
		return -INT64_MAX - 1;
	}
	enum wchar_t UINT8_MAX = 255;
	enum wchar_t UINT16_MAX = 65535;
	enum __uint32_t UINT32_MAX = 4294967295u;
	enum __uint64_t UINT64_MAX = 18446744073709551615LU;
	enum ptrdiff_t INTPTR_MAX = 9223372036854775807L;
	auto INTPTR_MIN()()
	{
		return -INTPTR_MAX - 1;
	}
	enum __uint64_t UINTPTR_MAX = 18446744073709551615LU;
	auto INTMAX_MIN()()
	{
		return -INTMAX_MAX - 1;
	}
	auto WCHAR_MIN()()
	{
		return -WCHAR_MAX - 1;
	}
}
import __importc_builtins;
