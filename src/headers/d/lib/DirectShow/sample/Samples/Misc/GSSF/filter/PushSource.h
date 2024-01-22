/****************************************************************************
This sample is released as public domain.  It is distributed in the hope that 
it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

#pragma once

// Filter name strings
#define g_wszPushBitmap     L"Generic Sample Source Filter"


/**********************************************
 *
 *  Interface Definitions
 *
 **********************************************/

DECLARE_INTERFACE_(IGenericSampleCB, IUnknown) {
	STDMETHOD(SampleCallback)(THIS_
		IMediaSample *pSample
		) PURE;
};

DECLARE_INTERFACE_(IGenericSampleConfig, IUnknown) {

    STDMETHOD(SetMediaTypeFromBitmap) (THIS_
                BITMAPINFOHEADER *bmi,
				LONGLONG lFPS
             ) PURE;

    STDMETHOD(SetMediaType) (THIS_
                AM_MEDIA_TYPE *amt
             ) PURE;

    STDMETHOD(SetMediaTypeEx) (THIS_
                AM_MEDIA_TYPE *amt,
				long lBufferSize
             ) PURE;

    STDMETHOD(SetBitmapCB) (THIS_
                IGenericSampleCB *pfn
             ) PURE;
};

/**********************************************
 *
 *  Class declarations
 *
 **********************************************/

class CPushPinBitmap : public CSourceStream,
    public IGenericSampleConfig
{
protected:

	CMediaType m_amt;
	long m_lBufferSize;
	IGenericSampleCB *m_Callback;

public:

    CPushPinBitmap(HRESULT *phr, CSource *pFilter);
    ~CPushPinBitmap();

    // Override the version that offers exactly one media type
    HRESULT GetMediaType(CMediaType *pMediaType);
    HRESULT DecideBufferSize(IMemAllocator *pAlloc, ALLOCATOR_PROPERTIES *pRequest);
    HRESULT FillBuffer(IMediaSample *pSample);
    
    // Quality control
	// Not implemented because we aren't going in real time.
	// If the file-writing filter slows the graph down, we just do nothing, which means
	// wait until we're unblocked. No frames are ever dropped.
    STDMETHODIMP Notify(IBaseFilter *pSelf, Quality q)
    {
        return E_FAIL;
    }

    // ----------------------------------------------------------------------
    // override this to reveal our property interface
    STDMETHODIMP NonDelegatingQueryInterface(REFIID riid, void ** ppv);
    DECLARE_IUNKNOWN;

    STDMETHODIMP SetMediaTypeFromBitmap(BITMAPINFOHEADER *bmi, LONGLONG lFPS);
	STDMETHODIMP SetMediaType(AM_MEDIA_TYPE *amt);
	STDMETHODIMP SetMediaTypeEx(AM_MEDIA_TYPE *amt, long lBufferSize);
    STDMETHODIMP SetBitmapCB(IGenericSampleCB *pfn);

private:
	HRESULT CreateMediaTypeFromBMI(BITMAPINFOHEADER *bmi, LONGLONG lFPS);
};


class CPushSourceBitmap : public CSource
{

private:
    // Constructor is private because you have to use CreateInstance
    CPushSourceBitmap(IUnknown *pUnk, HRESULT *phr);
    ~CPushSourceBitmap();

    CPushPinBitmap *m_pPin;

public:
    static CUnknown * WINAPI CreateInstance(IUnknown *pUnk, HRESULT *phr);  
};

