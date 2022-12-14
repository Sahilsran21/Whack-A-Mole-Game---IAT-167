ArrayList <Mole> Moles = new ArrayList<Mole>();
//ArrayList <Blood> BloodSplatter = new ArrayList<Blood>();
PFont font;

Score score;

int moleWidth = 90;
int numMoles = 6;

int respawnTimer = 0;
int minimum = 5;
int maximum = 10;

float cloudSpeed = 5;
float yCloud;
float xCloud;




void setup()
{
   size(1280,720);
   
   score = new Score();
   
   font=loadFont("ComicSansMS-30.vlw");
   textFont(font);
   textSize(35);
   

   //Adding characters in random locations
   for (int i=0; i<numMoles; i++)
   { 
   addnewMole();
   } 
   
}
 
void addnewMole()
{
   float startX = random(-620, 720);//(-620, 350)
   float startY = random(-350, 120);
   
   //float xSpeed = random(-3,3);
   //float ySpeed = random(-3,3); 
   Mole currentMole = new Mole(startX,startY);
   Moles.add(currentMole);
}
 

void draw() 
{
   background();
   respawn();
   score.scoreBoard();
   score.drawScore();
   score.drawComboScore();
   
   
   for (int i=0; i<Moles.size(); i++)
   {
     
   
     Mole currentMole = Moles.get(i);
     
     
     currentMole.bloodupdate();
     currentMole.update();
     currentMole.drawCharacter();
     currentMole.move();
     
          

     
     //Rectangle to test hitbox location
     //rect(currentMole.x + 620, currentMole.y + 500, 90,90); // 620 500
   
     if (currentMole.deathTimer == -1 && mousePressed && dist(mouseX,mouseY,currentMole.x + 670 ,currentMole.y + 500) < moleWidth)
     {
     
     currentMole.bloodupdate();
     
     //ellipse(currentMole.xBlood ,currentMole.yBlood, 100, 100);
     currentMole.kill();
     
     //score++;
     score.update(1);  
     score.comboUpdate(1);
     } 
       
       
     currentMole.update();
     
     //currentMole.cloud(150,0,0.5);
     //currentMole.cloud(450,50,0.75); 
     //currentMole.cloudMove();
     
     
     if (mousePressed == false)
       {
       currentMole.malletPhase1();   
       }
     if (mousePressed == true) 
       { 
       currentMole.malletPhase2();
       }
     
    //rect(currentMole.x + 620, currentMole.y + 500, 90,90); // 620 500
   
    if (mousePressed && dist(mouseX,mouseY,currentMole.x + 670 ,currentMole.y + 500) > 300  && currentMole.deathTimer > 0)
     {
      score.comboReset();
     }
     
   }
   
   
  
}



void background()
{
pushMatrix();

//Mole Ground
noStroke();
fill(230, 204, 179, 70);
rect(0, 220, width, 800); 

fill(204, 151, 102, 50);
rect(0, 220, 450, 100, 50); 
rect(680, 520, 600, 200, 80); 
rect(180, 320, 420, 150, 65); 

fill(191, 125, 64, 70);
rect(10, 220, 410, 70, 50); 
rect(690, 520, 560, 160, 80); 
rect(190, 320, 380, 120, 65); 

fill(134, 88, 45, 70);
rect(25, 220, 370, 40, 50); 
rect(700, 520, 510, 110, 80); 
rect(200, 320, 350, 90, 65); 



//Sky
noStroke();
fill(51, 153, 255, 70);
rect(0, 0, width, 220);
fill(0, 102, 255, 70);
rect(-10, 0, 1100, 180 , 60);
fill(0, 82, 204, 70);
rect(-10, 0, 900, 135 , 60);



//Dirt Mole mounts
pushMatrix();
stroke(1);
fill(77,51,25);
translate(200,-20);
arc(700, 635, 180, 160, radians(-180), 0);
arc(680, 615, 150, 170, radians(-180), 0);
arc(630, 625, 170, 160, radians(-180), 0);
fill(96,64,32);
arc(650, 625, 130, 130, radians(-180), 0);
arc(620, 640, 110, 110, radians(-180), 0);
arc(700, 645, 120, 130, radians(-180), 0);
popMatrix();

pushMatrix();
stroke(1);
fill(77,51,25);
translate(0,-40);
scale(0.7);
arc(700, 635, 180, 160, radians(-180), 0);
arc(680, 615, 150, 170, radians(-180), 0);
arc(630, 625, 170, 160, radians(-180), 0);
fill(96,64,32);
arc(650, 625, 130, 130, radians(-180), 0);
arc(620, 640, 110, 110, radians(-180), 0);
arc(700, 645, 120, 130, radians(-180), 0);
popMatrix();

pushMatrix();
stroke(1);
fill(77,51,25);
translate(-150,-80);
scale(0.5);
arc(700, 635, 180, 160, radians(-180), 0);
arc(680, 615, 150, 170, radians(-180), 0);
arc(630, 625, 170, 160, radians(-180), 0);
fill(96,64,32);
arc(650, 625, 130, 130, radians(-180), 0);
arc(620, 640, 110, 110, radians(-180), 0);
arc(700, 645, 120, 130, radians(-180), 0);
popMatrix();


//Ground Marks
stroke(58,38,19);
strokeWeight(4);
noFill();
curve(0, 500, 20, 650, 400, 650, 800, 1000);
curve(150, 530, 170, 670, 550, 670, 800, 1020);
pushMatrix();
translate(300,-200);

stroke(96,63,32);
scale(0.7);
curve(150, 530, 170, 670, 550, 670, 800, 1020);
translate(350, 100);
curve(150, 530, 170, 670, 550, 670, 800, 1020);  
translate(-650, -35);
curve(150, 530, 170, 670, 550, 670, 800, 1020);  
popMatrix();
pushMatrix();

stroke(58,38,19);
scale(0.9);
translate(300,-100);
curve(150, 530, 170, 670, 550, 670, 800, 1020);
translate(500,-40);
curve(150, 530, 170, 670, 550, 670, 800, 1020);
popMatrix();



score.drawScore();
 
popMatrix();
}



void respawn()
{
respawnTimer++;
  if (respawnTimer == 60)
  {
  respawnTimer = 0;
     if (Moles.size() < maximum)
     {
     Moles.add(new Mole(random(-620, 350),random(-350, 120)));
     }   
  }
}




// Diglets have overpopulated the region! Your only hope is to wack every single one to oblivion! Press any key to start,
