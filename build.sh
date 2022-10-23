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
dd if=chr/status-spesmilo.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57ED0))
dd if=chr/status-world.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57710))
dd if=chr/title-d.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E0B0))
dd if=chr/title-u.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E0E0))
dd if=chr/title-t.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1B0))
dd if=chr/title-n.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1C0))
dd if=chr/title-o.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1D0))
dd if=chr/title-j.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1E0))

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
