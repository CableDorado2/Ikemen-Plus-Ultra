//*********************************************************************
//*                  Microsoft Windows                               **
//*        Copyright (c) Microsoft Corporation. All rights reserved. **
//*********************************************************************
#pragma once

#ifndef _RATINGS_H_
#define _RATINGS_H_

#include <winerror.h>
#include <shlwapi.h>

STDAPI RatingEnable(HWND hwndParent, LPCSTR pszUsername, BOOL fEnable);
STDAPI RatingEnableW(HWND hwndParent, LPCWSTR pszUsername, BOOL fEnable);
STDAPI RatingCheckUserAccess(__in_opt LPCSTR pszUsername, __in_opt LPCSTR pszURL, __in_opt LPCSTR pszRatingInfo,
    __in_bcount_opt(cbData) LPBYTE pData, DWORD cbData, __out_opt void **ppRatingDetails);
STDAPI RatingCheckUserAccessW(__in_opt LPCWSTR pszUsername, __in_opt LPCWSTR pszURL, __in_opt LPCWSTR pszRatingInfo,
    __in_bcount_opt(cbData) LPBYTE pData, DWORD cbData, __out_opt void **ppRatingDetails);
STDAPI RatingAccessDeniedDialog(HWND hDlg, __in_opt LPCSTR pszUsername, LPCSTR pszContentDescription, __out void *pRatingDetails);
STDAPI RatingAccessDeniedDialogW(HWND hDlg, __in_opt LPCWSTR pszUsername, LPCWSTR pszContentDescription, __out void *pRatingDetails);
STDAPI RatingAccessDeniedDialog2(HWND hDlg, __in_opt LPCSTR pszUsername, __out void *pRatingDetails);
STDAPI RatingAccessDeniedDialog2W(HWND hDlg, __in_opt LPCWSTR pszUsername, __out void *pRatingDetails);
STDAPI RatingFreeDetails(__in_opt void *pRatingDetails);
STDAPI RatingObtainCancel(HANDLE hRatingObtainQuery);
STDAPI RatingObtainQuery(LPCSTR pszTargetUrl, DWORD dwUserData,
    void (*fCallback)(DWORD dwUserData, HRESULT hr, LPCSTR pszRating, void *lpvRatingDetails),
    __out_opt HANDLE *phRatingObtainQuery);
STDAPI RatingObtainQueryW(LPCWSTR pszTargetUrl, DWORD dwUserData,
    void (*fCallback)(DWORD dwUserData, HRESULT hr, LPCWSTR pszRating, void *lpvRatingDetails),
    __out_opt HANDLE *phRatingObtainQuery);
STDAPI RatingSetupUI(HWND hDlg, LPCSTR pszUsername);
STDAPI RatingSetupUIW(HWND hDlg, LPCWSTR pszUsername);
#ifdef _INC_COMMCTRL
STDAPI RatingAddPropertyPage(PROPSHEETHEADER *ppsh);
#endif

STDAPI RatingAddToApprovedSites(HWND hDlg,
                                DWORD cbPasswordBlob,
                                __inout_bcount(cbPasswordBlob) BYTE *pbPasswordBlob,
                                __in LPCWSTR lpszUrl,
                                BOOL fAlwaysNever,
                                BOOL fSitePage,
                                BOOL fApprovedSitesEnforced);

STDAPI RatingClickedOnPRFInternal(HWND hWndOwner, HINSTANCE /*p_hInstance*/, __in LPSTR lpszFileName, int nShow);
STDAPI RatingClickedOnRATInternal(HWND hWndOwner, HINSTANCE /*p_hInstance*/, __in LPSTR lpszFileName, int nShow);

STDAPI RatingEnabledQuery();
STDAPI RatingInit();
STDAPI_(void) RatingTerm();

// A way to check if ratings are installed. We still need to calling
// ratings dll to find out for sure but this allows us to delay load ratings.
__inline BOOL IS_RATINGS_ENABLED()
{
    TCHAR szSup[200];
    DWORD dwType;
    DWORD cbSize = sizeof(szSup);

    return (SHGetValue(HKEY_LOCAL_MACHINE,
                       TEXT("Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Ratings"),
                       TEXT("Key"),
                       &dwType, szSup, &cbSize) == ERROR_SUCCESS);
}

#endif
// _RATINGS_H_


