void setup ()
{
  size(850,850);
  

}
//speeds
float x = 0;
float y = 0;
float xSpeed = 10;
float ySpeed = 5;
float paddleSpeed = 5;
//ball
float w = 20;
float z = 40;
//paddle
float luserj = 100;
float luserk = 250;
float luserw = 20;
float luserh = 70;
boolean up;
boolean down ;
void draw()
{
  background(235, 247, 255);
   //paddle
   rect(luserj,luserk,luserw,luserh);
   fill(250,99,99);
   //ball
    fill(66, 66, 66);
    ellipse(x, y, z, w);
    //Speed of ball
    x += xSpeed;
    y += ySpeed;
    //bouncing ball
    if (x + w > width || x < 0)
    {
      xSpeed = - xSpeed;
    }
    if(y + z > height || y < 0)
    {
      ySpeed = - ySpeed;
    }
    keyPressed();
    
}
   

void keyPressed()
{
   //going up
  if(keyPressed)
    {
      if(keyCode == 'q' || key == 'Q')
        {
          luserk = luserk + paddleSpeed;
        }
     }
  //goingdown
  if(keyPressed)
    {
      if(keyCode == 'a' || key == 'A')
        {
          luserk = luserk - paddleSpeed; 
        }
    }
}
   
    