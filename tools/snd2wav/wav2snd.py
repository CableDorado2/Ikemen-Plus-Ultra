#encoding:shift-jis
from __future__ import division, with_statement

import sys
import os
import struct
import fileinput
from itertools import *
import glob

SubHeaderFormat = "I I I I"
SubHeaderSize = struct.calcsize(SubHeaderFormat)

HeaderFormat = "12s I I I 488s"
HeaderSize = struct.calcsize(HeaderFormat)
assert HeaderSize == 512

#==============================================================================

def main():
    filenames = [os.path.abspath(f) for a in sys.argv[1:] for f in glob.glob(a)]
    
    for filename in filenames:
        os.chdir(os.path.dirname(filename))
        lines = [line.strip() for line in open(filename)]
        sndname = os.path.abspath(lines[0])
        
        wavfiles = {}
        for wav, group, index in izip(lines[1::3], lines[2::3], lines[3::3]):
            wavfiles[int(group), int(index)] = os.path.abspath(wav)
        
        fp = open(sndname, "wb")
        #ヘッダ
        fp.write(struct.pack(HeaderFormat, "ElecbyteSnd", 4, len(wavfiles), 512, ""))
        for (group, index), wav in sorted(wavfiles.iteritems()):
            data = open(wav, "rb").read()
            
            s = struct.pack(SubHeaderFormat, fp.tell() + len(data) + SubHeaderSize, 
                    len(data), group, index)
            
            fp.write(s)
            fp.write(data)
        fp.close()
        print "出力=%s"%(fp.name,)
    
#==============================================================================

if __name__ == "__main__":
    main()
    raw_input("")
    