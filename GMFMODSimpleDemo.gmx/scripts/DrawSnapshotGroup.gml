
//DrawSnapshot(instance,x,y,w,h)
//See original string based method below

//New more dynamic/balanced method using Snapshot2, with normalize and get buffer
var wavel,waver,specl,specr,maxs,maxw;
maxs = 64;
maxw=64;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
FMODGroupGetSpectrumSnapshot(argument0,0,maxs*2);
FMODNormalizeSpectrumData(0,maxs);
FMODGetSpectrumBuffer(0,maxs);
specl = global.FMODbuf
draw_set_color(c_red);
i = 0;
repeat(maxs-1)
{
    draw_line(xx,yy-(ord(string_char_at(specl,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specl,i+1))/255)*h)
    i+=1;
    xx+=w/maxs;
}


FMODGroupGetSpectrumSnapshot(argument0,1,maxs*2);
FMODNormalizeSpectrumData(0,maxs);
FMODGetSpectrumBuffer(0,maxs);
specr = global.FMODbuf
draw_set_color(c_blue);
i = 0;
xx=argument1;
repeat(maxs-1)
{
    draw_line(xx,yy-(ord(string_char_at(specr,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specr,i+1))/255)*h)
    i+=1;
    xx+=w/maxs;
}


FMODGroupGetWaveSnapshot(argument0,0,maxw);
FMODNormalizeWaveData(0,maxw);
FMODGetWaveBuffer(0,maxw);
wavel = global.FMODbuf
draw_set_color(c_red);
i = 0;
xx=argument1;
repeat(maxw-1)
{
    draw_line(xx,yy-(ord(string_char_at(wavel,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(wavel,i+1))/255)*h)
    i+=1;
    xx+=w/maxw;
}


FMODGroupGetWaveSnapshot(argument0,1,maxw);
FMODNormalizeWaveData(0,maxw);
FMODGetWaveBuffer(0,maxw);
waver = global.FMODbuf
draw_set_color(c_blue);
i = 0;
xx=argument1;
repeat(maxw-1)
{
    draw_line(xx,yy-(ord(string_char_at(waver,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(waver,i+1))/255)*h)
    i+=1;
    xx+=w/maxw;
}
//draw_set_alpha(1);
//draw_set_blend_mode(bm_normal);
draw_set_color(c_black);