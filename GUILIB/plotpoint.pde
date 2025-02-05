class PlotPoint extends GUIElement
{
  PVector mmx, mmy;
  float borderMargin = 5;
  PlotPointKnob knob;
  PlotPoint(PVector _pos, float _w, float _h, PVector _mmx, PVector _mmy, float startX, float startY)
  {
    super(_pos, _w, _h);
    mmx = _mmx;
    mmy = _mmy;
    knob = new PlotPointKnob(new PVector(pos.x, pos.y));
    knob.pos.x = map(startX, 0, 1, pos.x+borderMargin, pos.x+w);
    knob.pos.y = map(startY, 0, 1, pos.y, pos.y+h-borderMargin);
  }

  void Show()
  {
    DrawBG();
    DrawBorders();
    DrawKnob();
    DrawValue();
  }

  void DrawValue()
  {
    fill(style.textColor);
    textAlign(LEFT, TOP);
    textSize(16);
    text("(" + nf(GetValue().x, 0, 2)+", "+nf(GetValue().y, 0, 2)+")", pos.x, pos.y+h+5);
  }

  void DrawKnob()
  {
    setKnobFill(knob);
    circle(knob.pos.x, knob.pos.y, knob.r);
  }

  void DrawBG()
  {
    fill(style.elementBGColor);
    float ww = w-borderMargin;
    float hh = h-borderMargin;
    for (int i = 0; i < 10; i++)
    {
      rect(pos.x+borderMargin-2+ww/10*i+w/10, pos.y, 1, h);
      rect(pos.x, pos.y+hh/10*i, w, 1);
    }
  }

  void DrawBorders()
  {
    fill(style.elementColor);
    rect(pos.x, pos.y, 5, h);
    rect(pos.x, pos.y+h-5, w, 5);
  }

  void Update()
  {
    knob.Update();
    if (knob.held)
    {
      knob.pos.x = mousepos.x-knob.heldOffsetX;
      knob.pos.y = mousepos.y-knob.heldOffsetY;
      knob.pos.x = constrain(knob.pos.x, pos.x+borderMargin, pos.x+w);
      knob.pos.y = constrain(knob.pos.y, pos.y, pos.y+h-borderMargin);
    }
  }

  void PrintDebug()
  {
    println("ID: " + ID);
    println("  -type: PlotPoint");
    println("  -min X: " + mmx.x + " | max X: " +mmx.y );
    println("  -min Y: " + mmy.x + " | max Y: " +mmy.y );
    println("  -value: (" + nf(GetValue().x, 0, 2)+", "+nf(GetValue().y, 0, 2)+")");
    println();
  }

  void setKnobFill(PlotPointKnob knob)
  {
    if (knob.held) {
      fill(style.interactableHeldColor);
    } else if (knob.hover) {
      fill(style.interactableHoverColor);
    } else {
      fill(style.interactableColor);
    }
  }

  PVector GetValue()
  {
    return new PVector(map(knob.pos.x, pos.x+borderMargin, pos.x+w, mmx.x, mmx.y), map(knob.pos.y, pos.y, pos.y+h-borderMargin, mmy.y, mmy.x));
  }
}

class PlotPointKnob extends GUIKnob
{
  float r = 10;

  PlotPointKnob(PVector _pos)
  {
    super(_pos);
  }

  void CheckHover()
  {
    if (PVector.sub(mousepos, pos).mag() < r/2)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
