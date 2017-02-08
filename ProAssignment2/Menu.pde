class Menu
{
  int menu;

  //starting screen
  void homescreen()
  {
    background(177,206,202);
    fill(255,255,0);
    textSize(70);
    text("Off the wall !", 240,200);
    //play game box
    textSize(40);
    fill(255,0,0);
    stroke(0,0,0);
    rect(310,300,275,80,15);
    fill(0,0,0);
    text("Play Game", 350, 350);
    //Quit game box
    fill(255,0,0);
    rect(310,400,275,80,15);
    fill(0,0,0);
    text("Quit Game", 350, 450);
    
    if(mousePressed)
    {
      //if mouse is pressed between these coordinates
      if(mouseX>310 && mouseX<585 && mouseY>275 && mouseY<355)
      {
         
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
}
  