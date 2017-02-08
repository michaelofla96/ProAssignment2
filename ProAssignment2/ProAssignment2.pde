import ddf.minim.*;
Minim minim;
AudioPlayer fail;
AudioPlayer click;
AudioPlayer boing;
Menu reptar; 
void setup ()
{
  size(900,700);
  reptar = new Menu();
  font = loadFont("BerlinSansFB-Bold-48.vlw");
  textFont(font);

  
  minim = new Minim(this);
  fail = minim.loadFile("fail.mp3");
  click = minim.loadFile("click.mp3");
  boing = minim.loadFile("boing.mp3");
}
PFont font;
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
float paddlex = 3;
float paddley = 250;
float paddlew = 20;
float paddleh = 90;
int game_reset = 0;
//scoreboard
int score = 1;

// change to paddlesize
float psizex = 750;
float psizey = 50;
float psizew = 30;
float psizeh = 30;
//small paddle
float spadx = 750;
float spady = 50;
float spadw = 30;
float spadh = 30;
// speed up
float supx = 750;
float supy = 650;
float supw = 30;
float suph = 30;
//slow down
float downx = 750;
float downy = 650;
float downw = 30;
float downh = 30;
//Game states
//final int statemenu = 0;
//final int stateGame = 1;
//final int stateEndGame = 2;
int state =0;
//int state = statemenu;

void draw()
{
  
   // Switch between states
  //switch(state) {
    //case 0:
    //  reptar.homescreen();
    //  break;
    //case 1:
    //   displayGame();     
    //  break;
    //case 2:
    //  endgame();
    //  break;
    //}
    
    if (state == 0)
    {
      reptar.homescreen();
    }
    else if (state == 1)
    {
      displayGame(); 
    }
    else if (state == 2)
    {
      endgame(); 
    }
    
    //trying to get the Play again button to work
    if(game_reset == 1)
    {
      //redrawing the ball
      ballx = 100;
      bally = 100;
      //setting the state
      state = 1;
      //resetting the score
      score = 1;
      //setting the speeds again
      xSpeed = 5;
      ySpeed = 5;
    }
   
}
void scoreboard()
{
  //scoreboard
    fill(0,0,0);
    textSize(30);
    text(score,100,50);
}
void ballmethod()
{
     //ball
    stroke(255,0,0);
    fill(255, 255, 0);
    ellipse(ballx, bally, ballw, ballh);
}
void paddlemethod()
{
  //paddle
   stroke(0,0,0);
   fill(250,99,99);
   rect(paddlex,paddley,paddlew,paddleh);
}

void displayGame()
{
  background(235, 247, 255);
    //calling all the methods
    paddlemethod();
    ballmethod();
    scoreboard();
    keyPressed();
    bouncingball();
    paddlemovement();
    hitpaddle();
    paddlesize();
    speedup();
    smallpaddle();
    slowdown();
}
void Paddle()
{
  //paddle shape
  paddle = createShape();
  paddle.beginShape();
  paddle.vertex(0, 0);
  paddle.vertex(0, -paddleh/2);
  paddle.vertex(20, -paddleh/2);
  paddle.vertex(20, paddleh);
  paddle.vertex(0, paddleh);
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
      fail.play();
      fail.rewind();
      state = 2;
    }
    
}
//TO stop paddle from going off screen
void paddlemovement()
{
  //if paddle is going off the top of the screen
   if(paddley < 0)
     {
      paddley = paddley + paddleSpeed;
     }
     //if paddle is going off greater than the height you allocated.
    if(paddley + paddleh > height)
    {
      paddley = paddley - paddleSpeed;
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
          paddley = paddley - paddleSpeed;
        }
     }
  //goingdown
  if(keyPressed)
    {
      //if A is pressed paddle moves up
      if(keyCode == 's' || keyCode == 'S')
        {
          paddley = paddley + paddleSpeed; 
        }
    }
    
}
//ball to hit off paddle
void hitpaddle()
{
   //if (ballx < (paddlex + paddlew + (balld/2))) {
   // if ((bally >= paddley) && (bally <= paddley + paddleh))
   //Another way for the ball to hit paddle, but when I did it this way, the ball didnt hit the powerups.
  //if ball hit points of the paddle
  if(((ballx - ballw/2) < (paddlex + paddlew)) && ((bally - ballh/2) < (paddley + paddleh/2)) && ((bally + ballw/2) > (paddley + paddleh/2)))
  {
    //if ball hits paddle from the right side 
    if(xSpeed <0)
     {
      //change direction
      xSpeed = - xSpeed;
      //everytime it hits off the paddle the score goes up
      score++;
      boing.play();
      boing.rewind();
     }
    
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
      game_reset = 1;
      state = 1;
      click.play();
      click.rewind();
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
    //green sqauare
    fill(68,255,18);
    rect(psizex,psizey,psizew,psizeh);
    //if ball hits the square
     if(((ballx - ballw/2) > (psizex + psizew)) && ((bally - ballh/2) < (psizey + psizeh/2)) && ((bally + ballh/2) > (psizey + psizeh/2)))
    {
     //increase paddle size
     paddleh  += 5;
     //change colour of the square
     fill(202,255,188);
     rect(psizex,psizey,psizew,psizeh);
    }
  }
}
void smallpaddle()
{
  if(score % 5 == 0)
  {
    stroke(255,205,0);
    //red sqaure
    fill(255,0,0);
    rect(spadx,spady,spadw,spadh);
    //if ball hits the sqaure
    if(((ballx - ballw/2) > (spadx + spadw)) && ((bally - ballh/2) < (spady + spadh/2)) && ((bally + ballh/2) > (spady + spadh/2)))
    {
      //decrease paddle size
      paddleh -= 3;
      //change colour of the square
      fill(255,183,189);
      rect(spadx,spady,spadw,spadh);
    }
  }
  
}
  
void speedup()
{
  if (score % 5 == 0)
  {
    stroke(255,205,0);
     //pink square
    fill(242,18,255);
    rect(supx,supy,supw,suph);
  
    //if ball hit rect
    if(((ballx - ballw/2) > (supx + supw)) && ((bally - ballh/2) < (supy + suph/2)) && ((bally + ballh/2) > (supy + suph/2)))
    {
      //increase speed
      xSpeed += 2;
      ySpeed += 2;
      //change colour of the square
      fill(252,194,252);
      rect(supx,supy,supw,suph);
    }
  }
}

void slowdown()
{
  if (score % 3 == 0)
  {
    stroke(255,205,0);
    //orange sqaure
    fill(252,97,0);
    rect(downx,downy,downw,downh);
  
    //if ball hit rect
    if(((ballx - ballw/2) > (downx + downw)) && ((bally - ballh/2) < (downy + downh/2)) && ((bally + ballh/2) > (downy + downh/2)))
    {
      //increase speed
      xSpeed -=  1;
      ySpeed -=  1;
      //change colour of the square
      fill(252,159,97);
      rect(downx,downy,downw,downh);
    }
  }
}