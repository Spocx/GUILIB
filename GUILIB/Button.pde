class Button extends GUIElement
{
  ButtonGUIButton button;
  String text = "Button";

  Button(PVector _pos, float _w, float _h, String _t)
  {
    super(_pos, _w, _h);
    textLines = 0;
    text = _t;
    button = new ButtonGUIButton(pos, _w, _h);
  }

  Button(float _w, float _h, String _t)
  {
    super(_w, _h);
    textLines = 0;
    text = _t;
    button = new ButtonGUIButton(pos, _w, _h);
  }

  void Update()
  {
    button.Update(parent);
  }

  void Show(PGraphics window)
  {
    button.SetButtonFill(window);
    window.rect(pos.x, pos.y, w, h, 5);
    window.fill(style.elementBGColor);
    window.textAlign(CENTER, CENTER);
    window.text(text, pos.x+w/2, pos.y+h/2);
  }

  void SetValue(Object v)
  {
    text = (String)v;
  }

  Boolean GetValue()
  {
    return button.pressreleased;
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
    case "value":
      return button.pressreleased;

    case "pressed":
      return button.pressed;

    case "released":
      return button.released;

    case "held":
      return button.held;

    case "hover":
      return button.hover;

    default:
      return button.pressreleased;
    }
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: Button");
    println("  -text : " + text);
    println();
  }
}

class ButtonGUIButton extends GUIButton
{
  float w, h;
  ButtonGUIButton(PVector _pos, float _w, float _h)
  {
    super(_pos);
    w = _w;
    h = _h;
  }

  void CheckHover()
  {
    if (mousepos.x < realx+w && mousepos.x > realx && mousepos.y > realy && mousepos.y < realy+h)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
