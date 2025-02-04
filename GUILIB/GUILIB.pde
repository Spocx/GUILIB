color bgc;
PVector mousepos = new PVector(0, 0);
GUI gui;
StyleSetting style;
T t;
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
  GUIElement p = gui.AddElement(new PlotPoint(new PVector(100, 220), 50, 50, new PVector(0, 100), new PVector(0, 100), 0.5, 0.5), "plotpoint1");
  GUIElement p2 = gui.AddElement(new PlotPoint(new PVector(100, 310), 200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint2");

  GUIElementGroup g = gui.CreateElementGroup("group");

  g.AddElement(s);
  g.AddElement(s2);
  g.AddElement(p2);
  
  t = new T(g);
}



void draw()
{
  background(bgc);

  UpdateGlobals();
  gui.Update();
  gui.Show();
  t.Show();
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

class T
{
  GUIElementGroup values;
  T(GUIElementGroup group)
  {
    values = group;
  }
  
  void Show()
  {
     fill(values.GetVec(2).x,values.GetVec(2).y,255);
     circle(400,400,100);
  }
}
