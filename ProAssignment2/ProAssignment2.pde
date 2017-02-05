void setup ()
{
  size(900,700);
  

}
//speeds
float xSpeed = 5;
float ySpeed = 5;
float paddleSpeed = 15;
//ball
float ballx = 460;
float bally = 150;
float ballw = 50;
float ballh = 50;
//paddle
float luserx = 70;
float lusery = 250;
float luserw = 20;
float luserh = 90;
//scoreboard
int score = 0;

// change to paddlesize
float psizex = 600;
float psizey = 50;
float psizew = 30;
float psizeh = 30;
// change to ball Speed
float supx = 600;
float supy = 500;
float supw = 30;
float suph = 30;

void draw()
{
  background(235, 247, 255);
   //paddle
   fill(250,99,99);
   rect(luserx,lusery,luserw,luserh);
   //ball
    fill(255, 255, 0);
    ellipse(ballx, bally, ballw, ballh);
    //scoreboard
    fill(0,0,0);
    textSize(30);
    text(score,100,50);
    
    keyPressed();
    bouncingball();
    paddlemovement();
    hitpaddle();
    paddlesize();
    speedup();
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
   if(lusery < 0)
     {
      lusery = lusery + paddleSpeed;
     }
     //if paddle is going off greater than the height you allocated.
    if(lusery + luserh > height)
    {
      lusery = lusery - paddleSpeed;
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
          lusery = lusery - paddleSpeed;
        }
     }
  //goingdown
  if(keyPressed)
    {
      //if A is pressed paddle moves up
      if(keyCode == 'a' || keyCode == 'A')
        {
          lusery = lusery + paddleSpeed; 
        }
    }
    
}
//ball to hit off paddle
void hitpaddle()
{
  //if ball hit points of the paddle
  if(ballx - ballw/2 < luserx + luserw && bally - ballh/2 < + lusery + luserh && bally + ballh/2 > + lusery - luserh )
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
  //freeze ball
  xSpeed = 0;
  ySpeed = 0;
  background(0,0,0);
  fill(255,0,0);
  textSize(40);
  text("Game",350,250);
  text("Over",350,300);
  //show score
  text("Score:", 350,400);
  text(score,475,400);
  //play again box
  rect(310,450,275,80);
  fill(0,0,0);
  text("Play again", 350, 500);
  if (mousePressed)
  {
    //if mouse is pressed between these coordinates
    if(mouseX>310 && mouseX<585 && mouseY>450 && mouseY<530);
    {
      fill(34,34,34);
      rect(100,100,100,100);
      //setup();
      //draw();
    }
  }
}


void paddlesize()
{
  if(score % 3 == 0)
  {
    fill(68,255,18);
    rect(psizex,psizey,psizew,psizeh);
  
    if(ballx - ballw/2 < psizex + psizew/2 && bally - ballh/2 < + psizey + psizeh && bally + ballh/2 > + psizey - psizeh )
    {
    //increase paddle size
    luserh++;
    }
  }
}
  


/*
void smallpaddle
void slowdown

*/


//two balls


   
    