class GUIWindow extends GUIElementHolder
{
  
  PVector pos;
  int w, h;
  String identifier;
  PGraphics window;
  int windowmargin = 2;
  WindowButton resizeButton;

  ArrayList<GUIElement> elements = new ArrayList<GUIElement>();

  GUIWindow(PVector _pos, int _w, int _h)
  {
    pos = _pos;
    w = _w;
    h = _h;
    
    resizeButton = new WindowButton(new PVector(w-20,h-20),20,20);
    CreateMask();
  }
  
  void SetSize(int _w, int _h)
  {
     w = _w;
     h = _h;
     CreateMask();
  }

  void CreateMask()
  {
    window = createGraphics(w-windowmargin*2,h-windowmargin*2);
  }

  GUIElement AddElement(GUIElement element, String identifier)
  {
    elements.add(element);
    element.ID = identifier;
    element.parent = this;
    return element;
  }

  GUIElement GetElement(String identifier)
  {
    for (int i = 0; i < elements.size(); i++)
    {
      if (elements.get(i).ID == identifier)
      {
        return elements.get(i);
      }
    }
    return null;
  }

  void Update()
  {
    resizeButton.Update();
    
    if(resizeButton.held)
    {
          int wx = mouseX-(int)pos.x;
          int wy = mouseY-(int)pos.y;
          
          wx = constrain(wx,100,5000);
          wy = constrain(wy,100,5000);
          
          SetSize(wx+(int)resizeButton.heldOffsetX, wy+(int)resizeButton.heldOffsetY);
    }
    float cx = style.windowSpacingMarginX;
    float cy = style.windowSpacingMarginY;
    float biggestx = 0;
    for (GUIElement e : elements)
    {
      if (e.autoPosition)
      {
        if (cy + e.h + e.GetTextHeight() > h-style.windowSpacingMarginY*2)
        {
          cy = style.windowSpacingMarginY;
          cx += biggestx+style.windowElementMarginX;
          biggestx = 0;
        }


        if (e.w > biggestx) {
          biggestx = e.w;
        }

        if (e.GetTextWidth() > biggestx) {
          biggestx = e.GetTextWidth();
        }

        e.SetPosition(cx, cy+ e.GetTextHeight());
        cy += e.h + style.windowElementMarginY+ e.GetTextHeight();
      }
      e.Update();
    }
  }

  void Show()
  {
    noStroke();
    fill(style.windowColor);
    rect(pos.x, pos.y, w, h, style.windowCornerRounding);

    if (style.doElementStroke)
    {
      window.strokeWeight(style.elementStrokeWeight);
      window.stroke(style.elementStrokeColor);
    } else
    {
      window.noStroke();
    }
    window.beginDraw();
    window.clear();
    window.noStroke();
    for (GUIElement e : elements)
    {
      e.Show(window);
    }
    //window.mask(mask);
    window.endDraw();
    image(window,pos.x+windowmargin,pos.y+windowmargin);
    if (style.doWindowStroke)
    {
      strokeWeight(style.windowStrokeWeight);
      stroke(style.windowStrokeColor);
      noFill();
      rect(pos.x, pos.y, w, h, style.windowCornerRounding);
    }
    
    resizeButton.SetButtonFill();
    resizeButton.pos.x = pos.x+w-resizeButton.w;
    resizeButton.pos.y = pos.y+h-resizeButton.h;
    rect(resizeButton.pos.x,resizeButton.pos.y,resizeButton.w,resizeButton.h,0,0,style.windowCornerRounding,0);
    
    if(resizeButton.hover){println("G");}
  }

  void PrintDebug()
  {
    println("------------WindowName: "+ identifier + "----------------");
    println("pos: " + pos.x + "-" + pos.y);
    println("size: " + w + "-" + h);
    println();
    println("---------Elements-----------");
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).PrintDebug();
    }
  }
}

class WindowButton extends GUIButton
{
  float w,h;
   WindowButton(PVector _pos, float _w, float _h)
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
