// argBalls must be going towards one another.
//code from simplified version. 
//Original author:
//   Thomas Smid, January  2004
//                December 2005 (corrected faulty collision detection; 
//                               a few minor changes to improve speed;
//                               added simplified code without collision detection)
// http://www.plasmaphysics.org.uk/programs/coll2d_cpp.htm

// This code exchanges the speed between 2 balls according to h and h speeds and mass
// Don't ask me how, it's all latin to me... Good latin...

//Get the 2 balls in arguments
var argBall1;
var argBall2;

argBall1 = argument0;
argBall2 = argument1;

//Mass
var m1;
var m2;

m1 = argBall1.m_Mass; // Need a Mass variable in object
m2 = argBall2.m_Mass; // Need a Mass variable in object

//Coords
var x1;
var y1;

x1 = argBall1.x;
y1 = argBall1.y;

var x2;
var y2;

x2 = argBall2.x;
y2 = argBall2.y;

//speed
var vx1;
var vy1;

vx1 = argBall1.hspeed;
vy1 = argBall1.vspeed;

var vx2;
var vy2;

vx2 = argBall2.hspeed;
vy2 = argBall2.vspeed;


var m21;
var dvx2;
var a;
var x21;
var y21;
var vx21;
var vy21;
var fy21;
var dsign;

m21=m2/m1;
x21=x2-x1;
y21=y2-y1;
vx21=vx2-vx1;
vy21=vy2-vy1;

//     I have inserted the following statements to avoid a zero divide; 
//         (for single precision calculations, 
//          1.0E-12 should be replaced by a larger value). **************  
//  
//       fy21=(1 * (10 ^(-12))) *abs(y21);                            
//       if ( abs(x21)<fy21 ) {  
//                   if (x21<0) { dsign=-1; } else { dsign=1;}  
//                   x21=fy21*dsign; 
//        } 

//     update velocities
//This is close to above... to prevent divide by 0.
//if (x21 = 0) x21 = .000000001;


a=(y21-.000000001)/(x21-.000000001);
dvx2= -2*(vx21 +a*vy21)/((1+a*a)*(1+m21)) ;
vx2=vx2+dvx2;
vy2=vy2+a*dvx2;
vx1=vx1-m21*dvx2;
vy1=vy1-a*m21*dvx2;

//Set balls to new values
argBall1.hspeed= vx1;
argBall1.vspeed= vy1;
argBall2.hspeed= vx2;
argBall2.vspeed= vy2;