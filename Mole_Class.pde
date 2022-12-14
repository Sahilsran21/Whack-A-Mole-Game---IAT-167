class Mole
{
//fields
//For random starting points
float x = random(-620, 570); 
float y = random(-340, 120); //120

//For controlling speed (velocity) horizontally/vertically
float xSpeed;
float ySpeed;

int deathTimer = -1;
float moleDyingYSpeed = 0.25;

float xBloodSpeed = random(-5,5);
float yBloodSpeed = random(-5,0);

float xBlood;
float yBlood;
  

  
int bloodTimer = -1;
//int moleMovementTimer = -1;




//Methods
void move()
{
  //Method to detect boundaries on window
  detectWall();
  distanceScaling( );
  
  //Initiate horizontal and vertical speed randomly 
  x += xSpeed;
  y += ySpeed;
  
  xBlood += xBloodSpeed;
  yBlood += yBloodSpeed;
}


  void update() 
  {
   //detectWall();
  
    if (deathTimer==-1) 
    {
      drawCharacter();
    }

    if (deathTimer>0) 
    {
      deathTimer--; 
      drawDyingMole();   
    } 

    if (deathTimer==0) {
      //remove this Mole from the list
      Moles.remove(this);
    }
  }
  
  
  void bloodSplatter()
  {
  stroke(0);
  fill(230, 0 , 0);
  ellipse(xBlood, yBlood, 10, 20);
  ellipse(xBlood, yBlood, 30, 20);
  }
 
 

  void bloodupdate() 
  {
    
    if (bloodTimer>0) 
    {
      bloodTimer--; 
      //bloodSplatter();
      moleGhost();
      
    }
  }
  

  void kill()
  {
   deathTimer = 120;
   bloodTimer = 120;
   xBlood = mouseX;
   yBlood = mouseY;
   xSpeed = 0;
   ySpeed = 0; 
  }



  void malletPhase1()
  {
  pushMatrix();
    
  translate(18,-60);
  
  pushMatrix();

  fill(179,89,0);
  ellipse(mouseX - 30, mouseY - 20, 50,75);
  stroke(0);
  rect(mouseX + -30, mouseY, 20, 100, 150);
  noStroke();
  quad(mouseX + -40, mouseY + 10, mouseX + -30, mouseY + -55, mouseX + 5, mouseY + -35, mouseX + 5, mouseY + 35);
  stroke(0);
  ellipse(mouseX, mouseY, 50, 75);
  
  
  line(mouseX - 24, mouseY + 70,  mouseX - 24, mouseY + 30);
  line(mouseX - 18, mouseY + 90,  mouseX - 18, mouseY + 40);
  line(mouseX - 28, mouseY - 14,  mouseX - 49, mouseY - 26);
  pushMatrix();
  translate(0,20);
  line(mouseX - 26, mouseY - 14,  mouseX - 47, mouseY - 26); 
  translate(25,-45);
  line(mouseX - 26, mouseY - 14,  mouseX - 49, mouseY - 31); 
  translate(-18,8);
  line(mouseX - 26, mouseY - 14,  mouseX - 49, mouseY - 31); 
  popMatrix();
  line(mouseX + 10, mouseY + -25,  mouseX + 10, mouseY + 25);
  line(mouseX - 10, mouseY - 20,  mouseX - 10, mouseY + 25);
  line(mouseX - 3, mouseY - 30,  mouseX - 3, mouseY + 5);
  noFill();
  
  popMatrix(); 
  popMatrix();
  
  }

  void malletPhase2()
  {
  pushMatrix(); 
  
  translate(0, -25);
  
  pushMatrix();
  
  fill(179,89,0);
  ellipse(mouseX - 33, mouseY + 20, 65, 40);
  noStroke();
  quad(mouseX + -64, mouseY + 20, mouseX + -62, mouseY + -25, mouseX + 2, mouseY + -25, mouseX - 2, mouseY + 20);
  stroke(0);
  ellipse(mouseX - 30, mouseY - 25, 65, 40);
  line(mouseX + 2, mouseY - 22,  mouseX - 1, mouseY + 25);
  ellipse(mouseX - 20, mouseY + 15, 15, 20);
  noStroke();
  quad(mouseX + -20, mouseY + 25, mouseX + -20, mouseY + 7, mouseX + 20, mouseY + 25, mouseX + 20, mouseY + 45);
  stroke(0);
  ellipse(mouseX + 20, mouseY + 35, 15, 20);
 
  pushMatrix();
  line(mouseX - 35, mouseY - 5,  mouseX - 37, mouseY + 20); 
  translate(-10,10);
  line(mouseX - 35, mouseY - 5,  mouseX - 37, mouseY + 25); 
  translate(-17.5,-25);
  line(mouseX - 35, mouseY - 5,  mouseX - 38, mouseY + 35);
  translate(8,8);
  line(mouseX - 35, mouseY - 5,  mouseX - 37, mouseY + 25);
  popMatrix();
  
  pushMatrix();
  line(mouseX - 20, mouseY + 5,  mouseX + 20, mouseY + 25);
  translate(0,21);
  line(mouseX - 20, mouseY + 5,  mouseX + 18, mouseY + 24);
  popMatrix();  
  
  pushMatrix();
  line(mouseX + -35, mouseY - 20,  mouseX -45, mouseY - 40);
  translate(15,10);
  line(mouseX + -33, mouseY - 18,  mouseX -45, mouseY - 40);
  translate(10,-10);
  line(mouseX + -35, mouseY - 20,  mouseX -45, mouseY - 40);  
  popMatrix();
  
  popMatrix();
  popMatrix();
  }








void detectWall()
{
  //Statement to have object appear on other side of screen if it surpasses horizontal screen boundaries
    if (x > 720) 
    {
      xSpeed = -xSpeed ;
    }
    if (x < -780) 
    {
      xSpeed = -xSpeed;
    }
    
   //Same collision detection for vertical screen boundaries
    if (y > 300) 
    {
      ySpeed = -ySpeed;
    }
    if (y < -370) 
    {
      ySpeed = -ySpeed;
    } 
}



void distanceScaling()
{

  

}




void drawCharacter()
{
pushMatrix();
translate(x,y);

//Body
stroke(0);
strokeWeight(3);
fill(115, 77, 38);
rect(620,500,90,100);
arc(665, 505, 90, 110, radians(-180), 0);

//Eyes
fill(0);
ellipse(650,490,8,28);
ellipse(680,490,8,28);

//Nose
stroke(1);
fill(225,128,179);
strokeWeight(2);
ellipse(665,515,40,25);
fill(225,179,209);
noStroke();
ellipse(658,512,15,10);

//Pupils
noStroke();
fill(255);
ellipse(650,482,8,13);
ellipse(680,482,8,13);

strokeWeight(2);
fill(179,0,89);

//Ground
stroke(1);
fill(77,51,25);
arc(700, 625, 110, 90, radians(-180), 0);
arc(680, 625, 80, 100, radians(-180), 0);
arc(630, 625, 100, 90, radians(-180), 0);
fill(96,64,32);
arc(650, 625, 60, 60, radians(-180), 0);
arc(620, 630, 40, 40, radians(-180), 0);
arc(700, 630, 50, 60, radians(-180), 0);

popMatrix();
}




void drawDyingMole()
{
y += moleDyingYSpeed;

pushMatrix(); 
translate(x,y);
pushMatrix();
translate(0,20);


//Body
stroke(0);
strokeWeight(3);
fill(115, 77, 38);
rect(620,500,90,100);
arc(665, 505, 90, 110, radians(-180), 0);


//Eyes
fill(0);
pushMatrix();
translate(657, 475);
rotate(radians(45));
rect(0,0,5,28);
popMatrix();

pushMatrix();
translate(638, 478);
rotate(radians(-45));
rect(0,0,5,28);
popMatrix();

fill(0);
pushMatrix();
translate(688, 475);
rotate(radians(45));
rect(0,0,5,28);
popMatrix();

pushMatrix();
translate(669, 478);
rotate(radians(-45));
rect(0,0,5,28);
popMatrix();

//Nose
fill(225,128,179);
strokeWeight(2);
ellipse(665,515,40,25);
fill(225,179,209);
noStroke();
ellipse(658,512,15,10);
strokeWeight(2);
fill(179,0,89);
 
popMatrix();

//Ground
pushMatrix();
//y += moleDyingYSpeed = 0;
//xSpeed = 0;
//ySpeed = 0;

stroke(1);
fill(77,51,25);
arc(700, 625, 110, 90, radians(-180), 0);
arc(680, 625, 80, 100, radians(-180), 0);
arc(630, 625, 100, 90, radians(-180), 0);
fill(96,64,32);
arc(650, 625, 60, 60, radians(-180), 0);
arc(620, 630, 40, 40, radians(-180), 0);
arc(700, 630, 50, 60, radians(-180), 0);
popMatrix();
popMatrix();
}


void moleGhost()
{
pushMatrix();
translate(xBlood - 700, yBlood - 600);

//Body
stroke(0, 134, 179);
strokeWeight(3);
fill(153,230,255);
rect(620,500,90,100);
arc(665, 505, 90, 110, radians(-180), 0);

//Eyes
stroke(0);
fill(0);
ellipse(650,490,8,28);
ellipse(680,490,8,28);

//Nose
stroke(1);
fill(77, 210, 255);
strokeWeight(2);
ellipse(665,515,40,25);
fill(128, 223, 255);
noStroke();
ellipse(658,512,15,10);

//Pupils
noStroke();
fill(255);
ellipse(650,482,8,13);
ellipse(680,482,8,13);

strokeWeight(2);
fill(179,0,89);

//Spectral elements


stroke(26, 198, 255);
strokeWeight(3);
fill(153,230,255);

ellipse(625, 595, 40, 120);
ellipse(640, 580, 30, 70);
ellipse(630, 600, 20, 50);
ellipse(655, 630, 40, 100);
ellipse(680, 580, 30, 70);
ellipse(630, 600, 20, 50);
ellipse(700, 600, 30, 100);

ellipse(600, 540, 20, 30);
ellipse(590, 600, 20, 30);
ellipse(730, 600, 20, 30);
ellipse(725, 550, 20, 30);
strokeWeight(2);
ellipse(725, 650, 10, 20);
ellipse(680, 670, 10, 20);
ellipse(620, 670, 10, 20);
popMatrix();
}



void cloud(float xCloud, float yCloud, float zCloud)
{
pushMatrix();
stroke(0);
strokeWeight(1);
translate(xCloud,yCloud);
scale(zCloud);
translate(-740,0);
strokeWeight(3);
fill(204, 238, 255);
ellipse(700, 100, 300, 100);
ellipse(750, 120, 300, 100);
fill(153, 221, 255);
ellipse(680, 140, 160, 50);
ellipse(800, 80, 180, 60);
fill(204, 255, 255);
ellipse(600, 80, 100, 30);
ellipse(750, 60, 100, 40);
popMatrix(); 
}


void cloudMove() 
{
xCloud =+ cloudSpeed;
}



//Constructor
Mole(float x, float y)
{
this.x = x;
this.y = y;
this.xSpeed = random(-3,3);
this.ySpeed = random(-3.3);
}


}
