class Graph extends GUIElement
{
  float[] pointValues;
  float   borderMargin = 5;
  float   min;
  float   max;
  boolean autoMinMax   = false;

  Graph(PVector _pos, float _w, float _h, int _points, float _startmin, float _startmax, float _startvalue, boolean _autoMinMax)
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
    autoMinMax = _autoMinMax;
  }

  Graph(float _w, float _h, int _points, float _startmin, float _startmax, float _startvalue, boolean _autoMinMax)
  {
    super(_w, _h); 
    pointValues = new float[_points];
    for (int i = 0; i < _points; i++)
    {
      pointValues[i] = _startvalue;
    }
    min = _startmin;
    max = _startmax;
    textLines = 1;
    autoMinMax = _autoMinMax;
  }

  void Show(PGraphics window) {
    DrawBG(window);
    DrawBorders(window);
    DrawLines(window);
    DrawValue(window);
  };

  void DrawLines(PGraphics window)
  {
    window.stroke(style.elementColor);
    window.strokeWeight(2);
    float ww = w-borderMargin;
    float hh = h-borderMargin;
    for (int i = 0; i < pointValues.length-1; i++)
    {
      window.line(pos.x+borderMargin-2+ww/(pointValues.length-1)*(i), map(pointValues[i], min, max, pos.y+hh, pos.y), pos.x+borderMargin-2+ww/(pointValues.length-1)*(i+1), map(pointValues[i+1], min, max, pos.y+hh, pos.y));
    }
    window.noStroke();
  }

  void DrawBG(PGraphics window)
  {
    window.fill(style.elementBGColor);
    float ww = w-borderMargin;
    for (int i = 0; i < pointValues.length-1; i++)
    {
      window.rect(pos.x+borderMargin-2+ww/(pointValues.length-1)*i+w/(pointValues.length-1), pos.y, 1, h);
    }
  }

  void DrawValue(PGraphics window)
  {
    window.fill(style.textColor);
    SetTextOffset(window);
    valueText = ID;
    window.text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
    window.textAlign(LEFT, TOP);
    window.text(max, pos.x+5, pos.y);
    window.textAlign(LEFT, BOTTOM);
    window.text(min, pos.x+5, pos.y+h-5);
  }

  void DrawBorders(PGraphics window)
  {
    window.fill(style.elementColor);
    window.rect(pos.x, pos.y, 5, h);
    window.rect(pos.x, pos.y+h-5, w, 5);
  }

  void SetValue(Object v)
  {
    if ((float)v < min) {
      min = (float)v;
    }
    if ((float)v > max) {
      max = (float)v;
    }


    float mmi=10000000;
    float mma=-10000000;
    for (int i = 0; i < pointValues.length; i++)
    {
      if (i <  pointValues.length-1)
      {
        pointValues[i] = pointValues[i+1];
      } else
      {
        pointValues[i] = (float)v;
      }
      if (autoMinMax)
      {
        if (pointValues[i] < mmi) {
          mmi = pointValues[i];
        }
        if (pointValues[i] > mma) {
          mma = pointValues[i];
        }
      }
    }
    if (autoMinMax)
    {
      min = mmi;
      max = mma;
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
    String pvals = "     -";
    for (int i = 0; i < pointValues.length; i++)
    {
      pvals += ",(" + nf(pointValues[i], 0, 2) + ")";
    }
    println(pvals);
    println();
  };
}
