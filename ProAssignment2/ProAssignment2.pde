void setup ()
{
  size(850,850);
  

}
float x = 0;
float xSpeed = 10;
float w = 20;
float z = 40;
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
    ellipse(x, 200, z, w);
    x += xSpeed;
    
    if (x + w > width || x < 0)
    {
    xSpeed = - xSpeed;
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