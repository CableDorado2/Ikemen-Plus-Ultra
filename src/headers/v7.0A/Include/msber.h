//$TAG BIZDEV
//  $IPCategory:     
//  $DealPointID:    8269
//  $AgreementName:  software license agreement
//  $AgreementType:  inbound license
//  $ExternalOrigin: boris nikolaus
//$ENDTAG

//$TAG ENGR 
//  $Owner:    denisi
//  $Module:   ds_published
//
//$ENDTAG

/* Copyright (C) Boris Nikolaus, Germany, 1996-1997. All rights reserved. */
/* Copyright (C) Microsoft Corporation 1997-1998, All rights reserved. */

#ifndef __MS_BER_H__
#define __MS_BER_H__

#include <msasn1.h>

#include <pshpack8.h> /* Assume 8 byte packing throughout */

#ifdef __cplusplus
extern "C" {
#endif


/*****************************************************************************
  ASN1BEREncCharString

  encode a string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncCharString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char_t *val 
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncCharString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char_t *val 
    );

/*****************************************************************************
  ASN1BEREncChar16String

  encode a 16 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncChar16String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char16_t *val
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncChar16String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char16_t *val
    );

/*****************************************************************************
  ASN1BEREncChar32String

  encode a 32 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncChar32String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char32_t *val
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncChar32String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_ecount( len )
                ASN1char32_t *val
    );

/*****************************************************************************
  ASN1BEREncOctetString

  encode an octet string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncOctetString(
    __in        ASN1encoding_t enc,
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_bcount_opt( len )
                ASN1octet_t *val
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncOctetString(
    __in        ASN1encoding_t enc,
                ASN1uint32_t tag, 
                ASN1uint32_t len, 
    __in_bcount( len )
                ASN1octet_t *val
    );

/*****************************************************************************
  ASN1BEREncBitString

  encode a bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncBitString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t bitlen, 
    __in_bcount( (bitlen + 7) / 8 )
                ASN1octet_t *val
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncBitString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t bitlen, 
    __in_bcount( (bitlen + 7) / 8 )
                ASN1octet_t *val
    );

/*****************************************************************************
  ASN1BEREncGeneralizedTime

  encode a generalized time value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncGeneralizedTime(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1generalizedtime_t *
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncGeneralizedTime(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1generalizedtime_t *
    );

/*****************************************************************************
  ASN1BEREncS32

   encode a signed integer value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncS32(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1int32_t
    );

/*****************************************************************************
  ASN1BEREncSX

   encode a signed multibyte integer value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncSX(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1intx_t *
    );

/*****************************************************************************
  ASN1BEREncZeroMultibyteString

   encode a multibyte string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncZeroMultibyteString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in_z      ASN1ztcharstring_t
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncZeroMultibyteString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in_z      ASN1ztcharstring_t
    );

/*****************************************************************************
  ASN1BEREncMultibyteString

   encode a multibyte string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncMultibyteString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1charstring_t *
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncMultibyteString(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1charstring_t *
    );

/*****************************************************************************
  ASN1BEREncNull

   encode a null value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncNull(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag
    );

/*****************************************************************************
  ASN1BEREncObjectIdentifier

   encode an object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncObjectIdentifier(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1objectidentifier_t *
    );

/*****************************************************************************
  ASN1BEREncObjectIdentifier2

   encode an object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncObjectIdentifier2(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1objectidentifier2_t *val
    );

/*****************************************************************************
  ASN1BEREncRemoveZeroBits

   remove trailing zero bits
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncRemoveZeroBits(
    __inout     ASN1uint32_t *nbits, 
    __in_bcount( (*nbits+7) / 8 )
                ASN1octet_t *val
    );

/*****************************************************************************
  ASN1BEREncRemoveZeroBits2

   remove trailing zero bits preserving min len
*****************************************************************************/
extern 
__success( return > 0 )
int 
ASN1API 
ASN1BEREncRemoveZeroBits2(
    __inout     ASN1uint32_t *nbits, 
    __in_bcount( (*nbits+7) / 8 )
                ASN1octet_t *val, 
                ASN1uint32_t minlen
    );


/*****************************************************************************
  ASN1BEREncUTCTime

   encode an utc time value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncUTCTime(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1utctime_t *
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncUTCTime(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1utctime_t *
    );

/*****************************************************************************
  ASN1BEREncFlush

  end of encoding
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncFlush(
    __in        ASN1encoding_t enc
    );

/*****************************************************************************
  ASN1BEREncOpenType

  encode an open type value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncOpenType(
    __in        ASN1encoding_t enc, 
    __in        ASN1open_t *
    );

/*****************************************************************************
  ASN1BERDecExplicitTag

  decode an explicit tag
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecExplicitTag(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out ASN1decoding_t *dd, 
    __deref_out ASN1octet_t **ppBufEnd
    );

/*****************************************************************************
  ASN1BERDecEndOfContents

  
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecEndOfContents(
    __in        ASN1decoding_t dec, 
    __in        ASN1decoding_t dd, 
    __in        ASN1octet_t *pBufEnd 
    );

/*****************************************************************************
  ASN1BERDecOctetString

  decode octet string value, making copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecOctetString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1octetstring_t *val
    );

/*****************************************************************************
  ASN1BERDecOctetString2

  decode octet string value, no copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecOctetString2(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1octetstring_t *val
    );

/*****************************************************************************
  ASN1BERDecBitString

  decode bit string value, making copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecBitString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1bitstring_t *val
    );

/*****************************************************************************
  ASN1BERDecBitString2

  decode bit string value, no copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecBitString2(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1bitstring_t *val
    );

/*****************************************************************************
  ASN1BERDecChar16String

  decode 16 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecChar16String(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1char16string_t *val
    );

/*****************************************************************************
  ASN1BERDecChar32String

  decode 32 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecChar32String(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1char32string_t *val
    );

/*****************************************************************************
  ASN1BERDecCharString

  decode string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecCharString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1charstring_t *val
    );


/*****************************************************************************
  ASN1BERDecGeneralizedTime

  decode generalized time value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecGeneralizedTime(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1generalizedtime_t *
    );

/*****************************************************************************
  ASN1BERDecZeroMultibyteString

  decode zero terminated string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecZeroMultibyteString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out_z
                ASN1ztcharstring_t *
    );

/*****************************************************************************
  ASN1BERDecMultibyteString

  decode multibyte string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecMultibyteString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1charstring_t *
    );

/*****************************************************************************
  ASN1BERDecNull

  decode NULL value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecNull(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag
    );

/*****************************************************************************
  ASN1BERDecObjectIdentifier

  decode object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecObjectIdentifier(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out ASN1objectidentifier_t *
    );

/*****************************************************************************
  ASN1BERDecObjectIdentifier2

  decode object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecObjectIdentifier2(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1objectidentifier2_t *val
    );

/*****************************************************************************
  ASN1BERDecS8Val

  decode integer into signed 8 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecS8Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1int8_t *val
    );

/*****************************************************************************
  ASN1BERDecS16Val

  decode integer into signed 16 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecS16Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1int16_t *val
    );

/*****************************************************************************
  ASN1BERDecS32Val

  decode integer into signed 32 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecS32Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1int32_t *val
    );

/*****************************************************************************
  ASN1BERDecSXVal

  decode integer into intx value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecSXVal(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1intx_t *val
    );

/*****************************************************************************
  ASN1BERDecU8Val

  decode integer into unsigned 8 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecU8Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1uint8_t *val
    );

/*****************************************************************************
  ASN1BERDecU16Val

  decode integer into unsigned 16 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecU16Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1uint16_t *val
    );

/*****************************************************************************
  ASN1BERDecU32Val

  decode integer into unsigned 32 bit value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecU32Val(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1uint32_t *val
    );

/*****************************************************************************
  ASN1BERDecUTCTime

  decode utc time value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecUTCTime(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1utctime_t *val
    );


/*****************************************************************************
  ASN1BERDecZeroCharString

  decode zero terminated string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecZeroCharString(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out_z
                ASN1ztcharstring_t *val
    );

/*****************************************************************************
  ASN1BERDecZeroCharString16

  decode zero terminated 16 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecZeroChar16String(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out_z
                ASN1ztchar16string_t *val
    );

/*****************************************************************************
  ASN1BERDecZeroCharString32

  decode zero terminated 32 bit string value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecZeroChar32String(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __deref_out_z
                ASN1ztchar32string_t *val
    );

/*****************************************************************************
  ASN1BERDecSkip

  skip a value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecSkip(
    __in  ASN1decoding_t dec
    );

/*****************************************************************************
  ASN1BERDecFlush

  finish decoding
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecFlush(
    __in  ASN1decoding_t dec
    );

/*****************************************************************************
  ASN1BERDecOpenType

  decode an open type value, make copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecOpenType(
    __in        ASN1decoding_t dec, 
    __out       ASN1open_t *val
    );

/*****************************************************************************
  ASN1BERDecOpenType2

  decode an open type value, no copy
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecOpenType2(
    __in        ASN1decoding_t dec, 
    __out       ASN1open_t *val
    );

/*****************************************************************************
 ASN1BEREncCheck
    
    check for space in encoding buffer
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncCheck(
    __in    ASN1encoding_t enc, 
            ASN1uint32_t noctets
    );

/*****************************************************************************
 ASN1BEREncTag
    
    encode a tag
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncTag(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag
    );

/*****************************************************************************
 ASN1BEREncExplicitTag
    
    encode explicit tag
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncExplicitTag(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __out       ASN1uint32_t *pnLenOff
    );

/*****************************************************************************
 ASN1BEREncEndOfContents
    
    encode definite length
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncEndOfContents(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t nLenOff
    );

/*****************************************************************************
 ASN1BEREncLength
    
    encode length
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncLength(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t len
    );

/*****************************************************************************
 ASN1BERDecCheck
    
    check if len octets are left in decoding stream
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecCheck(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t len
    );

/*****************************************************************************
 ASN1BERDecTag
    
    decode a tag value; return constructed bit if desired 
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecTag(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out_opt   ASN1uint32_t *constructed
    );

/*****************************************************************************
 ASN1BERDecLength
    
    decode length
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecLength(
    __in        ASN1decoding_t dec, 
    __out       ASN1uint32_t *len, 
    __out_opt   ASN1uint32_t *infinite
    );

/*****************************************************************************
 ASN1BERDecNotEndOfContents
    
    check if end of contents (of a constructed value) has been reached
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecNotEndOfContents(
    __in        ASN1decoding_t dec, 
    __in        ASN1octet_t *pBufEnd
    );

/*****************************************************************************
 ASN1BERDecPeekTag
    
    peek the following tag without advancing the read position
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecPeekTag(
    __in        ASN1decoding_t dec, 
    __out       ASN1uint32_t *tag
    );

/*****************************************************************************
 ASN1BEREncU32
    
    encode a unsigned integer value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncU32(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t
    );

/*****************************************************************************
 ASN1BEREncBool
    
    encode a boolean value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncBool(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1bool_t val
    );

/*****************************************************************************
 ASN1BERDecBool
    
    decode boolean into ASN1boot_t
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecBool(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1bool_t *val
    );

/*****************************************************************************
 ASN1BEREncEoid
    
    encode an object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncEoid(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
    __in        ASN1encodedOID_t *
    );

/*****************************************************************************
 ASN1BERDecEoid
    
    decode object identifier value
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecEoid(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1encodedOID_t *val
    );

/*****************************************************************************
 ASN1BERDotVal2Eoid
    
    convert ObjID string value to encoded
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDotVal2Eoid(
    __in        ASN1encoding_t enc, 
    __in_z      char *pszDotVal, 
    __out       ASN1encodedOID_t *pOut
    );

/*****************************************************************************
 ASN1BERDotVal2Eoid
    
    convert object identifier value to string
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREoid2DotVal(
    __in        ASN1decoding_t dec, 
    __in        ASN1encodedOID_t *pIn, 
    __deref_out char **ppszDotVal
    );

/*****************************************************************************
 ASN1BEREoid_free
    
*****************************************************************************/
extern ASN1_PUBLIC 
void 
ASN1API 
ASN1BEREoid_free(
    __in        ASN1encodedOID_t *val
    );

/*****************************************************************************
 ASN1BEREncUTF8String
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BEREncUTF8String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t length, 
    __in_ecount( length )
                WCHAR *value
    );

extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncUTF8String(
    __in        ASN1encoding_t enc, 
                ASN1uint32_t tag, 
                ASN1uint32_t length, 
    __in_ecount( length )
                WCHAR *value
    );

/*****************************************************************************
 ASN1BEREncUTF8String
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1BERDecUTF8String(
    __in        ASN1decoding_t dec, 
                ASN1uint32_t tag, 
    __out       ASN1wstring_t *val
    );


/*****************************************************************************
 ASN1DEREncBeginBlk
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncBeginBlk(
    __in        ASN1encoding_t enc, 
                ASN1blocktype_e eBlkType, 
    __deref_out void **ppBlk
    );

/*****************************************************************************
 ASN1DEREncNewBlkElement
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncNewBlkElement(
    __in        void *pBlk, 
    __deref_out ASN1encoding_t *enc2
    );

/*****************************************************************************
 ASN1DEREncFlushBlkElement
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncFlushBlkElement(
    __in        void *pBlk
    );

/*****************************************************************************
 ASN1DEREncEndBlk
    
*****************************************************************************/
extern ASN1_PUBLIC
__success( return > 0 )
int
ASN1API
ASN1DEREncEndBlk(
    __in        void *pBlk
    );


/*****************************************************************************
 DEPRECATED APIs - DO NOT USE
    
*****************************************************************************/

extern ASN1_PUBLIC int ASN1API ASN1BERDecDouble(ASN1decoding_t dec, ASN1uint32_t tag, double *);
extern ASN1_PUBLIC int ASN1API ASN1BEREncDouble(ASN1encoding_t enc, ASN1uint32_t tag, double);
extern ASN1_PUBLIC int ASN1API ASN1CEREncBitString(ASN1encoding_t enc, ASN1uint32_t, ASN1uint32_t, ASN1octet_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncChar16String(ASN1encoding_t enc, ASN1uint32_t, ASN1uint32_t, ASN1char16_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncChar32String(ASN1encoding_t enc, ASN1uint32_t, ASN1uint32_t, ASN1char32_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncCharString(ASN1encoding_t enc, ASN1uint32_t, ASN1uint32_t, ASN1char_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncMultibyteString(ASN1encoding_t enc, ASN1uint32_t, ASN1charstring_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncOctetString(ASN1encoding_t enc, ASN1uint32_t, ASN1uint32_t, ASN1octet_t *);
extern ASN1_PUBLIC int ASN1API ASN1CEREncZeroMultibyteString(ASN1encoding_t enc, ASN1uint32_t, ASN1ztcharstring_t);


#ifdef __cplusplus
}
#endif

#include <poppack.h> /* End 8-byte packing */

#endif // __MS_BER_H__

