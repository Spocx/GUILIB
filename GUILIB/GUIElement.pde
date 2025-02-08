class GUIElement
{
  PVector pos;
  float w, h;
  String ID;
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

  void Update() {
  };
  void Show() {
  };
  Object GetValue() {
    return 0;
  };
  void PrintDebug() {
  };
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
