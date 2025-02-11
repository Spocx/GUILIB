class Toggle extends GUIElement
{
  boolean toggled = false;
  ToggleKnob knob;
  Toggle(PVector _pos, float _w, float _h)
  {
    super(_pos, _w, _h);
    textLines = 1;
    knob = new ToggleKnob(new PVector(pos.x, pos.y), _w/2, _h);
  }

  Toggle(float _w, float _h)
  {
    super(_w, _h);
    textLines = 1;
    knob = new ToggleKnob(new PVector(pos.x, pos.y), _w/2, _h);
  }

  Boolean GetValue()
  {
    return toggled;
  }

  void SetValue(Object v)
  {
    toggled = (boolean)v;
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
    case "value":
      return toggled;

    default:
      return toggled;
    }
  }

  void Update()
  {
    knob.Update(parent);

    if (knob.pressreleased)
    {
      toggled = !toggled;
    }

    if (toggled)
    {
      knob.pos.x = lerp(knob.pos.x, pos.x+w-knob.w, 0.4);
    } else
    {
      knob.pos.x = lerp(knob.pos.x, pos.x, 0.4);
    }
  }

  void SetPosition(float x, float y)
  {
    float xoff = x - pos.x;
    float yoff = y - pos.y;

    pos.x += xoff;
    pos.y += yoff;
    knob.pos.x += xoff;
    knob.pos.y += yoff;
  }

  void Show(PGraphics window)
  {
    window.fill(style.elementBGColor);
    window.rect(pos.x, pos.y, w, h, 10);
    if (knob.pos.x-pos.x > 5)
    {
      window.fill(style.elementColor);
      window.rect(pos.x, pos.y, knob.pos.x-pos.x+knob.w/2, h, 10);
    }
    knob.SetButtonFill(window);
    window.rect(knob.pos.x, knob.pos.y, knob.w, knob.h, 10);
    window.fill(style.textColor);
    SetTextOffset(window);
    valueText = ID;
    window.text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: Toggle");
    println("  -value : " + toggled);
    println();
  }
}

class ToggleKnob extends GUIButton
{
  float w, h;
  ToggleKnob(PVector _pos, float _w, float _h)
  {
    super(_pos);
    w = _w;
    h = _h;
  }

  void CheckHover()
  {
    if (mousepos.x < realx+w && mousepos.x > realx && mousepos.y > realy && mousepos.y < realy+w)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
