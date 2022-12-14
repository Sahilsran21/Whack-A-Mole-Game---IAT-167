class Score
{
//field
int score;
int comboscore;
int textTimer = -1;

//Methods
void update(int point)
{
score += point;
}



void scoreBoard()
{ 
pushMatrix();
//Regular Mole
translate(width/2, height/2);
// rotate around the center of the sketch
rotate(radians(-90));
translate(-650, -510);

pushMatrix();

translate(85,80);
scale(1.3);

//Body
stroke(0);
strokeWeight(3);
fill(115, 77, 38);

rect(620,500,90,320);
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
pushMatrix();
translate(0,200);
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

translate(30, 0);
scale(1.15);





//Ghost mole
pushMatrix();
translate(40,250);

//Body
stroke(0, 134, 179);
strokeWeight(3);
fill(153,230,255);
rect(620,500,90,250);
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
pushMatrix();
translate(0, 150);
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
popMatrix();
popMatrix();
}



void drawScore()
{

fill(0,0,153);
text ("You have wacked ", 910, 55);  
text (score + " Moles!", 910, 90);
//text ("You have stopped " + score + " Moles.", 900, 50); 
}
 

void drawComboScore()
{
fill(0,82,102);
text ("Combo: " + comboscore, 1035, 180);
}
 
void comboUpdate(int combopoint)
{
textTimer = 120;
comboscore += combopoint;
fill(128,255,255);


 
    
//if (comboscore == 1)
//{
//textTimer--;
//text ("Well done!", 400, 55);  

//}
//if (comboscore == 10)
//{
//text ("Keep it up!", 400, 55);  
//}
//if (comboscore == 15)
//{
//text ("Outstanding!", 400, 55);   
//}

}


void comboReset()
{
comboscore = 0;
}



 
 
 
//Constructor
Score()
{
score = 0;
comboscore = 0;
}
  
  
}
