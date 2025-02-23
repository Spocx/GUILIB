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

  PlotPoint(float _w, float _h, PVector _mmx, PVector _mmy, float startX, float startY)
  {
    super(_w, _h);
    mmx = _mmx;
    mmy = _mmy;
    knob = new PlotPointKnob(new PVector(pos.x, pos.y));
    knob.pos.x = map(startX, 0, 1, pos.x+borderMargin, pos.x+w);
    knob.pos.y = map(startY, 0, 1, pos.y, pos.y+h-borderMargin);
  }

  void Show(PGraphics window)
  {
    DrawBG(window);
    DrawBorders(window);
    DrawKnob(window);
    DrawValue(window);
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

  void DrawValue(PGraphics window)
  {
    window.fill(style.textColor);
    SetTextOffset(window);
    valueText = ID + ":\n" + "(" + nf(GetValue().x, 0, 2)+", "+nf(GetValue().y, 0, 2)+")";
    window.text(valueText, pos.x+textOffset.x, pos.y+textOffset.y);
  }

  void SetValue(String valueID, Object v)
  {
    float val = (float)v;

    switch(valueID)
    {
    case "xMin":
      mmx.x = val;
      break;

    case "xMax":
      mmx.y = val;
      break;

    case "yMin":
      mmy.x = val;
      break;

    case "yMax":
      mmy.y = val;
      break;

    case "x":
      knob.pos.x = map(val, mmx.x, mmx.y, pos.x+borderMargin, pos.x+w);
      knob.pos.x = constrain(knob.pos.x, pos.x+borderMargin, pos.x+w);
      break;

    case "y":
      knob.pos.y = map(val, mmy.x, mmy.y, pos.y, pos.y+h-borderMargin);
      knob.pos.y = constrain(knob.pos.y, pos.y, pos.y+h-borderMargin);
      break;
    }
  }

  void DrawKnob(PGraphics window)
  {
    knob.SetButtonFill(window);
    window.circle(knob.pos.x, knob.pos.y, knob.r);
  }

  void DrawBG(PGraphics window)
  {
    window.fill(style.elementBGColor);
    float ww = w-borderMargin;
    float hh = h-borderMargin;
    for (int i = 0; i < 10; i++)
    {
      window.rect(pos.x+borderMargin-2+ww/10*i+w/10, pos.y, 1, h);
      window.rect(pos.x, pos.y+hh/10*i, w, 1);
    }
  }

  void DrawBorders(PGraphics window)
  {
    window.fill(style.elementColor);
    window.rect(pos.x, pos.y, 5, h);
    window.rect(pos.x, pos.y+h-5, w, 5);
  }

  void Update()
  {
    knob.Update(parent);
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

  PVector GetValue()
  {
    return new PVector(map(knob.pos.x, pos.x+borderMargin, pos.x+w, mmx.x, mmx.y), map(knob.pos.y, pos.y, pos.y+h-borderMargin, mmy.y, mmy.x));
  }

  Object GetValue(String ID)
  {
    switch(ID)
    {
    case "value":
      return new PVector(map(knob.pos.x, pos.x+borderMargin, pos.x+w, mmx.x, mmx.y), map(knob.pos.y, pos.y, pos.y+h-borderMargin, mmy.y, mmy.x));

    case "x":
      return map(knob.pos.x, pos.x+borderMargin, pos.x+w, mmx.x, mmx.y);

    case "y":
      return map(knob.pos.y, pos.y, pos.y+h-borderMargin, mmy.y, mmy.x);

    default:
      return new PVector(map(knob.pos.x, pos.x+borderMargin, pos.x+w, mmx.x, mmx.y), map(knob.pos.y, pos.y, pos.y+h-borderMargin, mmy.y, mmy.x));
    }
  }
}

class PlotPointKnob extends GUIButton
{
  float r = 10;

  PlotPointKnob(PVector _pos)
  {
    super(_pos);
  }

  void CheckHover()
  {
    if (PVector.sub(mousepos, new PVector(realx,realy)).mag() < r/2)
    {
      hover = true;
    } else
    {
      hover = false;
    }
  }
}
