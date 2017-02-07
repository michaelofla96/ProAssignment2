class Menu
{
  boolean menu;

  Menu(boolean menu)
  {
    this.menu = menu;
  }
  //starting screen
  void homescreen()
  {
    background(177,206,202);
    fill(255,255,0);
    textSize(60);
    text("Off the wall", 300,100);
    //play game box
    textSize(40);
    fill(255,0,0);
    stroke(0,0,0);
    rect(310,300,275,80);
    fill(0,0,0);
    text("Play Game", 350, 350);
    //Quit game box
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
}
  