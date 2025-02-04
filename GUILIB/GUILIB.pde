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

  Slider s = new Slider(new PVector(100, 100), 200, 20, new PVector(20, 200), 0.5); 
  Slider s3 = new Slider(new PVector(100, 140), 200, 20, new PVector(20, 200), 0.5); 
  gui.AddElement(s, "slider1");
  gui.AddElement(s3, "slider3");
  MinMaxSlider s2 = new MinMaxSlider(new PVector(100, 180), 200, 20, new PVector(0, 100), 0.5, 0.7);
  gui.AddElement(s2, "slider2");
  gui.CreateElementGroup("group");
  gui.AddToElementGroup(s,"group");
  gui.AddToElementGroup(s3,"group");
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
