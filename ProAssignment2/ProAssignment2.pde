void setup ()
{
  size(900,700);
  

}
//speeds
float xSpeed = 5;
float ySpeed = 5;
float paddleSpeed = 10;
//ball
float ballx = 460;
float bally = 150;
float ballw = 50;
float ballh = 50;
//paddle
float luserj = 70;
float luserk = 250;
float luserw = 20;
float luserh = 90;
//scoreboard
int score = 0;


void draw()
{
  background(235, 247, 255);
   //paddle
   rect(luserj,luserk,luserw,luserh);
   fill(250,99,99);
   //ball
    fill(66, 66, 66);
    ellipse(ballx, bally, ballw, ballh);
    //scoreboard
    textSize(30);
    text(score,100,50);
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
    if (ballx + ballw > width ) //|| ballx < 0)
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
    //if ball goes past paddle
    if(ballx < 0)
    {
      endgame();
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
  if(ballx - ballw/2 < luserj + luserw/2 && bally - ballh/2 < + luserk + luserh && bally + ballh/2 > + luserk - luserh )
  {
    //if ball hits paddle from the right side 
    if(xSpeed <0)
     {
      //change direction
      xSpeed = - xSpeed;
      //everytime it hits off the paddle the score goes up
      score++;
     }
    //ySpeed = - ySpeed;
    //&& bally - ballh < luserk + luserh
  }
}
void endgame()
{
  xSpeed = 0;
  ySpeed = 0;
  background(0,0,0);
  fill(255,0,0);
  textSize(40);
  text("Game",350,250);
  text("Over",350,300);
  text("Score:", 350,400);
  //play again box
  rect(310,450,275,80);
  fill(0,0,0);
  text("Play again", 350, 500);
  
}

//bounce off all walls but the one you are beside.
//paddlespeed to change
//size of paddle
//two balls


   
    