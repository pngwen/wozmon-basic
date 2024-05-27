Introduction
============
This is my port of Steve Wozniak's Apple I monitor program, often
referred to as "wozmon", to BASIC. I wanted to have a short type-in
monitor that I could put on isolated commodore 64 machines, and still
follow the elegance of Woz's original design.

I ported this by reading the commented source code and analysis found
at https://www.sbprojects.net/projects/apple1/wozmon.php. I tried to
mimic the logic of this in C64 BASIC while retaining portability to
other BASIC dialects. This meant I used no machine code subroutines,
and apart from the monitor interactions, I did not use any direct
memory accesses. For example, rather than port the keyboard routines
directly, I used basic's INPUT command. This also greatly shortened
the length of the resultant code.

Compatability
=============
This program is compatable with commodore 64, commodore 128, and
commander x16. It may be compatible with other BASIC dialects,
especially those written by Microsoft, but I have only fully tested on
these. I designed the program to be easily portable to other
platforms, and as I port it to others, I will make these
modifications.

Files
=====
* readme.md - This Readme file
* license.txt - The MIT License
* wozmon.asm - The original source code I read as I was porting.
* woz-notes.txt - My notes that I wrote to myself as I was porting.
* wozmon-c64.bas - The petcat output text of the C64 wozmon BASIC program.
* WOZMON - The PRG file from disk image. Also works on commander x16!
* wozmon.d64 - My working disk image. Includes intermediate experiments.

License
=======
Everything except for wozmon.asm is distributed under the MIT license.
(See LICENSE.TXT file.) The wozmon.asm code is not mine, it is the code
from the original Apple I computer, and I am not sure of its license.
It is all over the web though, so I am guessing it should be counted
as either public domain or well and truly stolen.
