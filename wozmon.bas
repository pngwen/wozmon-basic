   10 rem wozmon - ported by pngwen
   20 print:input in$:in$=in$+chr$(13)
   30 y=0
   40 a=0
   50 x=0
   60 mo=a
   70 y=y+1
   80 a=asc(mid$(in$,y,1))
   90 if a=13 then goto 20
   91 if a<46 then goto 70
   95 if a=81 then end
  100 if a=46 or a=61 then goto 60
  110 if a=82 then goto 320
  120 h=0
  130 ys=y
  140 a=asc(mid$(in$,y,1))
  150 a=(a and -49) or (not(a) and 48)
  160 if a<10 then goto 200
  170 a=a+137
  180 c=(a+6) and 256:a=a and 255
  190 if c=0 then goto 280
  200 a=a*16 and 255
  210 for i=1 to 4
  220 a=a*2
  230 c=(a and 256)/256:a=a and 255
  240 h=(h*2+c):if h>32767 then h=h-65536
  245 h=h and -1
  250 next i
  260 y=y+1
  270 goto 140
  280 if y=ys then goto 20
  290 if mo<>61 then goto 330
  300 poke sd,h:sd=sd+1
  310 goto 80
  320 ra=xa:if ra<0 then ra=ra+65536
  321 print:sys ra:goto 20
  330 if mo=46 then goto 420
  340 sd=h:xa=h:a=0:if sd<0 then sd=sd+65536
  350 if a<>0 then goto 400
  360 print
  370 a=xa/256:gosub 1000
  380 a=xa:gosub 1000
  390 print ":";
  400 print " ";
  405 x2=xa:if x2<0 then x2=x2+65536
  410 a=peek(x2):gosub 1000
  420 if xa>=h then mo=0:goto 80
  430 xa=xa+1
  440 a=xa and 7
  450 goto 350
 1000 rem prbyte
 1010 sa=a
 1020 a=a/16
 1030 gosub 1200
 1040 a=sa
 1200 rem prhex
 1210 a=a and 15
 1220 if a>9 then a=a+7
 1230 a=a+48
 1240 print chr$(a);
 1250 return
