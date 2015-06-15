//DrawFreq(x,y,w,h,frequency)

if(argument4 = 0) exit;
var a;
a = 0;
var xx,yy,xx2,yy2,yo,xinc,s,ainc;
xx2 = argument0;
yo = argument1+argument3/2; 
yy2 = 0
xinc = 1;
s = argument3/2;
ainc = degtorad((360/(argument2/xinc ))*((argument4/44100)*20));//argument4/44100/
draw_rectangle(argument0,argument1,argument0+argument2,argument1+argument3,true)
//draw_line(xx2,yo,xx2+argument2,yo)

repeat (argument2/xinc )
{
    
    a+=ainc;
    xx = xx2;
    yy = yy2;
    xx2 = xx+xinc;
    yy2 = sin(a) * s
    draw_line(xx,yo+yy,xx2,yo+yy2)
}