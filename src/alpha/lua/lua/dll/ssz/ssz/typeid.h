
static const int32_t       VOID_TYPEID =        0x80000000  ;

static const int32_t       BYTE_TYPEID =      ~VOID_TYPEID  ;
static const int32_t      SHORT_TYPEID =       BYTE_TYPEID-1;
static const int32_t        INT_TYPEID =      SHORT_TYPEID-1;
static const int32_t       LONG_TYPEID =        INT_TYPEID-1;
static const int32_t      UBYTE_TYPEID =       LONG_TYPEID-1;
static const int32_t     USHORT_TYPEID =      UBYTE_TYPEID-1;
static const int32_t       UINT_TYPEID =     USHORT_TYPEID-1;
static const int32_t      ULONG_TYPEID =       UINT_TYPEID-1;
static const int32_t       CHAR_TYPEID =      ULONG_TYPEID-1;
static const int32_t    ADDRESS_TYPEID =       CHAR_TYPEID-1;
static const int32_t      FLOAT_TYPEID =    ADDRESS_TYPEID-1;
static const int32_t     DOUBLE_TYPEID =      FLOAT_TYPEID-1;
static const int32_t       BOOL_TYPEID =     DOUBLE_TYPEID-1;
static const int32_t    RESERVE_TYPEID =       BOOL_TYPEID-1;
static const int32_t  SIGNATURE_TYPEID =    RESERVE_TYPEID-1;
static const int32_t   ENDCLASS_TYPEID =  SIGNATURE_TYPEID-1;

static const int32_t  ENDTHREAD_TYPEID =  ~ENDCLASS_TYPEID  ;
static const int32_t       FUNC_TYPEID =  ENDTHREAD_TYPEID-1;
static const int32_t     METHOD_TYPEID =       FUNC_TYPEID-1;
static const int32_t   DELEGATE_TYPEID =     METHOD_TYPEID-1;
static const int32_t        REF_TYPEID =   DELEGATE_TYPEID-1;
static const int32_t       LIST_TYPEID =        REF_TYPEID-1;
static const int32_t     DYNREF_TYPEID =       LIST_TYPEID-1;
static const int32_t    DYNLIST_TYPEID =     DYNREF_TYPEID-1;
static const int32_t     TMPREF_TYPEID =    DYNLIST_TYPEID-1;
static const int32_t    TMPLIST_TYPEID =     TMPREF_TYPEID-1;
static const int32_t  TMPDYNREF_TYPEID =    TMPLIST_TYPEID-1;
static const int32_t TMPDYNLIST_TYPEID =  TMPDYNREF_TYPEID-1;
static const int32_t SYSTEMUSED_TYPEID = TMPDYNLIST_TYPEID-1;
static const int32_t   WILDCARD_TYPEID = SYSTEMUSED_TYPEID-1;
static const int32_t    UNKNOWN_TYPEID =   WILDCARD_TYPEID-1;
