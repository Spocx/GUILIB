class Selector extends GUIElement
{
  int selection = 0;
  String[] options;
  SelectorButton leftButton;
  SelectorButton rightButton;
  Selector(PVector _pos, float _w, float _h, String[] _options)
  {
    super(_pos, _w, _h);
    textLines = 0;
    options = _options;
    leftButton = new SelectorButton(new PVector(_pos.x, _pos.y), _h, _h);
    rightButton = new SelectorButton(new PVector(_pos.x+_w-_h, _pos.y), _h, _h);
  }

  Selector(float _w, float _h, String[] _options)
  {
    super(_w, _h);
    textLines = 0;
    options = _options;
    leftButton = new SelectorButton(new PVector(pos.x, pos.y), _h, _h);
    rightButton = new SelectorButton(new PVector(pos.x+_w-_h, pos.y), _h, _h);
  }

  void Update()
  {
    leftButton.Update(parent);
    rightButton.Update(parent);

    if (leftButton.pressreleased)
    {
      selection--;
    }
    if (rightButton.pressreleased)
    {
      selection++;
    }
    selection = constrain(selection, 0, options.length-1);
  }

  void SetPosition(float x, float y)
  {
    float xoff = x - pos.x;
    float yoff = y - pos.y;

    pos.x += xoff;
    pos.y += yoff;
    leftButton.pos.x += xoff;
    leftButton.pos.y += yoff;
    rightButton.pos.x += xoff;
    rightButton.pos.y += yoff;
  }

  void Show(PGraphics window)
  {
    //self
    window.fill(style.elementColor);
    window.rect(pos.x+h, pos.y, w-h*2, h);

    //buttons
    leftButton.SetButtonFill(window);
    window.rect(leftButton.pos.x, leftButton.pos.y, leftButton.w, leftButton.h);
    rightButton.SetButtonFill(window);
    window.rect(rightButton.pos.x, rightButton.pos.y, rightButton.w, rightButton.h);

    //text
    window.fill(style.elementBGColor);
    window.textAlign(CENTER, CENTER);
    window.text(options[selection], pos.x+w/2, pos.y+h/2);
    window.text("<", pos.x+h/2, pos.y+h/2);
    window.text(">", pos.x+w-h/2, pos.y+h/2);
  }

  void SetValue(Object v)
  {
    String val = (String)v;
    for (int i = 0; i < options.length; i++)
    {
      if (options[i].equals(val))
      {
        selection = i;
      }
    }
  }

  Integer GetValue()
  {
    return selection;
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
    case "value":
      return selection;

    case "valueName":
      return options[selection];

    default:
      return selection;
    }
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: Selector");
    println("  -value : " + selection);
    println();
  }
}

class SelectorButton extends GUIButton
{
  float w, h;
  SelectorButton(PVector _pos, float _w, float _h)
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
