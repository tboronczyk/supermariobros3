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
dd if=chr/alpha.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57B10))
dd if=chr/alpha-jx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57820))
dd if=chr/alpha-sx.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57890))
dd if=chr/alpha-z.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57900))
dd if=chr/alpha-apos.bin of="$ROM" conv=notrunc bs=1 seek=$((0x578D0))
dd if=chr/pause-ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x4CB90))
dd if=chr/pause-it.bin of="$ROM" conv=notrunc bs=1 seek=$((0x4CBD0))
dd if=chr/title-d.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E0B0))
dd if=chr/title-u.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E0E0))
dd if=chr/title-t.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1B0))
dd if=chr/title-n.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1C0))
dd if=chr/title-o.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1D0))
dd if=chr/title-j.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5E1E0))
dd if=chr/info-b.bin of="$ROM" conv=notrunc bs=1 seek=$((0x45D90))
dd if=chr/info-f.bin of="$ROM" conv=notrunc bs=1 seek=$((0x45EB0))
dd if=chr/info-ux.bin of="$ROM" conv=notrunc bs=1 seek=$((0x45EE0))
dd if=chr/clear-alpha-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57810))
dd if=chr/clear-alpha-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57830))
dd if=chr/clear-alpha-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x578A0))
dd if=chr/clear-alpha-4.bin of="$ROM" conv=notrunc bs=1 seek=$((0x578E0))
dd if=chr/clear-alpha-5.bin of="$ROM" conv=notrunc bs=1 seek=$((0x579C0))
dd if=chr/clear-alpha-6.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57AC0))
dd if=chr/end-accent.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5DFE0))
dd if=chr/end-hyphen.bin of="$ROM" conv=notrunc bs=1 seek=$((0x5DFF0))

dd if=chr/start.bin of="$ROM" conv=notrunc bs=1 seek=$((0x45D10))
dd if=chr/help.bin of="$ROM" conv=notrunc bs=1 seek=$((0x48290))
dd if=chr/status-spesmilo.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57ED0))
dd if=chr/status-world.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57710))

dd if=chr/1up-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41220))
dd if=chr/1up-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41300))
dd if=chr/clear-1up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x4CAB0))
dd if=chr/timeup.bin of="$ROM" conv=notrunc bs=1 seek=$((0x4C9D0))

dd if=chr/minigame-5up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41650))
dd if=chr/minigame-23up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41710))
dd if=chr/minigame-1up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41F30))
dd if=chr/pow-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41890))
dd if=chr/pow-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41990))
dd if=chr/pow-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x41B90))
dd if=chr/nspade-1up.bin of="$ROM" conv=notrunc bs=1 seek=$((0x57790))

dd if=chr/theend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x46F10))

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
