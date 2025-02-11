class GUI
{
  GUIElementGroups elementGroups = new GUIElementGroups();
  ArrayList<GUIWindow> windows = new ArrayList<GUIWindow>();

  String activeWindow = null;

  GUI()
  {
    style = new StyleSetting();
  }

  void Update()
  {
    UpdateGlobals();
    for (GUIWindow w : windows)
    {
      w.Update();
    }
  }

  void Show()
  {
    if (style.doElementStroke)
    {
      strokeWeight(style.elementStrokeWeight);
      stroke(style.elementStrokeColor);
    } else
    {
      noStroke();
    }
    for (GUIWindow w : windows)
    {
      w.Show();
    }
  }

  GUIElementGroup CreateElementGroup(String identifier)
  {
    GUIElementGroup g = new GUIElementGroup(identifier);
    elementGroups.add(g);
    return g;
  }

  GUIWindow CreateWindow(GUIWindow window, String ID)
  {
    windows.add(window);
    window.identifier = ID;
    return window;
  }

  GUIElementGroup GetElementGroup(String identifier)
  {
    for (GUIElementGroup e : elementGroups)
    {
      if (e.ID.equals(identifier))
      {
        return e;
      }
    }
    return null;
  }

  GUIWindow GetWindow(String identifier)
  {
    for (GUIWindow w : windows)
    {
      if (w.identifier.equals(identifier))
      {
        return w;
      }
    }
    return null;
  }

  void PrintDebug()
  {
    println("===============================GUI class===================================");
    println("[==========================Windows=====================]");
    for (int i = 0; i < windows.size(); i++)
    {
      windows.get(i).PrintDebug();
    }

    println("[==========================Element groups=====================]");
    for (int i = 0; i < elementGroups.size(); i++)
    {
      elementGroups.get(i).PrintDebug();
    }
  }
}

class GUIElementHolder extends ArrayList<GUIElement>
{
  GUIElementHolder()
  {
    super();
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

  float   GetFloat (int elementIndex, String valueID) {
    return (float)  get(elementIndex).GetValue(valueID);
  }
  int     GetInt   (int elementIndex, String valueID) {
    return int((float)get(elementIndex).GetValue(valueID));
  }
  boolean GetBool  (int elementIndex, String valueID) {
    return (boolean)get(elementIndex).GetValue(valueID);
  }
  String  GetString(int elementIndex, String valueID) {
    return (String) get(elementIndex).GetValue(valueID);
  }
  byte    GetByte  (int elementIndex, String valueID) {
    return (byte)   get(elementIndex).GetValue(valueID);
  }
  char    GetChar  (int elementIndex, String valueID) {
    return (char)   get(elementIndex).GetValue(valueID);
  }
  color   GetColor (int elementIndex, String valueID) {
    return (color)  get(elementIndex).GetValue(valueID);
  }
  double  GetDouble(int elementIndex, String valueID) {
    return (double) get(elementIndex).GetValue(valueID);
  }
  long    GetLong  (int elementIndex, String valueID) {
    return (long)   get(elementIndex).GetValue(valueID);
  }
  PVector GetVec   (int elementIndex, String valueID) {
    return (PVector)get(elementIndex).GetValue(valueID);
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

  float   GetFloat (String elementID, String valueID) {
    return (float)  GetElementByName(elementID).GetValue(valueID);
  }
  int     GetInt   (String elementID, String valueID) {
    return int((float)GetElementByName(elementID).GetValue(valueID));
  }
  boolean GetBool  (String elementID, String valueID) {
    return (boolean)GetElementByName(elementID).GetValue(valueID);
  }
  String  GetString(String elementID, String valueID) {
    return (String) GetElementByName(elementID).GetValue(valueID);
  }
  byte    GetByte  (String elementID, String valueID) {
    return (byte)   GetElementByName(elementID).GetValue(valueID);
  }
  char    GetChar  (String elementID, String valueID) {
    return (char)   GetElementByName(elementID).GetValue(valueID);
  }
  color   GetColor (String elementID, String valueID) {
    return (color)  GetElementByName(elementID).GetValue(valueID);
  }
  double  GetDouble(String elementID, String valueID) {
    return (double) GetElementByName(elementID).GetValue(valueID);
  }
  long    GetLong  (String elementID, String valueID) {
    return (long)   GetElementByName(elementID).GetValue(valueID);
  }
  PVector GetVec   (String elementID, String valueID) {
    return (PVector)GetElementByName(elementID).GetValue(valueID);
  }

  void SetValue (int elementIndex, Object v)
  {
    get(elementIndex).SetValue(v);
  }

  void SetValue (String elementID, Object v)
  {
    GetElementByName(elementID).SetValue(v);
  }

  void SetValue (int elementIndex, String valueID, Object v)
  {
    get(elementIndex).SetValue(valueID, v);
  }

  void SetValue (String elementID, String valueID, Object v)
  {
    GetElementByName(elementID).SetValue(valueID, v);
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
}

class GUIElementGroup extends GUIElementHolder
{
  String ID = "";

  GUIElementGroup(String identifier)
  {
    super();
    ID = identifier;
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
  float realx, realy;

  GUIButton(PVector _pos)
  {
    pos = _pos;
  }

  void Update(GUIWindow window)
  {
    CheckHover();
    UpdateState();
    realx = pos.x+window.pos.x;
    realy = pos.y+window.pos.y;
  }

  void CheckHover()
  {
    hover = false;
  }

  void SetButtonFill(PGraphics window)
  {
    if (held) {
      window.fill(style.interactableHeldColor);
    } else if (hover) {
      window.fill(style.interactableHoverColor);
    } else {
      window.fill(style.interactableColor);
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
