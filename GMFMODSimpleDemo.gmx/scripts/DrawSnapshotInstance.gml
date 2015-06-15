
//faster method using string
var wavel,waver,specl,specr,maxs,maxw;
maxs = 256;
maxw=256;
l1 = ds_list_create();
l2 = ds_list_create();
l3 = ds_list_create();
l4 = ds_list_create();
FMODInstanceGetWaveSnapshot2(argument0,0,maxw);
FMODNormalizeWaveData(0, maxw)
FMODSnapShotToDsList(0,maxw,l1)
//wavel = global.FMODbuf
FMODInstanceGetWaveSnapshot2(argument0,1,maxw);
FMODNormalizeWaveData(0, maxw)
FMODSnapShotToDsList(0,maxw,l2)
//waver = global.FMODbuf
FMODInstanceGetSpectrumSnapshot2(argument0,0,maxs*2);
FMODNormalizeSpectrumData(0, maxw)
FMODSnapShotToDsList(0,maxw,l3)
//specl = global.FMODbuf
FMODInstanceGetSpectrumSnapshot2(argument0,1,maxs*2);
FMODNormalizeSpectrumData(0, maxw)
FMODSnapShotToDsList(0,maxw,l4)

//specr = global.FMODbuf

var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
draw_set_color(c_red);
i = 0;
repeat(maxs-1)
{
    //draw_line(xx,yy-(ord(string_char_at(specl,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specl,i+1))/255)*h)
    draw_line(xx,yy-ds_list_find_value(l1,i) *h,xx+w/maxs,yy-ds_list_find_value(l1,i+1)*h)

    i+=1;
    xx+=w/maxs;
}
draw_set_color(c_blue);
i = 0;
xx=argument1;
repeat(maxs-1)
{
    //draw_line(xx,yy-(ord(string_char_at(specr,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specr,i+1))/255)*h)
    draw_line(xx,yy-ds_list_find_value(l2,i)*h,xx+w/maxs,yy-ds_list_find_value(l2,i+1)*h)

    i+=1;
    xx+=w/maxs;
}

draw_set_color(c_red);
i = 0;
xx=argument1;
repeat(maxw-1)
{
    //draw_line(xx,yy-(ord(string_char_at(wavel,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(wavel,i+1))/255)*h)
    draw_line(xx,yy-ds_list_find_value(l3,i)*h,xx+w/maxw,yy-ds_list_find_value(l3,i+1)*h)

    i+=1;
    xx+=w/maxw;
}
draw_set_color(c_blue);
i = 0;
xx=argument1;
repeat(maxw-1)
{
    //draw_line(xx,yy-(ord(string_char_at(waver,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(waver,i+1))/255)*h)
    draw_line(xx,yy-ds_list_find_value(l4,i)*h,xx+w/maxw,yy-ds_list_find_value(l4,i+1)*h)

    i+=1;
    xx+=w/maxw;
}
//draw_set_alpha(1);
//draw_set_blend_mode(bm_normal);
draw_set_color(c_white);

ds_list_destroy(l1);
ds_list_destroy(l2);
ds_list_destroy(l3);
ds_list_destroy(l4);