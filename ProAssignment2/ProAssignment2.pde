import processing.sound.*;
Menu reptar;
void setup ()
{
  size(900,700);
  reptar = new Menu(false);
  //font
  //Images
  //Sounds
  

}
//speeds
float xSpeed = 5;
float ySpeed = 5;
float paddleSpeed = 15;
//ball
float ballx = 100;
float bally = 100;
float ballw = 50;
float ballh = 50;
//paddle
PShape paddle;
float luserx = 3;
float lusery = 250;
float luserw = 20;
float luserh = 90;
//scoreboard
int score = 2;

// change to paddlesize
float psizex = 775;
float psizey = 50;
float psizew = 30;
float psizeh = 30;
//small paddle
float spadx = 775;
float spady = 50;
float spadw = 30;
float spadh = 30;
// speed up
float supx = 775;
float supy = 650;
float supw = 30;
float suph = 30;
//slow down
float downx = 775;
float downy = 650;
float downw = 30;
float downh = 30;
//twoball powerup
float tbx = 350;
float tby = 300;
float tbw = 30;
float tbh = 30;
//second ball
float tballx = 100;
float tbally = 100;
float tballw = 30;
float tballh = 30;

void draw()
{
  if(reptar.menu == true)
  {
    reptar.homescreen();
  }
  else
  {
  background(235, 247, 255);
   //paddle
   stroke(0,0,0);
   fill(250,99,99);
   rect(luserx,lusery,luserw,luserh);
   //ball
    stroke(255,0,0);
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
    smallpaddle();
    slowdown();
    //twoballs();
  }
}

void Paddle()
{
  paddle = createShape();
  paddle.beginShape();
  paddle.vertex(0, 0);
  paddle.vertex(0, -luserh/2);
  paddle.vertex(20, -luserh/2);
  paddle.vertex(20, luserh);
  paddle.vertex(0, luserh);
  paddle.endShape(CLOSE);
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
    if(ballx +ballw/2 <= 0)
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
      if(keyCode == 'w' || keyCode == 'W')
        {
          lusery = lusery - paddleSpeed;
        }
     }
  //goingdown
  if(keyPressed)
    {
      //if A is pressed paddle moves up
      if(keyCode == 's' || keyCode == 'S')
        {
          lusery = lusery + paddleSpeed; 
        }
    }
    
}
//ball to hit off paddle
void hitpaddle()
{
  //if ball hit points of the paddle
  //if( dist(ballx, bally, luserx-luserh/2, lusery+luserh/2) < 110  )
  //if(((ballx - ballw/2) < (luserx + luserw)) && ((bally - ballh/2) < (lusery + luserh/2)) && ((bally + ballh/2) > (lusery + luserh/2)))
  if(((ballx - ballw/2) < (luserx + luserw)) && ((bally - ballh/2) < (lusery + luserh/2)) && ((bally + ballw/2) > (lusery + luserh/2)))
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
//when game ends screen
void endgame()
{
  //freeze ball
  xSpeed = 0;
  ySpeed = 0;
  background(177,206,202);
  fill(0,0,0);
  textSize(40);
  text("Game",350,150);
  text("Over",350,200);
  //show score
  text("Score:", 350,250);
  text(score,475,250);
  //play again box
  stroke(0,0,0);
  fill(255,0,0);
  rect(310,300,275,80);
  fill(0,0,0);
  text("Play again", 350, 350);
  fill(255,0,0);
  rect(310,400,275,80);
  fill(0,0,0);
  text("Quit Game", 350, 450);

  if(mousePressed)
  {
    //if mouse is pressed between these coordinates
    if(mouseX>310 && mouseX<585 && mouseY>275 && mouseY<355)
    {
      reptar.menu = false;
    }
  }
  if(mousePressed)
  {
    //if mouse is pressed between these coordinates
    if(mouseX>310 && mouseX<585 && mouseY>400 && mouseY<480)
      {
        exit();
      }
  }
}


void paddlesize()
{
  if(score % 3 == 0)
  {
    stroke(255,205,0);
    fill(68,255,18);
    rect(psizex,psizey,psizew,psizeh);
  
    //if(ballx - ballw/2 < psizex + psizew/2 && bally - ballh/2 < + psizey + psizeh/2 && bally + ballh/2 > + psizey - psizeh/2 )
     if(((ballx - ballw/2) > (psizex + psizew)) && ((bally - ballh/2) < (psizey + psizeh/2)) && ((bally + ballh/2) > (psizey + psizeh/2)))
    {
    //increase paddle size
    luserh++;
    }
  }
}
void smallpaddle()
{
  if(score % 5 == 0)
  {
    stroke(255,205,0);
    fill(255,0,0);
    rect(spadx,spady,spadw,spadh);
  
    //if(ballx - ballw/2 < spadx + spadw/2 && bally - ballh/2 < + spady + spadh/2 && bally + ballh/2 > + spady - spadh/2 )
    if(((ballx - ballw/2) > (spadx + spadw)) && ((bally - ballh/2) < (spady + spadh/2)) && ((bally + ballh/2) > (spady + spadh/2)))
    {
    //increase paddle size
    luserh--;
    }
  }
  
}
  
void speedup()
{
  if (score % 5 == 0)
  {
    stroke(255,205,0);
    fill(242,18,255);
    rect(supx,supy,supw,suph);
  
    //if ball hit rect
    //if(ballx - ballw/2 < supx + supw/2 && bally - ballh/2 < + supy + suph/2 && bally + ballh/2 > + supy - suph/2 )
    if(((ballx - ballw/2) > (supx + supw)) && ((bally - ballh/2) < (supy + suph/2)) && ((bally + ballh/2) > (supy + suph/2)))
    {
      //increase speed
      xSpeed = xSpeed + 1;
      ySpeed = ySpeed + 1;
    }
  }
}

void slowdown()
{
  if (score % 3 == 0)
  {
    stroke(255,205,0);
    fill(242,18,255);
    rect(downx,downy,downw,downh);
  
    //if ball hit rect
    //if(ballx - ballw/2 < downx + downw/2 && bally - ballh/2 < + downy + downh/2 && bally + ballh/2 > + downy - downh/2 )
    if(((ballx - ballw/2) > (downx + downw)) && ((bally - ballh/2) < (downy + downh/2)) && ((bally + ballh/2) > (downy + downh/2)))
    {
      //increase speed
      xSpeed = xSpeed + 1;
      ySpeed = ySpeed + 1;
    }
  }
}
/*
void twoballs()
{
  if (score % 2 == 0)
  {
    fill(2,242,228);
    rect(tbx,tby,tbw,tbh);
  }

    //if(ballx - ballw/2 < tbx + tbw/2 && bally - ballh/2 < + tby + tbh/2 && bally + ballh/2 > + tby - tbh/2 )
    if(((ballx - ballw/2) < (tbx + tbw)) && ((bally - ballh/2) < (tby + tbh/2)) && ((bally + ballh/2) > (tby + tbh/2)))
    {
       ellipse(tballx,tbally,tballw,tballh);
       
       //Speed of ball
       tballx += xSpeed;
       tbally += ySpeed;
      //bouncing ball
      //bounce off the side walls 
    }
      if (tballx + tballw > width ) 
       {
         //change direction
         xSpeed = - xSpeed;
       }
       //bounce off the top and bottom walls
       if(tbally + tballh > height || tbally < 0)
        {
          //change direction
          ySpeed = - ySpeed;
         }
        //if ball goes past paddle
        if(tballx <= 0)
         {
            endgame();
         }
    //}
   //if ball hit points of the paddle
    //if(tballx - tballw/2 < luserx + luserw && tbally - tballh/2 < + lusery + luserh/2 && tbally + tballh/2 > + lusery - luserh/2 )
    if(((ballx - ballw/2) < (luserx + luserw)) && ((bally - ballh/2) < (lusery + luserh/2)) && ((bally + ballh/2) > (lusery + luserh/2)))
    {
    //if ball hits paddle from the right side 
      if(xSpeed <0)
      {
        //change direction
        ySpeed = - ySpeed;
        //everytime it hits off the paddle the score goes up
        score++;
      }
    }
 // }
}
  
  



*/