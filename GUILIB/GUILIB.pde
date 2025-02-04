color bgc;
PVector mousepos = new PVector(0, 0);
GUI gui;
StyleSetting style;


//temp
boolean keyDown = false;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  bgc = color(100, 30, 10);
  style = new StyleSetting();
  gui = new GUI();

  GUIElement s = gui.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider1"); 
  GUIElement s2 = gui.AddElement(new Slider(new PVector(100, 140), 200, 20, new PVector(0, height), 0.5), "slider2"); 
  GUIElement s3 = gui.AddElement(new MinMaxSlider(new PVector(100, 180), 200, 20, new PVector(0, 100), 0.5, 0.7), "slider3");

  GUIElementGroup g = gui.CreateElementGroup("group");

  g.AddElement(s);
  g.AddElement(s2);
}



void draw()
{
  background(bgc);

  UpdateGlobals();
  gui.Update();
  gui.Show();
  if (keyPressed && key == ' ')
  {
    if (!keyDown)
    { 
      keyDown = true;
      gui.PrintDebug();
      print();
    }
  } else
  {
    keyDown = false;
  }
}
