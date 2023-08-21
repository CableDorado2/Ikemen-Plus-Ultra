
#ifdef _WIN32
#include <stdio.h>
#else
#include <limits.h>
#include <sys/sendfile.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dirent.h>
#include <fnmatch.h>
#endif

#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"

#ifndef _WIN32

#define MOVEFILE_WRITE_THROUGH 0x00000008

static errno_t _wfopen_s(FILE **pFile, const WCHR *filename, const WCHR *mode)
{
	*pFile =
		fopen(PluginUtil::wToA(filename).c_str(), PluginUtil::wToA(mode).c_str());
	return *pFile ? 0 : EINVAL;
}
static int _fseeki64(FILE *stream, int64_t offset, int origin)
{
	if(offset < LONG_MIN || offset > LONG_MAX) return EINVAL;
	return fseek(stream, (long)offset, origin);
}
static BOOL DeleteFile(const WCHR *lpFileName)
{
	return remove(PluginUtil::wToA(lpFileName).c_str()) == 0;
}
static BOOL MoveFileEx(
	const WCHR *lpExistingFileName, const WCHR *lpNewFileName, DWORD)
{
	return
		rename(
			PluginUtil::wToA(lpExistingFileName).c_str(),
			PluginUtil::wToA(lpNewFileName).c_str()) == 0;
}
static BOOL CopyFile(
	const WCHR *lpExistingFileName, const WCHR *lpNewFileName,
	BOOL bFailIfExists)
{
	auto efile = open(PluginUtil::wToA(lpExistingFileName).c_str(), O_RDONLY);
	if(efile == -1) return false;
	auto nfn = PluginUtil::wToA(lpNewFileName);
	if(!bFailIfExists) remove(nfn.c_str());
	struct stat stat_buf;
	int nfile;
	if(
		fstat(efile, &stat_buf) || !access(nfn.c_str(), F_OK)
		|| (nfile = open(nfn.c_str(), O_WRONLY | O_CREAT, stat_buf.st_mode)) == -1)
	{
		close(efile);
		return false;
	}
	off_t offset = 0;
	auto ret = sendfile(nfile, efile, &offset, stat_buf.st_size) != -1;
	close(efile);
	close(nfile);
	return ret;
}
static BOOL CreateDirectory(const WCHR *lpPathName, void*)
{
	return mkdir(PluginUtil::wToA(lpPathName).c_str(), 0777) == 0;
}
static BOOL RemoveDirectory(const WCHR *lpFileName)
{
	return rmdir(PluginUtil::wToA(lpFileName).c_str()) == 0;
}
static BOOL SetCurrentDirectory(const WCHR *lpFileName)
{
	return chdir(PluginUtil::wToA(lpFileName).c_str()) == 0;
}
#endif

TUserFunc(intptr_t, Open, Reference md, Reference fn)
{
	FILE *pFile = NULL;
	_wfopen_s(&pFile, pu->refToWstr(fn).c_str(), pu->refToWstr(md).c_str());
	return (intptr_t)pFile;
}

TUserFunc(void, Close, FILE *pFile)
{
	if(pFile != NULL) fclose(pFile);
}

TUserFunc(bool, Read, intptr_t size, void *p, FILE *pFile)
{
	if(pFile == NULL) return false;
	return fread(p, size, 1, pFile) == 1;
}

TUserFunc(intptr_t, ReadAry, intptr_t size, Reference ary, FILE *pFile)
{
	if(pFile == NULL) return -1;
	if(ary.len() == 0) return 0;
	return fread(ary.atpos(), size, ary.len()/size, pFile);
}

TUserFunc(bool, Write, intptr_t size, void *p, FILE *pFile)
{
	if(pFile == NULL) return false;
	return fwrite(p, size, 1, pFile) == 1;
}

TUserFunc(intptr_t, WriteAry, intptr_t size, Reference ary, FILE *pFile)
{
	if(pFile == NULL) return -1;
	if(ary.len() == 0) return 0;
	return fwrite(ary.atpos(), size, ary.len()/size, pFile);
}

TUserFunc(bool, Seek, int32_t origin, int64_t offset, FILE *pFile)
{
	if(pFile == NULL) return false;
	return _fseeki64(pFile, offset, origin) != 0;
}

TUserFunc(void, LoadAsciiText, Reference *pr, Reference r)
{
	pu->setSSZFunc();
	std::string tmp;
	WCHR *pwc;
	FILE *pFile = NULL;
	if(_wfopen_s(&pFile, pu->refToWstr(r).c_str(), L("rb")) != 0) return;
	char ch;
	while(fread(&ch, sizeof(char), 1, pFile) == 1) tmp += ch;
	fclose(pFile);
	pr->releaseanddelete();
	if(tmp.size() == 0) return;
	pr->refnew(tmp.size(), sizeof(WCHR));
	pwc = (WCHR*)pr->atpos();
	for(intptr_t i = 0; i < (intptr_t)tmp.size(); i++){
		pwc[i] = (WCHR)(unsigned char)tmp[i];
	}
}

TUserFunc(bool, SaveAsciiText, Reference txt, Reference r)
{
	std::string tmp;
	WCHR *pwc;
	tmp.resize(txt.len() / sizeof(WCHR));
	if(tmp.size() == 0) return true;
	pwc = (WCHR*)txt.atpos();
	for(intptr_t i = 0; i < (intptr_t)tmp.size(); i++){
		tmp[i] = (unsigned char)pwc[i];
	}
	FILE *pFile = NULL;
	if(_wfopen_s(&pFile, pu->refToWstr(r).c_str(), L("wb")) != 0) return false;
	bool ret =
		fwrite(tmp.data(), sizeof(char), tmp.size(), pFile) == tmp.size();
	fclose(pFile);
	return ret;
}

TUserFunc(bool, Delete, Reference file)
{
	return DeleteFile(pu->refToWstr(file).c_str()) != 0;
}

TUserFunc(bool, Move, Reference newn, Reference oldn)
{
	return
		MoveFileEx(
			pu->refToWstr(oldn).c_str(), pu->refToWstr(newn).c_str(),
			MOVEFILE_WRITE_THROUGH) != 0;
}

TUserFunc(bool, Copy, bool overwrite, Reference dist, Reference source)
{
	return
		CopyFile(
			pu->refToWstr(source).c_str(), pu->refToWstr(dist).c_str(),
			!overwrite) != 0;
}

TUserFunc(void, Find, Reference *fls, Reference fn)
{
	pu->setSSZFunc();
#ifdef _WIN32
	HANDLE fh;
	WIN32_FIND_DATA fd;
	fh = FindFirstFile(pu->refToWstr(fn).c_str(), &fd);
	if(fh == INVALID_HANDLE_VALUE) return;
	do{
		if(fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;
		intptr_t j = fls->addsize(1, sizeof(Reference), refzeroclearcb);
		((Reference*)(fls->atpos()+j))->init();
		pu->wstrToRef(*(Reference*)(fls->atpos()+j), fd.cFileName);
	}while(FindNextFile(fh,&fd));
	FindClose(fh);
#else
	auto file = pu->wToA(pu->refToWstr(fn));
	auto i = file.find_last_of('/');
	std::string dstr;
	DIR *pDir;
	if(i != std::string::npos){
		dstr.append(file.data(), i + 1);
		file.erase(0, i + 1);
		pDir = opendir(dstr.c_str());
	}else{
		pDir = opendir(".");
	}
	if(pDir == nullptr) return;
	struct dirent *ent;
	while((ent = readdir(pDir)) != nullptr){
		if(
			(ent->d_type & DT_DIR)
			|| fnmatch(file.c_str(), ent->d_name, 0)) continue;
		intptr_t j = fls->addsize(1, sizeof(Reference), refzeroclearcb);
		((Reference*)(fls->atpos()+j))->init();
		pu->wstrToRef(*(Reference*)(fls->atpos()+j), pu->aToW(ent->d_name));
	}
	closedir(pDir);
#endif
}

TUserFunc(void, FindDir, Reference *fls, Reference fn)
{
	pu->setSSZFunc();
#ifdef _WIN32
	HANDLE fh;
	WIN32_FIND_DATA fd;
	fh = FindFirstFile(pu->refToWstr(fn).c_str(), &fd);
	if(fh == INVALID_HANDLE_VALUE) return;
	do{
		if((fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) == 0) continue;
		if(fd.cFileName[0] == L'.'){
			if(fd.cFileName[1] == L'\0') continue;
			if(fd.cFileName[1] == L'.' && fd.cFileName[2] == L'\0') continue;
		}
		intptr_t j = fls->addsize(1, sizeof(Reference), refzeroclearcb);
		((Reference*)(fls->atpos()+j))->init();
		pu->wstrToRef(*(Reference*)(fls->atpos()+j), fd.cFileName);
	}while(FindNextFile(fh,&fd));
	FindClose(fh);
#else
	auto file = pu->wToA(pu->refToWstr(fn));
	auto i = file.find_last_of('/');
	std::string dstr;
	DIR *pDir;
	if(i != std::string::npos){
		dstr.append(file.data(), i + 1);
		file.erase(0, i + 1);
		pDir = opendir(dstr.c_str());
	}else{
		pDir = opendir(".");
	}
	if(pDir == nullptr) return;
	struct dirent *ent;
	while((ent = readdir(pDir)) != nullptr){
		if(
			!(ent->d_type & DT_DIR)
			|| fnmatch(file.c_str(), ent->d_name, 0)) continue;
		if(ent->d_name[0] == '.'){
			if(ent->d_name[1] == '\0') continue;
			if(ent->d_name[1] == '.' && ent->d_name[2] == '\0') continue;
		}
		intptr_t j = fls->addsize(1, sizeof(Reference), refzeroclearcb);
		((Reference*)(fls->atpos()+j))->init();
		pu->wstrToRef(*(Reference*)(fls->atpos()+j), pu->aToW(ent->d_name));
	}
	closedir(pDir);
#endif
}

TUserFunc(bool, CreateDir, Reference dir)
{
	return CreateDirectory(pu->refToWstr(dir).c_str(), nullptr) != 0;
}

TUserFunc(bool, RemoveDir, Reference dir)
{
	return RemoveDirectory(pu->refToWstr(dir).c_str()) != 0;
}

TUserFunc(bool, SetCurrentDir, Reference dir)
{
	return SetCurrentDirectory(pu->refToWstr(dir).c_str()) != 0;
}

TUserFunc(void, GetCurrentDir, Reference* dir)
{
	pu->setSSZFunc();
	dir->releaseanddelete();
#ifdef _WIN32
	dir->refnew(GetCurrentDirectory(0, nullptr), sizeof(wchar_t));
	if(
		dir->len() <= 0
		|| GetCurrentDirectory(
			dir->len()/sizeof(wchar_t), (wchar_t*)dir->atpos()) == 0)
	{
		return;
	}
#else
	char *str = getcwd(nullptr, 0);
	pu->wstrToRef(*dir, pu->aToW(str));
	free(str);
#endif
}
