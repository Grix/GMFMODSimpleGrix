/*
**  Usage:
**      boxstep(a,b,t)
**
**  Arguments:
**      a       lower bound, real
**      b       upper bound, real
**      t       value, real
**
**  Returns:
**      0 when (t <= a),
**      1 when (t >= b),
**      a linear transition from 0 to 1 when (a < t < b),
**      or (-1) on error (a == b)
**
**  GMLscripts.com
*/
{
    var p;
    if (argument0 == argument1) return (-1);
    p = (argument2 - argument0) / (argument1 - argument0);
    if (p <= 0) return 0;
    if (p >= 1) return 1;
    return p;
}