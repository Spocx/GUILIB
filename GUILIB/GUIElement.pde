class GUIElement
{
  PVector pos;
  float w, h;
  String ID;
  String valueText = "";
  boolean autoPosition = true;
  TEXTSIDE textSide = TEXTSIDE.TOP;
  int textLines = 2;
  PVector textOffset = new PVector(0, 0);
  GUIElement(PVector _pos, float _w, float _h)
  {
    pos = _pos;
    w = _w;
    h = _h;
  }
  
  GUIElement(float _w, float _h)
  {
     pos = new PVector(0,0);
     w = _w;
     h = _h;
  }
  
  GUIElement(PVector _pos)
  {
     pos = _pos;
     w = 0;
     h = 0;
  }

  void Update() {};
  void Show() {};
  void SetValue(Object v) {};
  void SetValue(String ID, Object v) {};
  Object GetValue() {return 0;};
  Object GetValue(String ID) {return 0;};
  void PrintDebug() {};
  
  void SetPosition(float x, float y)
  {
    float xoff = x - pos.x;
    float yoff = y - pos.y;

    pos.x += xoff;
    pos.y += yoff;
  };

  void SetTextSide(TEXTSIDE side)
  {
    textSide = side;
  }

  float GetTextWidth() {return textWidth(valueText);};
  float GetTextHeight() {return textLines * style.fontSize;};

  void SetTextOffset()
  {
    switch(textSide)
    {
    case TOP:
      textAlign(LEFT, BOTTOM);
      textOffset.x = 0;
      textOffset.y = -5;
      break;

    case BOTTOM:
      textAlign(LEFT, TOP);
      textOffset.x = 0;
      textOffset.y = h+5;
      break;

    case LEFT:
      textAlign(RIGHT, CENTER);
      textOffset.x = -5;
      textOffset.y = h/2;
      break;

    case RIGHT:
      textAlign(LEFT, CENTER);
      textOffset.x = w+5;
      textOffset.y = h/2;
      break;

    default:
      textAlign(LEFT, BOTTOM);
      textOffset.x = 0;
      textOffset.y = -5;
      break;
    }
  }
}
