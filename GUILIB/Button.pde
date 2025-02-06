class Button extends GUIElement
{
  ButtonGUIButton button;
  String text = "Button";
  Button(PVector _pos, float _w, float _h, String _t)
  {
    super(_pos, _w, _h);
    text = _t;
    h = _h;
    w = _w;
    button = new ButtonGUIButton(_pos, _w, _h);
  }

  void Update()
  {
    button.Update();
  }

  void Show()
  {
    button.SetButtonFill();
    rect(pos.x, pos.y, w, h,5);
    fill(style.elementBGColor);
    textAlign(CENTER, CENTER);
    text(text, pos.x+w/2, pos.y+h/2);
  }

  Boolean GetValue()
  {
    return button.pressreleased;
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
    if (mousepos.x < pos.x+w && mousepos.x > pos.x && mousepos.y > pos.y && mousepos.y < pos.y+h)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
