#! /bin/sh

set -e

ORIG='Super Mario Bros. 3 (USA) (Rev 1).nes'
ROM="supermariobros3-eo.nes"
IPS="supermariobros3-eo.ips"
FLIPS="wine /opt/floating/flips.exe"

echo "Assembling ROM..."
cd smb3
wine nesasm.exe smb3.asm
cp smb3.nes ../$ROM
cd ..

echo "Updating CHR..."
#...

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
