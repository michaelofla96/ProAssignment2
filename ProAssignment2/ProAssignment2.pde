void setup ()
{
  size(900,700);
  

}
//speeds
float ballx = 0;
float bally = 0;
float xSpeed = 1;
float ySpeed = 1;
float paddleSpeed = 10;
//ball
float ballw = 50;
float ballh = 50;
//paddle
float luserj = 70;
float luserk = 250;
float luserw = 20;
float luserh = 90;

void draw()
{
  background(235, 247, 255);
   //paddle
   rect(luserj,luserk,luserw,luserh);
   fill(250,99,99);
   //ball
    fill(66, 66, 66);
    ellipse(ballx, bally, ballw, ballh);
    keyPressed();
    bouncingball();
    paddlemovement();
    //hitpaddle();
}
void bouncingball()
{
    //Speed of ball
    ballx += xSpeed;
    bally += ySpeed;
    //bouncing ball
    if (ballx + ballw > width || ballx < 0)
    {
      xSpeed = - xSpeed;
    }
    if(bally + ballh > height || bally < 0)
    {
      ySpeed = - ySpeed;
    }
    
}
//TO stop paddle from going off screen
void paddlemovement()
{
   if(luserk < 0)
     {
      luserk = luserk + paddleSpeed;
     }
     
    if(luserk + luserh > height)
    {
      luserk = luserk - paddleSpeed;
    }
}

void keyPressed()
{
   //going up
  if(keyPressed)
    {
      // if Q is pressed paddle moves up
      if(keyCode == 'q' || keyCode == 'Q')
        {
          luserk = luserk - paddleSpeed;
        }
     }
  //goingdown
  if(keyPressed)
    {
      //if A is pressed paddle moves up
      if(keyCode == 'a' || keyCode == 'A')
        {
          luserk = luserk + paddleSpeed; 
        }
    }
    
}
//ball to hit off paddle
void hitpaddle()
{
  if(ballx - ballw/2 < luserj + luserw/2 && bally - ballh/2 < luserk + luserh/2)
  {
    xSpeed = - xSpeed;
    ySpeed = - ySpeed;
  }
}

//bounce off all walls but the one you are beside.
//paddlespeed to change
//size of paddle
//two balls


   
    