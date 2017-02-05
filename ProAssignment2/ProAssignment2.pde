void setup ()
{
  size(900,700);
  

}
//speeds
float ballx = 460;
float bally = 150;
float xSpeed = 3;
float ySpeed = 3;
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
    hitpaddle();
}
void bouncingball()
{
    //Speed of ball
    ballx += xSpeed;
    bally += ySpeed;
    //bouncing ball
    //bounce off the side walls
    if (ballx + ballw > width || ballx < 0)
    {
      //change direction
      xSpeed = - xSpeed;
    }
    //bounce off the top and bottom walls
    if(bally + ballh > height || bally < 0)
    {
      //change direction
      ySpeed = - ySpeed;
    }
    
}
//TO stop paddle from going off screen
void paddlemovement()
{
  //if paddle is going off the top of the screen
   if(luserk < 0)
     {
      luserk = luserk + paddleSpeed;
     }
     //if paddle is going off greater than the height you allocated.
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
  //if ball hit points of the paddle
  if(ballx - ballw/2 < luserj + luserw/2 && bally - ballh/2 < + luserk + luserh/2 && bally + ballh/2 > + luserk - luserh/2 )
  {
    //if ball hits paddle from the right side 
    if(xSpeed <0)
     {
      //change direction
      xSpeed = - xSpeed;
     }
    //ySpeed = - ySpeed;
    //&& bally - ballh < luserk + luserh
  }
}

//bounce off all walls but the one you are beside.
//paddlespeed to change
//size of paddle
//two balls


   
    