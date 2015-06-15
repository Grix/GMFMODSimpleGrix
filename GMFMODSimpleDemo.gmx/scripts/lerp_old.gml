/*
**  Usage:
**      out = lerp(t,a,b);
**
**  Arguments:
**      t       fraction (0-1), real
**      a       lower value, real
**      b       upper value, real
**
**  Returns:
**      (a) if (t) is zero, (b) if (t) is one,
**      for other values of (t) returns linear interpolation of
**      (a) to (b) controlled by (t)
**
**  GMLscripts.com
*/
{
    return (argument1+argument0*(argument2-argument1));
}