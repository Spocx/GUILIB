color bgc;
GUI gui;
//temp
float x = 0;
int b = 0;
boolean keyDown = false;

void setup()
{
  size(1280, 720);
  colorMode(HSB);
  bgc = color(0);

  gui = new GUI();
  GUIElement s = gui.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider1"); 
  GUIElement s2 = gui.AddElement(new Slider(new PVector(100, 160), 200, 20, new PVector(0, height), 0.5), "slider2"); 
  GUIElement s3 = gui.AddElement(new MinMaxSlider(new PVector(100, 220), 200, 20, new PVector(0, 100), 0.5, 0.7), "slider3");
  GUIElement p = gui.AddElement(new PlotPoint(new PVector(100, 280), 50, 50, new PVector(0, 100), new PVector(0, 100), 0.5, 0.5), "plotpoint1");
  GUIElement p2 = gui.AddElement(new PlotPoint(new PVector(100, 410), 200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint2");
  GUIElement b = gui.AddElement(new Button(new PVector(400, 100), 150, 40, "print debug"), "button1");
  GUIElement t = gui.AddElement(new Toggle(new PVector(400, 200), 40, 20), "toggle1");
  GUIElement sel = gui.AddElement(new Selector(new PVector(400, 240), 150, 20, new String[]{"apple", "banana", "kiwi"}), "selector1");

  GUIWindow w = gui.CreateWindow(new GUIWindow(new PVector(700, 100), 500, 600), "window");

  /*
  GUIElement s10 = w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider10"); 
   w.AddElement(new PlotPoint(new PVector(100, 410), 200, 200, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint20");
   w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider11"); 
   w.AddElement(new Slider(new PVector(100, 100), 200, 20, new PVector(0, width), 0.5), "slider12"); 
   GUIElement b2 = w.AddElement(new Button(new PVector(400, 100), 150, 40, "button 2"), "button2");
   w.AddElement(new MinMaxSlider(new PVector(100, 220), 200, 20, new PVector(0, 100), 0.5, 0.7), "slider34");
   w.AddElement(new Toggle(new PVector(400, 200), 80, 20), "toggle2");
   w.AddElement(new Toggle(new PVector(400, 200), 40, 20), "toggle3");
   GUIElement graph = w.AddElement(new Graph(new PVector(0,0),200,100,10,0,100,50),"mouse y position");
   w.AddElement(new PlotPoint(new PVector(100, 410), 150, 150, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint21");
   w.AddElement(new PlotPoint(new PVector(100, 410), 100, 100, new PVector(0, 255), new PVector(0, 255), 0.5, 0.5), "plotpoint22");
   */

  int mmm = 10;
  GUIElement position = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 50, 0, mmm, 0), "position");
  GUIElement speed = w.AddElement(new Graph(new PVector(0, 0), 200, 100,50, 0, mmm, 0), "speed");
  GUIElement acceleration = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 50, 0, mmm, 0), "acceleration");
  GUIElement jerk = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 50, 0, mmm, 0), "jerk");
  GUIElement snap = w.AddElement(new Graph(new PVector(0, 0), 200, 100,50, 0, mmm, 0), "snap");
  GUIElement crackle = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 50, 0, mmm, 0), "crackle");
  GUIElement pop = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 50, 0, mmm, 0), "pop");
  GUIElement FPS = w.AddElement(new Graph(new PVector(0, 0), 200, 100, 100, 0, 0.01, 0), "FPS");
  GUIElementGroup g = gui.CreateElementGroup("group");

  g.AddElement(s);
  g.AddElement(s2);
  g.AddElement(s3);
  g.AddElement(p2);
  g.AddElement(b);
  /*
  g.AddElement(s10);
   g.AddElement(b2);
   g.AddElement(graph);
   */
  g.AddElement(position);
  g.AddElement(speed);
  g.AddElement(acceleration);
  g.AddElement(jerk);
  g.AddElement(snap);
  g.AddElement(crackle);
  g.AddElement(pop);
  g.AddElement(FPS);
}



void draw()
{
  background(bgc);

  gui.Update();
  gui.Show();

  GUIWindow w = gui.GetWindow("window");
  if (mousePressed && mouseButton == RIGHT)
  {
    w.pos.x = mouseX;
    w.pos.y = mouseY;
  }
  
  GUIElementGroup g = gui.GetElementGroup("group");
  x+= 0.1;

    g.SetValue("position", (pow(x,3)+pow(x,2)));
    g.SetValue("speed",(g.GetFloat("position","49")-g.GetFloat("position","48")));
    g.SetValue("acceleration",(g.GetFloat("speed","49")-g.GetFloat("speed","48")));
    g.SetValue("jerk",(g.GetFloat("acceleration","49")-g.GetFloat("acceleration","48")));
    g.SetValue("snap",(g.GetFloat("jerk","49")-g.GetFloat("jerk","48")));
    g.SetValue("crackle",(g.GetFloat("snap","49")-g.GetFloat("snap","48")));
    g.SetValue("pop",(g.GetFloat("crackle","49")-g.GetFloat("crackle","48")));
  
  b++;
  if(b>1)
  {
    b-=1;
    g.SetValue("FPS",frameRate);
  }
  if (g.GetBool("button1"))
  {
    ((Graph)g.GetElementByName("position")).min = 0;
    ((Graph)g.GetElementByName("position")).max = 0;
    
    ((Graph)g.GetElementByName("speed")).min = 0;
    ((Graph)g.GetElementByName("speed")).max = 0;
    
    ((Graph)g.GetElementByName("acceleration")).min = 0;
    ((Graph)g.GetElementByName("acceleration")).max = 0;
    
    ((Graph)g.GetElementByName("jerk")).min = 0;
    ((Graph)g.GetElementByName("jerk")).max = 0;
    
    ((Graph)g.GetElementByName("snap")).min = 0;
    ((Graph)g.GetElementByName("snap")).max = 0;
    
    ((Graph)g.GetElementByName("crackle")).min = 0;
    ((Graph)g.GetElementByName("crackle")).max = 0;
    
    ((Graph)g.GetElementByName("pop")).min = 0;
    ((Graph)g.GetElementByName("pop")).max = 0;
    gui.PrintDebug();
  }
}
