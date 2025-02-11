enum DIRECTION {
  UP, RIGHT, DOWN, LEFT
};

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
