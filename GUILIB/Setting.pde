enum DIRECTION {
  UP, RIGHT, DOWN, LEFT
};

enum TEXTSIDE {
  TOP,BOTTOM,LEFT,RIGHT 
}

class StyleSetting
{
  //UI element colors
  color elementColor           = color(120, 80, 120);
  color elementBGColor         = color(80, 30, 40);

  //UI text color
  color textColor              = color(120, 10, 200);

  //UI interactables color (things you can press/drag)
  color interactableColor      = color(120, 10, 200);
  color interactableHeldColor  = color(120, 10, 150);
  color interactableHoverColor = color(120, 40, 230);

  StyleSetting()
  {
    PFont font = loadFont("customFont.vlw");
    textFont(font, 48);
    noStroke();
    textSize(10);
  }
}
