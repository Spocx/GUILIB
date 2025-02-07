color bgc;
GUI gui;
//temp
boolean keyDown = false;

void setup()
{
  size(1280, 720);
  colorMode(HSB);
  bgc = color(100, 30, 10);
  
  gui = new GUI();
  GUIElement s = gui.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider1"); 
  GUIElement s2 = gui.AddElement(new Slider(new PVector(100, 160), 200, 20, new PVector(0, height), 0.5), "slider2"); 
  GUIElement s3 = gui.AddElement(new MinMaxSlider(new PVector(100, 220), 200, 20, new PVector(0, 100), 0.5, 0.7), "slider3");
  GUIElement p = gui.AddElement(new PlotPoint(new PVector(100, 280), 50, 50, new PVector(0, 100), new PVector(0, 100), 0.5, 0.5), "plotpoint1");
  GUIElement p2 = gui.AddElement(new PlotPoint(new PVector(100, 410), 200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint2");
  GUIElement b = gui.AddElement(new Button(new PVector(400,100),150,40,"print debug"),"button1");
  GUIElement t = gui.AddElement(new Toggle(new PVector(400,200),40,20),"toggle1");
  GUIElement sel = gui.AddElement(new Selector(new PVector(400,240),150,20,new String[]{"apple","banana","kiwi"}),"selector1");


  GUIElementGroup g = gui.CreateElementGroup("group");

  g.AddElement(s);
  g.AddElement(s2);
  g.AddElement(p2);
  g.AddElement(b);
}



void draw()
{
  background(bgc);
  
  
  gui.Update();
  gui.Show();
  
  GUIElementGroup g = gui.GetElementGroup("group");
  
  if(g.GetBool("button1"))
  {
    gui.PrintDebug();
  }
}
