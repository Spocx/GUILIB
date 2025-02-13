color bgc;
GUI gui;
boolean keyDown = false;
void setup()
{
  size(1280, 720);
  colorMode(HSB);
  bgc = color(0);

  gui = new GUI();

  GUIWindow w2 = gui.CreateWindow(new GUIWindow(new PVector(100, 100), 500, 600), "window2");

  GUIElement s = (Slider)w2.AddElement(new Slider(200, 20, new PVector(0, width), 0.5), "slider1"); 
  GUIElement s2 = w2.AddElement(new Slider(200, 20, new PVector(0, height), 0.5), "slider2"); 
  GUIElement s3 = w2.AddElement(new MinMaxSlider(200, 20, new PVector(0, 100), 0.5, 0.7), "slider3");
  GUIElement p = w2.AddElement(new PlotPoint(50, 50, new PVector(0, 100), new PVector(0, 100), 0.5, 0.5), "plotpoint1");
  GUIElement p2 = w2.AddElement(new PlotPoint(200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint2");
  GUIElement b = w2.AddElement(new Button(150, 40, "print debug"), "button1");
  GUIElement t = w2.AddElement(new Toggle(40, 20), "toggle1");
  GUIElement sel = w2.AddElement(new Selector(150, 20, new String[]{"apple", "banana", "kiwi"}), "selector1");



  GUIWindow w = gui.CreateWindow(new GUIWindow(new PVector(600, 100), 500, 600), "window");

  GUIElement graph = w.AddElement(new Graph(200, 100, 50, 0, 1, 50, false), "FPS");
  GUIElement s10 = w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider10"); 
  w.AddElement(new PlotPoint(new PVector(100, 410), 200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint20");
  w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider11"); 
  w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider12"); 
  GUIElement b2 = w.AddElement(new Button(new PVector(400, 100), 150, 40, "button 2"), "button2");
  w.AddElement(new MinMaxSlider(new PVector(100, 220), 200, 20, new PVector(0, 100), 0.5, 0.7), "slider34");
  w.AddElement(new Toggle(new PVector(400, 200), 80, 20), "toggle2");
  w.AddElement(new Toggle(new PVector(400, 200), 40, 20), "toggle3");
  w.AddElement(new PlotPoint(new PVector(100, 410), 100, 100, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint22");
  w.AddElement(new PlotPoint(new PVector(100, 410), 150, 150, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint21");







  GUIElementGroup g = gui.CreateElementGroup("group");

  g.AddElement(s);
  g.AddElement(s2);
  g.AddElement(s3);
  g.AddElement(p2);
  g.AddElement(b);

  g.AddElement(s10);
  g.AddElement(b2);
  g.AddElement(graph);
  g.AddElement(sel);
  g.AddElement(t);
}



void draw()
{
  background(bgc);




  GUIWindow w = gui.GetWindow("window");
  if (mousePressed && mouseButton == RIGHT)
  {

    //w.pos.x = mouseX;
    // w.pos.y = mouseY;
  }

  GUIElementGroup g = gui.GetElementGroup("group");
  g.SetValue("FPS", frameRate);
  if (g.GetBool("button1"))
  {
    g.SetValue("plotpoint2", "xMin", 400.0);
    gui.PrintDebug();
  }

  gui.Update();
  gui.Show();
}
