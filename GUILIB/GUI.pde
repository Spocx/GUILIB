class GUI
{
  ArrayList<GUIElement> elements = new ArrayList<GUIElement>();
  GUIElementGroups elementGroups = new GUIElementGroups();
  void Update()
  {
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

class GUIKnob
{
  PVector pos;
  float heldOffsetX = 0;
  float heldOffsetY = 0;
  boolean hover = false;
  boolean held = false;
  boolean mouseDown = false;

  GUIKnob(PVector _pos)
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
            heldOffsetX = mousepos.x-pos.x;
            heldOffsetY = mousepos.y-pos.y;
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
