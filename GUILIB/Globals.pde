enum DIRECTION {
  UP, RIGHT, DOWN, LEFT
};

enum TEXTSIDE {
  TOP,BOTTOM,LEFT,RIGHT 
}

StyleSetting style;

PVector mousepos = new PVector(0, 0);

void UpdateGlobals()
{
  UpdateMousePos();
}

void UpdateMousePos()
{
  mousepos.x = mouseX;
  mousepos.y = mouseY;
}
