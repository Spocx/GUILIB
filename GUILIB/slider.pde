class Slider extends GUIElement
{
  PVector minmax;
  float percent = 0.0;
  float tpaddx = 0, tpaddy = 0;
  SliderKnob knob;
  DIRECTION textSide = DIRECTION.LEFT;

  Slider(PVector _pos, float _w, float _h, PVector _minmax, float _startpercent)
  {
    super(_pos,_w,_h);

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
      knob.pos.x = mousepos.x-knob.heldOffset;
      knob.pos.x = constrain(knob.pos.x, pos.x, pos.x+w-knob.w);
      percent = map(knob.pos.x, pos.x, pos.x+w-knob.w, 0, 1);
    }
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
    setKnobFill(knob);
    rect(knob.pos.x, knob.pos.y, knob.w, knob.h);
  }

  void DrawValue()
  {
    fill(style.textColor);
    switch(textSide)
    {
    case UP:
      textAlign(CENTER, BOTTOM);
      tpaddx = w*0.5;
      tpaddy = -5;
      break;

    case DOWN:
      textAlign(CENTER, TOP);
      tpaddx = w*0.5;
      tpaddy = h+5;
      break;

    case RIGHT:
      tpaddx = w+5;
      tpaddy = h/2;
      textAlign(LEFT, CENTER);
      break;

    case LEFT:
      tpaddx = -5;
      tpaddy = h/2;
      textAlign(RIGHT, CENTER);
      break;
    }

    text(nf(GetValue(), 0, 2), pos.x+tpaddx, pos.y+tpaddy);
  }

  void setKnobFill(SliderKnob knob)
  {
    if (knob.held) {
      fill(style.interactableHeldColor);
    } else if (knob.hover) {
      fill(style.interactableHoverColor);
    } else {
      fill(style.interactableColor);
    }
  }

  float GetValue()
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
}


class SliderKnob
{
  PVector pos;
  float w = 10;
  float h;
  float heldOffset = 0;
  boolean hover = false;
  boolean held = false;
  boolean mouseDown = false;

  SliderKnob(PVector _pos, float _h)
  {
    pos = _pos;
    h = _h;
  }

  void Update()
  {
    if (mousepos.x < pos.x+w && mousepos.x > pos.x && mousepos.y > pos.y && mousepos.y < pos.y+h)
    {
      hover = true;
    } else
    {
      hover = false;
    }

    if (mousePressed)
    {
      if (!mouseDown)
      {
        mouseDown = true;
        if ((mouseButton == LEFT) && hover)
        {
          if (!held)
          {
            heldOffset = mousepos.x-pos.x;
            held = true;
          }
        }
      }
    } else
    {
      held = false;
      mouseDown = false;
    }
  }
}
