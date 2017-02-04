void setup ()
{
  size(850,850);
  

}
//speeds
float x = 0;
float y = 0;
float xSpeed = 10;
float ySpeed = 5;
//ball
float w = 20;
float z = 40;
//paddle
float ruserh = 750;
float luserh = 100;
void draw()
{
  background(235, 247, 255);
 
  //rightuser
   rect(ruserh,250,20,70);
   fill(0,99,99);
  //leftuser
   rect(luserh,250,20,70);
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
    //leftuser
    //going up
    if(keyPressed)
  {
    if(keyCode == 'a')
    {
       ruserh = ruserh+20;
       
    }
  }
    //leftuser
    //going down
     if(keyPressed)
  {
    if(keyCode == 's')
    {
       
       ruserh = ruserh -20;
    }
  }
  //rightuser
  //goingup
    if(keyPressed)
  {
    if(keyCode == 'k')
    {
       ruserh = ruserh+20;
       
    }
  }
    //rightuser
    //going down
     if(keyPressed)
  {
    if(keyCode == 'l')
    {
       
       ruserh = ruserh -20;
    }
  }
    
}