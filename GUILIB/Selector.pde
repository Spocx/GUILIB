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

  void Update()
  {
    leftButton.Update();
    rightButton.Update();

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

  void Show()
  {
    //self
    fill(style.elementColor);
    rect(pos.x+h, pos.y, w-h*2, h);

    //buttons
    leftButton.SetButtonFill();
    rect(leftButton.pos.x, leftButton.pos.y, leftButton.w, leftButton.h);
    rightButton.SetButtonFill();
    rect(rightButton.pos.x, rightButton.pos.y, rightButton.w, rightButton.h);

    //text
    fill(style.elementBGColor);
    textAlign(CENTER, CENTER);
    text(options[selection], pos.x+w/2, pos.y+h/2);
    text("<", pos.x+h/2, pos.y+h/2);
    text(">", pos.x+w-h/2, pos.y+h/2);
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
    if (mousepos.x < pos.x+w && mousepos.x > pos.x && mousepos.y > pos.y && mousepos.y < pos.y+h)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
