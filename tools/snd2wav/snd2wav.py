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
    args = sys.argv[1:]
    if len(args) == 1:
        sndfile = args[0]
        output_dir = os.getcwd()  # por defecto, en el directorio actual
    elif len(args) >= 2:
        sndfile = args[0]
        output_dir = args[1]
    else:
        print("Uso: snd2wav archivo.snd [directorio_de_salida]")
        sys.exit(1)

    # Crear el directorio de salida si no existe
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Sacar solo el nombre base del archivo .snd
    name = os.path.splitext(os.path.basename(sndfile))[0]

    # Leer el archivo
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

        # Generar solo el nombre del archivo
        wav_filename = "%s_%d_%d.wav" % (name, group, index)
        # Ruta completa en el directorio de salida
        wavPath = os.path.join(output_dir, wav_filename)
        
        with open(wavPath, "wb") as wavOut:
            wavOut.write(wavData)
        
        # Guardar solo el nombre en el diccionario para el .txt
        wavfiles[(group, index)] = wav_filename
    
    # Crear el archivo de texto
    txt_path = os.path.join(output_dir, "%s.txt" % (name,))
    with open(txt_path, "w") as fp:
        print>>fp, "%s.snd" % (name,)
        for group, index in sorted(wavfiles.keys()):
            print >> fp, wavfiles[(group, index)]
            print >> fp, group
            print >> fp, index

    print("Output directory:", os.path.abspath(output_dir))
    print("Archivo de salida:", os.path.abspath(txt_path))
    
#==============================================================================

if __name__ == "__main__":
    main()
    raw_input()