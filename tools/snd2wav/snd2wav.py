#encoding:shift-jis
from __future__ import division, with_statement

import sys
import os
import struct
import glob
from cStringIO import StringIO

#==============================================================================

SubHeaderFormat = "I I I I"
SubHeaderSize = struct.calcsize(SubHeaderFormat)

HeaderFormat = "12s I I I 488s"
HeaderSize = struct.calcsize(HeaderFormat)
assert HeaderSize == 512

#==============================================================================

def main():
    if len(sys.argv[1:]) == 1:
        sndfile = sys.argv[1]
        name = os.path.splitext(os.path.basename(sndfile))[0]
    else:
        sndfile, name = sys.argv[1:]
        
    os.chdir(os.path.dirname(sndfile))
    
    if not os.path.isdir(name):
        os.mkdir(name)
    
    filedata = open(sndfile, "rb").read()
    filesize = len(filedata)
    f = StringIO(filedata)
    _, _, _, next, comment = struct.unpack(HeaderFormat, f.read(HeaderSize))
    
    print "-"*80
    print comment.rstrip()
    print "-"*80
    
    wavfiles = {}
    while 0 < next < filesize:
        f.seek(next)
        
        data = f.read(SubHeaderSize)
        if len(data) < SubHeaderSize:
            break
        
        next, wavSize, group, index = struct.unpack(SubHeaderFormat, data)
        
        wavData = f.read(wavSize)
        wavPath = "%s/%s_%d_%d.wav"%(name, name, group, index)
        
        
        with open(wavPath, "wb") as wavOut:
            wavOut.write(wavData)
            wavOut.close()
        print group, index
        
        wavfiles[group, index] = wavPath
    
    with open("%s.txt"%(name,), "w") as fp:
        print>>fp, "%s.snd"%(name,)
        for group, index in sorted(wavfiles.iterkeys()):
            print >> fp, wavfiles[group, index]
            print >> fp, group
            print >> fp, index
    print "出力=%s"%(os.path.abspath(fp.name))
    
#==============================================================================

if __name__ == "__main__":
    main()
    raw_input()
