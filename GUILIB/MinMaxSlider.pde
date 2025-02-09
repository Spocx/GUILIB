class MinMaxSlider extends Slider
{
  SliderKnob knob2;
  float percent2 = 0;
  float tpaddx2 = 0;
  float tpaddy2 = 0;
  MinMaxSlider(PVector _pos, float _w, float _h, PVector _minmax, float _startpercent1, float _startpercent2)
  {
    super(_pos, _w, _h, _minmax, _startpercent1);
    knob2 = new SliderKnob(new PVector(pos.x, pos.y), h);
    percent2 = _startpercent2;
    knob2.pos.x = pos.x+percent2*(w-knob2.w);
  }

  void Update()
  {
    knob.Update();
    knob2.Update();
    if (knob.held)
    {
      knob.pos.x = mousepos.x-knob.heldOffsetX;
      knob.pos.x = constrain(knob.pos.x, pos.x, knob2.pos.x-knob.w);
      percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
    }
    if (knob2.held)
    {
      knob2.pos.x = mousepos.x-knob2.heldOffsetX;
      knob2.pos.x = constrain(knob2.pos.x, knob.pos.x+knob.w, pos.x+w-knob.w);
      percent2 = map(knob2.pos.x, pos.x, pos.x+w-knob2.w, 0, 1);
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
     knob2.pos.x += xoff;
     knob2.pos.y += yoff;
  }

  void DrawFG()
  {
    fill(style.elementColor);
    rect(knob.pos.x, knob.pos.y, knob2.pos.x-knob.pos.x, h);
  }

  void DrawKnob()
  {
    knob.SetButtonFill();
    rect(knob.pos.x, knob.pos.y, knob.w, knob.h);
    knob2.SetButtonFill();
    rect(knob2.pos.x, knob2.pos.y, knob2.w, knob2.h);
  }

  void DrawValue()
  {
    fill(style.textColor);
    SetTextOffset();
    if (showAsInt)
    {
      valueText = ID+":\n"+ round(map(percent, 0, 1, minmax.x, minmax.y)) + " | " + round(map(percent2, 0, 1, minmax.x, minmax.y));
      text(valueText, pos.x+textOffset.x,pos.y+textOffset.y);
    } else
    {
      valueText = ID+":\n"+ nf(map(percent, 0, 1, minmax.x, minmax.y), 0, 2) + " | " + nf(map(percent2, 0, 1, minmax.x, minmax.y), 0, 2);
      text(valueText, pos.x+textOffset.x,pos.y+textOffset.y);
    }
  }

  Float GetValue()
  {
    return map(random(percent, percent2), 0, 1, minmax.x, minmax.y);
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
       case "value":
       return map(random(percent, percent2), 0, 1, minmax.x, minmax.y);
       
       case "min":
       return map(percent,0,1,minmax.x,minmax.y);
       
       case "max":
       return map(percent2,0,1,minmax.x,minmax.y);
       
       default:
       return map(random(percent, percent2), 0, 1, minmax.x, minmax.y);
    }
  }

  float GetPercent()
  {
    return random(percent, percent2);
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: MinMax Slider");
    println("  -min: " + map(percent, 0, 1, minmax.x, minmax.y) + " | max: " + map(percent2, 0, 1, minmax.x, minmax.y));
    println("  -value: " + nf(GetValue(), 0, 2) + " (chosen randomly between minmax)");
    println("  -text direction: " + textSide);
    println();
  }
}
