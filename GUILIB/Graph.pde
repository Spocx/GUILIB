class Graph extends GUIElement
{
  float[] pointValues;
  float borderMargin = 5;
  float min;
  float max;
  Graph(PVector _pos, float _w, float _h, int _points, float _startmin, float _startmax, float _startvalue)
  {
    super(_pos, _w, _h); 
    pointValues = new float[_points];
    for (int i = 0; i < _points; i++)
    {
      pointValues[i] = _startvalue;
    }
    min = _startmin;
    max = _startmax;
    textLines = 1;
  }

  void Update() {
  };
  void Show() {
    DrawBG();
    DrawBorders();
    DrawLines();
    DrawValue();
  };

  void DrawLines()
  {
    stroke(style.elementColor);
    strokeWeight(2);
    float ww = w-borderMargin;
    float hh = h-borderMargin;
    for (int i = 0; i < pointValues.length-1; i++)
    {
      line(pos.x+borderMargin-2+ww/(pointValues.length-1)*(i), map(pointValues[i], min, max, pos.y+hh, pos.y), pos.x+borderMargin-2+ww/(pointValues.length-1)*(i+1), map(pointValues[i+1], min, max, pos.y+hh, pos.y));
    }
    noStroke();
  }

  void DrawBG()
  {
    fill(style.elementBGColor);
    float ww = w-borderMargin;
    for (int i = 0; i < pointValues.length-1; i++)
    {
      rect(pos.x+borderMargin-2+ww/(pointValues.length-1)*i+w/(pointValues.length-1), pos.y, 1, h);
    }
  }

  void DrawValue()
  {
    fill(style.textColor);
    SetTextOffset();
    valueText = ID;
    text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
    textAlign(LEFT, TOP);
    text(max, pos.x+5, pos.y);
    textAlign(LEFT, BOTTOM);
    text(min, pos.x+5, pos.y+h-5);
  }

  void DrawBorders()
  {
    fill(style.elementColor);
    rect(pos.x, pos.y, 5, h);
    rect(pos.x, pos.y+h-5, w, 5);
  }

  void SetValue(Object v)
  {
    if ((float)v < min) {
      min = (float)v;
    }
    if ((float)v > max) {
      max = (float)v;
    }
    for (int i = 0; i < pointValues.length; i++)
    {
      if (i <  pointValues.length-1)
      {
        pointValues[i] = pointValues[i+1];
      } else
      {
        pointValues[i] = (float)v;
      }
    }
  };

  Object GetValue() {
    return 0;
  };
  Object GetValue(String ID) {
    switch(ID)
    {
    case "min":
      return min;

    case "max":
      return max;

    default:
      return pointValues[int(ID)];
    }
  };
  void PrintDebug() {
    println("ID: " + ID);
    println("  -type: Graph");
    println("  -min: " + nf(min, 0, 2) + " | max: " + nf(max, 0, 2));
    println("  -point values:");
    for (int i = 0; i < pointValues.length; i++)
    {
      println("     -"+nf(pointValues[i], 0, 2));
    }
    println("  -text direction: " + textSide);
    println();
  };
}
