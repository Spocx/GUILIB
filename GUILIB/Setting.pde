class StyleSetting
{
  //UI element colors
  color elementColor           = color(120, 80, 120);
  color elementBGColor         = color(80, 30, 40);

  boolean doElementStroke      = false;
  color elementStrokeColor     = color(80, 30, 40);
  float elementStrokeWeight    = 1;

  //UI text color
  color textColor              = color(120, 10, 200);
  float fontSize               = 10;

  //UI interactables color (things you can press/drag)
  color interactableColor      = color(120, 10, 200);
  color interactableHeldColor  = color(120, 10, 150);
  color interactableHoverColor = color(120, 40, 230);

  //UI window colors
  boolean doWindowStroke       = true;
  color windowColor            = color(100, 30, 10,200);
  color windowStrokeColor      = color(120, 80, 120);
  float windowStrokeWeight     = 5;
  float windowCornerRounding   = 10;
  float windowSpacingMarginX   = 20;
  float windowSpacingMarginY   = 20;
  float windowElementMarginX   = 20;
  float windowElementMarginY   = 20;

  StyleSetting()
  {
    PFont font = createFont("Consolas bold", 48);
    textFont(font, 48);
    noStroke();
    textSize(fontSize);
  }
}
