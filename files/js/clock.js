// JavaScript Document


var clocksize;
if(!clocksize||clocksize=='SIZE')clocksize='100';

document.write('<OBJECT  align="center" class="pad"  CLASSID="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" CODEBASE="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="'+clocksize+'" HEIGHT="'+clocksize+'">');

document.write('<PARAM NAME="movie" VALUE="files/flash/clock.swf">');
document.write('<PARAM NAME="quality" VALUE="high">');
//document.write('<PARAM NAME="bgcolor" VALUE="#FFFFFF">');
document.write('<PARAM NAME="wmode" VALUE="transparent">');
document.write('<PARAM NAME="menu" VALUE="false">');

document.write('<EMBED SRC="files/flash/clock.swf" WIDTH="'+clocksize+'" HEIGHT="'+clocksize+'" QUALITY="high" WMODE="transparent" MENU="false"></EMBED>');

document.write('</OBJECT>');