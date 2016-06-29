//int t0;
//int t;
float x0=0, y0, z0;
float x, y=-75, z;
float vx, vy, vz;
float vx0=0 , vy0, vz0=0;
float ax, ay, az;
float ax1,ay1,az1;
float a1;
float dAngle,dAngle0,ddAngle, ddAngle1; //<>//
float Angle;
float Angle0,camAngle0;
int a;
float k = 0.5;
int n,m;
float dT,T;
float camT,camt0,camt1,U;
//PShape plane;


void setup() {
  size(1100, 700, P3D);
 fill(200); //<>//
  stroke(0);
  //plane = loadShape("B-747.obj");
  float fov = radians(45);  //視野角
  perspective(fov, float(width)/float(height), 1.0, 10000.0);
}

void draw() {
    checkChanges();
    n = 1;
  m = m + n;
  
  dT = float(n)*40/1000;
  T = T + dT;

  /*if (keysChangeFlag['w'] == true || keysChangeFlag['s'] == true || keysChangeFlag['a'] == true  || keysChangeFlag['d'] == true ||
    RkeysChangeFlag['w'] == true || RkeysChangeFlag['s'] == true || RkeysChangeFlag['a'] == true  || RkeysChangeFlag['d'] == true||keysChangeFlag['r'] == true)
  {
    x0 = x;
    z0 = z;
    vx0 = vx;
    vz0 = vz;
    Angle0 = Angle;
    t0 = millis();
    
  }*/
  if (keysChangeFlag['a'] == true  || keysChangeFlag['d'] == true 
    )
  {
    camt0 = T;
    camAngle0 = Angle;
  }
  // 以下zについて
  if (keysChangeFlag['w'] == true)
  {
    //az = az - 50;
    a1 = a1 - 1000;
  }
  if (RkeysChangeFlag['s'] == true)
  {
    //az = az - 50;
    a1 = a1-1000;
  }
  if (keysChangeFlag['s'] == true)
  {
    //az = az + 50;
    a1 = a1 + 1000;
  }
  if (RkeysChangeFlag['w'] == true)
  {
    //az = az + 50;
    a1 = a1 + 1000;
  }
  //以下xについて
  if (keysChangeFlag['a'] == true)
  {
    ddAngle1 = ddAngle1 + 20;
    //vx0 = vx0 - 100;
  }
  if (RkeysChangeFlag['d'] == true)
  {
    ddAngle1 = ddAngle1 + 20;
  }

  if (keysChangeFlag['d'] == true)
  {
    ddAngle1 = ddAngle1 - 20;
  }
  if (RkeysChangeFlag['a'] == true)
  {
    ddAngle1 = ddAngle1 - 20;
    //vx0 = vx0 + 100;
  }
  if (keysChangeFlag['r'] == true)
  {
    vx0 = vz0 = 0;
  }
  

  //t = millis();
  //float T = float((t - t0))/1000;
 
  n = 1;
  m = m + n;
  
  dT = float(n)*40/1000;
  T = T + dT;
  ax1 = a1 * sin(radians(Angle));
  az1 = a1 * cos(radians(Angle));
  
  ax = ax1 - vx * k;
  az = az1 - vz * k;
  
  vx = vx0 + ax * dT;
  vz = vz0 + az * dT;
  x =  x0 + vx * dT;
  z =  z0 + vz * dT;
  
  
  ddAngle = ddAngle1 - dAngle * 1;
  dAngle = dAngle0 + ddAngle * dT;
  Angle = Angle0 + dAngle * dT;
  
  
  float camAngle;
  camT = T - camt0;
  /*if(camT <=4){
   camAngle = camAngle0;
  }else{
    camAngle =  Angle0 + dAngle * (dT - 4);
  }*/
  camAngle =  Angle0 + dAngle * (dT - 0.5);
  x0 = x;
  z0 = z;
  vx0 = vx;
  vz0 = vz;
  dAngle0 = dAngle;
  Angle0 = Angle;
  println("(vx0,vy0,vz0)="+"("+vx0+","+vy0 +","+vz0+")");
  //println("(x0,y0,z0)="+"("+x0+","+y0 +","+z0+")");
  println("(x,y,z)="+"("+x+","+y +","+z+")");
  println("(vx,vy,vz)="+"("+vx+","+vy +","+vz+")");
  println("(ax,ay,az)="+"("+ax+","+ay +","+az+")");
  println("T" +T);
  //println("t0="+t0);
  //println("t="+t);
  println("Angle" + int(Angle));
  background(255); 
  camera(800 * sin(radians(camAngle)) + x, -200 + y ,800 * cos(radians(camAngle)) + z, // 視点X, 視点Y, 視点Z
         x, y, z, // 中心点X, 中心点Y, 中心点Z
         0.0, 1.0, 0.0); // 天地X, 天地Y, 天地Z
 
  
  pushMatrix(); 
  translate(x,y,z);
  rotateX(radians(180));
  rotateY(-radians(Angle));
  //scale(10);
  //shape(plane);
  box(150);
  popMatrix();
  
  pushMatrix();
  translate(0,0,1000);
  box(300);
  popMatrix();
   final int step = 300;  
  for(int i = -width*1; i < width*1; i += step) {  
    beginShape(QUAD_STRIP);  
    for(int j = -width*80; j <= width*1; j += step) {  
      vertex(i, 0, j);  
      vertex(i + step, 0, j);  
    }  
    endShape();  
  }
}