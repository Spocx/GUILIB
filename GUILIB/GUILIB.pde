color bgc;
PVector mousepos = new PVector(0, 0);
GUI gui;
StyleSetting style;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  bgc = color(100, 30, 10);
  style = new StyleSetting();
  gui = new GUI();

  Slider s = new Slider(new PVector(100, 100), 200, 20, new PVector(20, 200), 0.5); 
  gui.AddElement(s,"slider1");
  MinMaxSlider s2 = new MinMaxSlider(new PVector(100, 140), 200, 20, new PVector(0, 100), 0.5, 0.7);
  gui.AddElement(s2, "Slider2");
}

void draw()
{
  background(bgc);

  UpdateGlobals();

  gui.Update();
  gui.Show();
}
