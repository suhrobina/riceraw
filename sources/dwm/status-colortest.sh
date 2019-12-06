#!/usr/bin/env bash
text1(){  echo -ne "\x01 01 "; }
text2(){  echo -ne "\x02 02 "; }
text3(){  echo -ne "\x03 03 "; }
text4(){  echo -ne "\x04 04 "; }
text5(){  echo -ne "\x10 10 "; }
text6(){  echo -ne "\x11 11 "; }
text7(){  echo -ne "\x13 13 "; }
text8(){  echo -ne "\x14 14 "; }
text9(){  echo -ne "\x15 15 "; }
text10(){ echo -ne "\x16 16 "; }
text11(){ echo -ne "\x17 17 "; }
text12(){ echo -ne "\x1a 1A "; }
text13(){ echo -ne "\x1c 1C "; }
text14(){ echo -ne "\x1d 1D "; }
text15(){ echo -ne "\x1e 1E "; }


xsetroot -name "\
$(text1)\
$(text2)\
$(text3)\
$(text4)\
$(text5)\
$(text6)\
$(text7)\
$(text8)\
$(text9)\
$(text10)\
$(text11)\
$(text12)\
$(text13)\
$(text14)\
$(text15)"
