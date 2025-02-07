class GUI
{
  ArrayList<GUIElement> elements = new ArrayList<GUIElement>();
  GUIElementGroups elementGroups = new GUIElementGroups();

  GUI()
  {
    style = new StyleSetting();
  }

  void Update()
  {
    UpdateGlobals();
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).Update();
    }
  }

  void Show()
  {
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).Show();
    }
  }

  void SetGlobalTextSide(TEXTSIDE side)
  {
    for (GUIElement e : elements)
    {
      e.SetTextSide(side);
    }
  }

  GUIElement AddElement(GUIElement element, String identifier)
  {
    elements.add(element);
    element.ID = identifier;
    return element;
  }

  GUIElementGroup CreateElementGroup(String identifier)
  {
    GUIElementGroup g = new GUIElementGroup(identifier);
    elementGroups.add(g);
    return g;
  }


  GUIElementGroup GetElementGroup(String identifier)
  {
    for (int i = 0; i < elementGroups.size(); i++)
    {
      if (elementGroups.get(i).ID == identifier)
      {
        return elementGroups.get(i);
      }
    }
    return null;
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

  void PrintDebug()
  {
    println("===============================GUI class===================================");
    println("======================[Elements===========================]");
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).PrintDebug();
    }

    println("[==========================Element groups=====================]");
    for (int i = 0; i < elementGroups.size(); i++)
    {
      elementGroups.get(i).PrintDebug();
    }
  }
}

class GUIElementGroup extends ArrayList<GUIElement>
{
  String ID = "";

  GUIElementGroup(String identifier)
  {
    super();
    ID = identifier;
  }

  float   GetFloat (int elementIndex) {
    return (float)  get(elementIndex).GetValue();
  }
  int     GetInt   (int elementIndex) {
    return int((float)get(elementIndex).GetValue());
  }
  boolean GetBool  (int elementIndex) {
    return (boolean)get(elementIndex).GetValue();
  }
  String  GetString(int elementIndex) {
    return (String) get(elementIndex).GetValue();
  }
  byte    GetByte  (int elementIndex) {
    return (byte)   get(elementIndex).GetValue();
  }
  char    GetChar  (int elementIndex) {
    return (char)   get(elementIndex).GetValue();
  }
  color   GetColor (int elementIndex) {
    return (color)  get(elementIndex).GetValue();
  }
  double  GetDouble(int elementIndex) {
    return (double) get(elementIndex).GetValue();
  }
  long    GetLong  (int elementIndex) {
    return (long)   get(elementIndex).GetValue();
  }
  PVector GetVec   (int elementIndex) {
    return (PVector)get(elementIndex).GetValue();
  }

  float   GetFloat (String elementID) {
    return (float)  GetElementByName(elementID).GetValue();
  }
  int     GetInt   (String elementID) {
    return int((float)GetElementByName(elementID).GetValue());
  }
  boolean GetBool  (String elementID) {
    return (boolean)GetElementByName(elementID).GetValue();
  }
  String  GetString(String elementID) {
    return (String) GetElementByName(elementID).GetValue();
  }
  byte    GetByte  (String elementID) {
    return (byte)   GetElementByName(elementID).GetValue();
  }
  char    GetChar  (String elementID) {
    return (char)   GetElementByName(elementID).GetValue();
  }
  color   GetColor (String elementID) {
    return (color)  GetElementByName(elementID).GetValue();
  }
  double  GetDouble(String elementID) {
    return (double) GetElementByName(elementID).GetValue();
  }
  long    GetLong  (String elementID) {
    return (long)   GetElementByName(elementID).GetValue();
  }
  PVector GetVec   (String elementID) {
    return (PVector)GetElementByName(elementID).GetValue();
  }

  GUIElement GetElementByName(String elementID)
  {
    for (GUIElement e : this)
    {
      if (e.ID.equals(elementID))
      {
        return e;
      }
    }
    return null;
  }

  void AddElement(GUIElement element)
  {
    boolean add = true;
    for (GUIElement e : this)
    {
      if (e == element)
      {
        add = false;
      }
    }
    if (add)
    {
      add(element);
    }
  }

  void AddElements(GUIElement[] elements)
  {
    for (GUIElement tryadd : elements)
    {
      boolean add = true;
      for (GUIElement e : this)
      {
        if (e == tryadd)
        {
          add = false;
        }
      }
      if (add)
      {
        add(tryadd);
      }
    }
  }

  void PrintDebug()
  {
    println("------------groupname: "+ ID + "----------------");
    print("connected elements\n");
    for (GUIElement element : this)
    {
      element.PrintDebug();
    }
    println();
  }
}

class GUIElementGroups extends ArrayList<GUIElementGroup>
{
  GUIElementGroups()
  {
    super();
  }
}

class GUIButton
{
  PVector pos;
  float heldOffsetX = 0;
  float heldOffsetY = 0;
  boolean hover = false;
  boolean held = false;
  boolean mouseDown = false;
  boolean pressed = false;
  boolean released = false;
  boolean pressreleased = false;

  GUIButton(PVector _pos)
  {
    pos = _pos;
  }

  void Update()
  {
    CheckHover();
    UpdateState();
  }

  void CheckHover()
  {
    hover = false;
  }

  void SetButtonFill()
  {
    if (held) {
      fill(style.interactableHeldColor);
    } else if (hover) {
      fill(style.interactableHoverColor);
    } else {
      fill(style.interactableColor);
    }
  }

  void UpdateState()
  {
    if (mousePressed)
    {
      if (!mouseDown)
      {
        mouseDown = true;
        if ((mouseButton == LEFT) && hover)
        {
          if (!held)
          {
            pressed = true;
            heldOffsetX = mousepos.x-pos.x;
            heldOffsetY = mousepos.y-pos.y;
            held = true;
          }
        }
      } else
      {
        pressed = false;
      }
    } else
    {
      if (held)
      {
        if (hover)
        {
          pressreleased = true;
        }
        released = true;
      } else
      {
        pressreleased = false;
        released = false;
      }
      held = false;
      mouseDown = false;
    }
  }
}
