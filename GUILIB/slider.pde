class Slider extends GUIElement
{
  PVector minmax;
  float percent = 0.0;
  float tpaddx = 0, tpaddy = 0;
  SliderKnob knob;
  DIRECTION textSide = DIRECTION.LEFT;
  Boolean showAsInt = false;

  Slider(PVector _pos, float _w, float _h, PVector _minmax, float _startpercent)
  {
    super(_pos, _w, _h);

    minmax = _minmax;
    knob = new SliderKnob(new PVector(pos.x, pos.y), h);
    percent = _startpercent;
    knob.pos.x = pos.x+percent*(super.w-knob.w);
  }

  void Show()
  {
    DrawBG();
    DrawFG();
    DrawKnob();
    DrawValue();
  }

  void Update()
  {
    knob.Update();
    if (knob.held)
    {
      knob.pos.x = mousepos.x-knob.heldOffsetX;
      knob.pos.x = constrain(knob.pos.x, pos.x, pos.x+w-knob.w);
      percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
    }
  }

  void SetShowInt(boolean asInt)
  {
     showAsInt = asInt; 
  }

  void DrawBG()
  {
    fill(style.elementBGColor);
    rect(pos.x, pos.y, w, h);
  }

  void DrawFG()
  {
    fill(style.elementColor);
    if (percent > 0)
    {
      rect(pos.x, pos.y, w*percent, h);
    }
  }

  void DrawKnob()
  {
    knob.SetButtonFill();
    rect(knob.pos.x, knob.pos.y, knob.w, knob.h);
  }

  void DrawValue()
  {
    fill(style.textColor);
    textAlign(LEFT,BOTTOM);
    if(showAsInt)
    {
      text(ID + ": \n"+round(GetValue()), pos.x,pos.y-5);
    }
    else
    {
      text(ID + ": \n"+nf(GetValue(), 0, 2), pos.x,pos.y-5);
    }
  }

  Float GetValue()
  {
    return map(percent, 0, 1, minmax.x, minmax.y);
  }


  float GetPercent()
  {
    return percent;
  }

  void SetTextSide(DIRECTION dir)
  {
    textSide = dir;
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: Slider");
    println("  -value: " + nf(GetValue(), 0, 2));
    println("  -text direction: " + textSide);
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
    if (mousepos.x < pos.x+w && mousepos.x > pos.x && mousepos.y > pos.y && mousepos.y < pos.y+h)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
