class Slider extends GUIElement
{
  PVector minmax;
  float percent = 0.0;
  float tpaddx = 0, tpaddy = 0;
  SliderKnob knob;
  Boolean showAsInt = false;

  Slider(PVector _pos, float _w, float _h, PVector _minmax, float _startpercent)
  {
    super(_pos, _w, _h);

    minmax = _minmax;
    knob = new SliderKnob(new PVector(pos.x, pos.y), h);
    percent = _startpercent;
    knob.pos.x = pos.x+percent*(super.w-knob.w);
  }

  Slider(float _w, float _h, PVector _minmax, float _startpercent)
  {
    super(_w, _h);

    minmax = _minmax;
    knob = new SliderKnob(new PVector(pos.x, pos.y), h);
    percent = _startpercent;
    knob.pos.x = pos.x+percent*(super.w-knob.w);
  }

  void Show(PGraphics window)
  {
    DrawBG(window);
    DrawFG(window);
    DrawKnob(window);
    DrawValue(window);
  }

  void Update()
  {
    knob.Update(parent);
    if (knob.held)
    {
      knob.pos.x = mousepos.x-knob.heldOffsetX;
      knob.pos.x = constrain(knob.pos.x, pos.x, pos.x+w-knob.w);
      percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
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

  void SetShowInt(boolean asInt)
  {
    showAsInt = asInt;
  }

  void DrawBG(PGraphics window)
  {
    window.fill(style.elementBGColor);
    window.rect(pos.x, pos.y, w, h);
  }

  void DrawFG(PGraphics window)
  {
    window.fill(style.elementColor);
    if (percent > 0)
    {
      window.rect(pos.x, pos.y, w*percent, h);
    }
  }

  void DrawKnob(PGraphics window)
  {
    knob.SetButtonFill(window);
    window.rect(knob.pos.x, knob.pos.y, knob.w, knob.h);
  }

  void DrawValue(PGraphics window)
  {
    window.fill(style.textColor);
    SetTextOffset(window);
    if (showAsInt)
    {
      valueText = ID + ":\n"+round(GetValue());
      window.text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
    } else
    {
      valueText = ID + ":\n"+nf(GetValue(), 0, 2);
      window.text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
    }
  }

  Float GetValue()
  {
    return map(percent, 0, 1, minmax.x, minmax.y);
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
    case "value":
      return map(percent, 0, 1, minmax.x, minmax.y);

    case "percent":
      return percent;

    default:
      return map(percent, 0, 1, minmax.x, minmax.y);
    }
  }

  void SetValue(Object v)
  {
    float val = (float)v;
    knob.pos.x = pos.x+map(val, minmax.x, minmax.y, 0, w-knob.w);
    knob.pos.x = constrain(knob.pos.x, pos.x, pos.x+w-knob.w);
    percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
  }

  void SetValue(String valueID, Object v)
  {
    float val = (float)v;
    switch(valueID)
    {
    case "value":
      knob.pos.x = pos.x+map(val, minmax.x, minmax.y, 0, w-knob.w);
      knob.pos.x = constrain(knob.pos.x, pos.x, pos.x+w-knob.w);
      percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
      break;
    case "valueMin":
      minmax.x = val;
      break;

    case "valueMax":
      minmax.y = val;
      break;
    }
  }

  float GetPercent()
  {
    return percent;
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: Slider");
    println("  -value: " + nf(GetValue(), 0, 2));
    println();
  }
}


class SliderKnob extends GUIButton
{
  float w = 10;
  float h;

  SliderKnob(PVector _pos, float _h)
  {
    super(_pos);
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
