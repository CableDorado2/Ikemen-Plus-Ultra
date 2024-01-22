# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
# ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE.
#
# Copyright (c) Microsoft Corporation.  All Rights Reserved.
#
#
# Processor independent makefile

# Nmake macros for building makefile
!include <win32.mak>

PROJ = WCTEnum

all: $(OUTDIR) $(OUTDIR)\$(PROJ).exe 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"
    
#--------------------------------------------------------------------#
    
OBJS=$(OUTDIR)\WctEnum.obj

.cpp{$(OUTDIR)}.obj:
    $(cc) $(cdebug) $(cflags) $(cvarsmt) -DUNICODE -D_UNICODE /EHsc /Fp"$(OUTDIR)\\" /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" $**
    
$(OUTDIR)\$(PROJ).exe: $(OBJS)
	$(link) $(ldebug) $(guilibs) $(conflags) /MACHINE:$(CPU) -out:$(OUTDIR)\$(PROJ).exe $(OBJS) /PDB:$(OUTDIR)\$(PROJ).PDB psapi.lib

clean:
	$(CLEANUP)
