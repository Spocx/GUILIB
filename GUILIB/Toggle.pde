class Toggle extends GUIElement
{
  boolean toggled = false;
  ToggleKnob knob;
  Toggle(PVector _pos, float _w, float _h)
  {
    super(_pos, _w, _h);
    textLines = 1;
    knob = new ToggleKnob(new PVector(pos.x, pos.y), _h);
  }

  Boolean GetValue()
  {
    return toggled;
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
    knob.Update();

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

  void Show()
  {
    fill(style.elementBGColor);
    rect(pos.x, pos.y, w, h, 10);
    if (knob.pos.x-pos.x > 5)
    {
      fill(style.elementColor);
      rect(pos.x, pos.y, knob.pos.x-pos.x+knob.w/2, h, 10);
    }
    knob.SetButtonFill();
    rect(knob.pos.x, knob.pos.y, knob.w, knob.w, 10);
    fill(style.textColor);
    SetTextOffset();
    text(ID, pos.x+textOffset.x, pos.y+textOffset.y);
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
  float w;
  ToggleKnob(PVector _pos, float _w)
  {
    super(_pos);
    w = _w;
  }

  void CheckHover()
  {
    if (mousepos.x < pos.x+w && mousepos.x > pos.x && mousepos.y > pos.y && mousepos.y < pos.y+w)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
