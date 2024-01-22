!if "$(CPU)" == "i386"

# Makefile - bpsamp.Exe
#
# Copyright 1999 Microsoft Corporation.
#
#
!Include <Win32.Mak>

all: $(OUTDIR) $(OUTDIR)\bpsamp.exe $(OUTDIR)\bpsamptest.exe

#----- If OUTDIR does not exist, then create directory
$(OUTDIR) :
    if not exist "$(OUTDIR)/$(NULL)" mkdir $(OUTDIR)

$(OUTDIR)\main.Obj: main.c
    $(cc) $(cflags) $(cvars) /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" main.c

$(OUTDIR)\utils.Obj: utils.c
    $(cc) $(cflags) $(cvars) /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" utils.c

$(OUTDIR)\dbgcmd.Obj: dbgcmd.c
    $(cc) $(cflags) $(cvars) /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" dbgcmd.c

$(OUTDIR)\bpsamptest.Obj: bpsamptest.c
    $(cc) $(cflags) $(cvars) /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\" bpsamptest.c


$(OUTDIR)\bpsamp.exe: $(OUTDIR)\main.obj $(OUTDIR)\utils.obj $(OUTDIR)\dbgcmd.obj
    $(link) $(conflags) -out:$(OUTDIR)\bpsamp.Exe $(OUTDIR)\main.obj $(OUTDIR)\utils.obj $(OUTDIR)\dbgcmd.obj $(conlibs)

$(OUTDIR)\bpsamptest.exe: $(OUTDIR)\bpsamptest.obj 
    $(link) $(conflags) -out:$(OUTDIR)\bpsamptest.Exe $(OUTDIR)\bpsamptest.obj $(conlibs) user32.lib

clean:
        $(CLEANUP)
!else
!message Sorry this sample is currently not supported for 64bit
!endif
