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

Compatibility
=============
This program is compatible with commodore 64, commodore 128, and
commander x16. It may be compatible with other BASIC dialects,
especially those written by Microsoft, but I have only fully tested on
these. I designed the program to be easily portable to other
platforms, and as I port it to others, I will make these
modifications.

Usage 
=====
This program is essentially identical to the original WOZMON, with two
important exceptions. We cannot read the ":" character as string input
on the C64 as it uses it as a field separator. So this is replaced
with "=". Also, because this program is not really the whole operating
system of your C64, I added "Q" as a quit command.  If you already
know how to use wozmon, these are the only changes you will see.

Here's an outline of the monitor operations:
1. Examine a byte: < Address >
    ? C000
     
    C000: FF

2. Block Examine: < Start Address >.< End Address >
    ? C000.C00F
     
    C000: FF 00 00 FF FF 2A AC AB
    C008: 00 00 00 FF FF FF FF FF

3. Deposit Bytes: < Start Address > = < Byte 1 > < Byte 2 > ...
    ? C000=60 01 02

    C000: FF
    ? C000.C007

    C000: 60 01 02 FF FF 2A AC AB

   Note that when you do the deposit, it will display the byte that
   was originally at that address. This is because the monitor
   interprets the examine command first, followed by the deposit.
   Assignment can be continued by beginning subsequent lines with "="

4. Run: < Address > R
    ? C000 R

    ? 

   Here, I ran the program which consists of a single RTS instruction
   input in example 3. (Ok, so it's an RTS followed by a couple of
   random bytes.)

5. Quit: Q
    ? Q

And that's it! This gives you total control of memory for your
exploration and machine coding needs. Note that all numbers are in
hex, and you can also use "R" by itself to run the most recently
examined address.

Enjoy!

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
