# ProAssignment2
Concept
For this assignment in Processing we were told to create a classic game. After much consideration I decided to creat the game pong. Where there is two paddles and two players hit a ball across the screen until one of them misses and the other person get a point.
 This game can alos be played against a CPU and it has many other variations. To start my assignment I decided to draw out my game, where such things are placed. I had a think about how I  would program some little things like movement and stuff. I decided to change my pong game from a two player game to a one player game. I thought this would be better as tested out a two player game by yourself seemed difficult. So I went with one paddle and bouncing the ball against the walls to gather points.
 
Controls
W = moving the paddle up
S = moving the paddle down
Mouse = to click the buttons
 
Features
To start my game the user is brought to the main menu. This menu has the game title and has two buttons. One button PLAY GAME will bring the user into the game. The other button QUIT GAME will let the user leave the program. When the user presses the PLAY GAME button. The user enters the game. The ball starts by moving away from the user's paddle giving the user time to adjust and get set. The game is a plain screen, with a paddle on the left side and a ball bouncing around. There is score number in the top left corner. This score counter starts at one as the powerups would all show on the screen if it started at zero.I have a switch statement to switch between screens. The main menu is held in a class.There is also an end screen that is called. You can choose if you want to play again, or if you want to quit the game. There is a font added for the game. Also there are sounds for the game. A sound is played when the game ends and a sound is played for the game starts.

Functionality
The ball bounces off the walls of the game using if statements. So if the x of the ball plus the width divided by two is equal to the width of the wall. You change the speed to equal negative speed. So the ball will change the direction everytime it hits off the walls. The wall your paddle is against doesn't bounce the ball back. If the ball position plus the width of the ball  divided by 2 is greater than zero. The ball is past the left wall and the game ends. The switch statement calls the end game screen. You can choose if you want to play again, or if you want to quit the game. The game is a simple bounce off the wall and everytime your the ball bounces off your paddle the score counter increments. The aim of the game is to see how high your score can go. I thought this was kind of boring for a game so I decided to add power ups.

There is 4 different power ups. They appear in the top right corner and the bottom right corner of the screen. To get them to appear at different times. I added an if statement with a modulo inside it. The different powerups appear at the multiples of three and five. At the number fifteen they all appear but most user's dont get that far. The first powerup increases the size of the paddle. When the ball hits off it, the square changes colour and increments the size of the height of the paddle. The second power up decreases the size of the bar. Again when the ball hits the square it has drawn, it changes colour for a moment and then decreases the size of the paddle. The next power up changes the speed of the ball. When this powerup square it hit the speed of the ball increases. The last power up slows down the ball. When this powerup is hit the speed of the ball decreases. The powerups all work of the two variables of speed and height. I had pondered the idea of using two balls etc. But it became two complicated to work with.

The Play again button does not work, I tried using a switch statement to use but that wouldnt work. Then I tried with a boolean which didn't. I then used a few if statements to switch between. I thought the problem was that the ball was past 0 and the game kept ending over and over. So I tried redrawing the ball again in new co-ordinates but it that didnt work either. I left it in the game but it never ending up working.

[![Video](http://img.youtube.com/vi/0WMdEI4QAaI/0.jpg)](http://www.youtube.com/watch?v=0WMdEI4QAaI)


