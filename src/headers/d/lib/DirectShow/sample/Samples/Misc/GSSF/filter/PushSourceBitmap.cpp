/****************************************************************************
This sample is released as public domain.  It is distributed in the hope that 
it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

// This sample was born as the PushSourceBitmap sample from the DXSDK.  However,
// little remains of that original code except some of the class/method names.

// See the readme.txt file for a discussion of how to use this filter

#include <streams.h>

#include "PushSource.h"
#include "PushGuids.h"

/**********************************************
 *
 *  CPushPinBitmap Class
 *
 *
 **********************************************/

CPushPinBitmap::CPushPinBitmap(HRESULT *phr, CSource *pFilter)
      : CSourceStream(NAME("Generic Sample Pin"), phr, pFilter, L"Out"),
		m_Callback(NULL),
		m_lBufferSize(0)
{
}

CPushPinBitmap::~CPushPinBitmap()
{
    if (m_Callback != NULL)
    {
	    m_Callback->Release();
    }
}


// GetMediaType: This method tells the downstream pin what types we support.

// Here is how CSourceStream deals with media types:
//
// If you support exactly one type, override GetMediaType(CMediaType*). It will then be
// called when (a) our filter proposes a media type, (b) the other filter proposes a
// type and we have to check that type.
//
// If you support > 1 type, override GetMediaType(int,CMediaType*) AND CheckMediaType.
//
// In this case we support only one type.

HRESULT CPushPinBitmap::GetMediaType(CMediaType *pMediaType)
{
	HRESULT hr = S_OK;

    CheckPointer(pMediaType, E_POINTER);

    CAutoLock cAutoLock(m_pFilter->pStateLock());

    // If the bitmapinfo hasn't been loaded, just fail here.
    if (m_amt.IsValid())
    {
		hr = pMediaType->Set(m_amt);
	}
	else
	{
        hr = E_FAIL;
    }

	return hr;
}

// DecideBufferSize: Calculate the size and number of buffers

HRESULT CPushPinBitmap::DecideBufferSize(IMemAllocator *pAlloc, ALLOCATOR_PROPERTIES *pRequest)
{
    HRESULT hr;

    CheckPointer(pAlloc, E_POINTER);
    CheckPointer(pRequest, E_POINTER);

    CAutoLock cAutoLock(m_pFilter->pStateLock());

    // If the bitmapinfo hasn't been loaded, just fail here.
    if (!m_amt.IsValid())
    {
        return E_FAIL;
    }

    // Ensure a minimum number of buffers
    if (pRequest->cBuffers == 0)
    {
        pRequest->cBuffers = 2;
    }

	pRequest->cbBuffer = m_lBufferSize;

    ALLOCATOR_PROPERTIES Actual;
    hr = pAlloc->SetProperties(pRequest, &Actual);
    if (SUCCEEDED(hr))
    {
		// Is this allocator unsuitable?
		if (Actual.cbBuffer < pRequest->cbBuffer)
		{
			hr = E_FAIL;
		}
	}

    return hr;
}


// FillBuffer: Called by the BaseClasses once for every sample in the stream.

// It calls the callback to populate the sample

HRESULT CPushPinBitmap::FillBuffer(IMediaSample *pSample)
{
	HRESULT hr = S_OK;

    CheckPointer(pSample, E_POINTER);
	CheckPointer(m_Callback, E_POINTER);

    CAutoLock cAutoLock(m_pFilter->pStateLock());

	hr = m_Callback->SampleCallback(pSample);

	return hr;
}


// Standard COM stuff done with a baseclasses flavor

STDMETHODIMP CPushPinBitmap::NonDelegatingQueryInterface(REFIID riid, void **ppv)
{
    if (riid == IID_IGenericSampleConfig)
    {
        return GetInterface((IGenericSampleConfig *) this, ppv);
    }
    return CSourceStream::NonDelegatingQueryInterface(riid, ppv);
}


/**********************************************
 *
 *  IGenericSampleConfig methods 
 *
 **********************************************/

// SetMediaTypeFromBitmap: Populate the media type from a passed in bitmap.  

// Note that we need the FramesPerSecond to build the VIDEOINFOHEADER.  This
// is the entry point for IGenericSampleConfig::SetMediaTypeFromBitmap

STDMETHODIMP CPushPinBitmap::SetMediaTypeFromBitmap(BITMAPINFOHEADER *bmi, LONGLONG lFPS)
{
	HRESULT hr = S_OK;

    CheckPointer(bmi, E_POINTER);

    CAutoLock cAutoLock(m_pFilter->pStateLock());

    // Only allow one init
    if (!m_amt.IsValid())
    {
		if (bmi->biSize == sizeof(BITMAPINFOHEADER))
		{
			hr = CreateMediaTypeFromBMI(bmi, lFPS);
		}
		else
		{
			hr = MAKE_HRESULT(1, FACILITY_WIN32, ERROR_BAD_LENGTH); 
		}
	}
	else
	{
        hr = MAKE_HRESULT(1, FACILITY_WIN32, ERROR_ALREADY_INITIALIZED);
    }

    return hr;
}

// SetMediaType: Populate the media type from a completly constructed media type.  

// Note that since I'm going to need the buffer size, the media type
// must be one I know how to parse.  Otherwise use SetMediaTypeEx
// and pass in the size.  This is the entry point for IGenericSampleConfig::SetMediaType

STDMETHODIMP CPushPinBitmap::SetMediaType(AM_MEDIA_TYPE *amt)
{
	HRESULT hr = S_OK;

    CheckPointer(amt, E_POINTER);

	// I don't lock the CS here since I'm just calling SetMediaTypeEx (which does)

	if (IsEqualGUID(amt->formattype, FORMAT_VideoInfo) && (amt->pbFormat != NULL) && (amt->cbFormat == sizeof(VIDEOINFOHEADER)))
	{
		// Parse out the size
		VIDEOINFOHEADER *pvi = (VIDEOINFOHEADER*) amt->pbFormat;
		hr = SetMediaTypeEx(amt, pvi->bmiHeader.biSizeImage);
	}
	else
	{
		hr = MAKE_HRESULT(1, FACILITY_WIN32, ERROR_INVALID_PARAMETER);
	}

	return hr;
}

// SetMediaTypeEx: Populate the media type from a completely constructed media type.  

// If you aren't using a media type that I know how to get the buffer size from, use this 
// method and provide it explicitly.  This is the entry point for IGenericSampleConfig::SetMediaTypeEx

STDMETHODIMP CPushPinBitmap::SetMediaTypeEx(AM_MEDIA_TYPE *amt, long lBufferSize)
{
	HRESULT hr = S_OK;
    CAutoLock cAutoLock(m_pFilter->pStateLock());
	
    // Only allow one init
    if (!m_amt.IsValid())
    {
		// Don't allow GUID_NULL for the major type (since that's what I
		// use to indicate an unpopulated MediaType).
		if (!IsEqualGUID(amt->majortype, GUID_NULL))
		{
			hr = m_amt.Set(*amt);
			m_lBufferSize = lBufferSize;
		}
		else
		{
			hr = MAKE_HRESULT(1, FACILITY_WIN32, ERROR_INVALID_PARAMETER);
		}
	}
	else
	{
        hr = MAKE_HRESULT(1, FACILITY_WIN32, ERROR_ALREADY_INITIALIZED);
    }

	return hr;
}

// SetBitmapCB: Set the callback.  

// You must call one of the SetMediaType* methods first.  Notice
// that there is no check to ensure the CB wasn't already set.  While
// I haven't tried it, I suspect you could change this even while
// the graph is running.  Why you would want to is a more difficult
// question.

STDMETHODIMP CPushPinBitmap::SetBitmapCB(IGenericSampleCB *pfn)
{
	HRESULT hr = S_OK;

    CheckPointer(pfn, E_POINTER);

    CAutoLock cAutoLock(m_pFilter->pStateLock());

    if (m_amt.IsValid())
    {
		m_Callback = pfn;
		m_Callback->AddRef();
	}
	else
	{
		// The media type must be specified first
        hr = E_FAIL;
    }

    return hr;
}

// CreateMediaTypeFromBMI: This private method initializes the pin's mediatype from a BITMAPINFOHEADER

// Note the we also need the FramesPerSecond to correctly create the VIDEOINFOHEADER struct.

HRESULT CPushPinBitmap::CreateMediaTypeFromBMI(BITMAPINFOHEADER *bmi, LONGLONG lFPS)
{
    // Allocate enough room for the VIDEOINFOHEADER and the color tables
    VIDEOINFOHEADER *pvi = (VIDEOINFOHEADER*)m_amt.AllocFormatBuffer(SIZE_PREHEADER + bmi->biSize);
    if (pvi == 0)
    {
        return(E_OUTOFMEMORY);
    }

    ZeroMemory(pvi, m_amt.cbFormat);
    pvi->AvgTimePerFrame = lFPS;

    // Copy the header info
    memcpy(&(pvi->bmiHeader), bmi, bmi->biSize);

    // Set image size for use in FillBuffer
	m_lBufferSize = GetBitmapSize(&pvi->bmiHeader);

    pvi->bmiHeader.biSizeImage  = m_lBufferSize;

    // Clear source and target rectangles
    SetRectEmpty(&(pvi->rcSource)); // we want the whole image area rendered
    SetRectEmpty(&(pvi->rcTarget)); // no particular destination rectangle

	// Use standard values for the types
    m_amt.SetType(&MEDIATYPE_Video);
    m_amt.SetFormatType(&FORMAT_VideoInfo);
    m_amt.SetTemporalCompression(FALSE);

    // Work out the GUID for the subtype from the header info.
    const GUID SubTypeGUID = GetBitmapSubtype(&pvi->bmiHeader);
    m_amt.SetSubtype(&SubTypeGUID);
    m_amt.SetSampleSize(pvi->bmiHeader.biSizeImage);

	return S_OK;
}

/**********************************************
 *
 *  CPushSourceBitmap Class
 *
 **********************************************/

CPushSourceBitmap::CPushSourceBitmap(IUnknown *pUnk, HRESULT *phr)
           : CSource(NAME("PushSourceBitmap"), pUnk, CLSID_GenericSampleSourceFilter)
{
    // The pin magically adds itself to our pin array.
    m_pPin = new CPushPinBitmap(phr, this);

    if (phr)
    {
        if (m_pPin == NULL)
        {
            *phr = E_OUTOFMEMORY;
        }
        else
        {
            *phr = S_OK;
        }
    }
}

CPushSourceBitmap::~CPushSourceBitmap()
{
    delete m_pPin;
}


CUnknown * WINAPI CPushSourceBitmap::CreateInstance(IUnknown *pUnk, HRESULT *phr)
{
    CPushSourceBitmap *pNewFilter = new CPushSourceBitmap(pUnk, phr );

    if (phr)
    {
        if (pNewFilter == NULL)
        {
            *phr = E_OUTOFMEMORY;
        }
        else
        {
            *phr = S_OK;
        }
    }

    return pNewFilter;
}
