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

  void AddElement(GUIElement element, String identifier)
  {
    elements.add(element);
    element.ID = identifier;
  }

  void CreateElementGroup(String identifier)
  {
    elementGroups.add(new GUIElementGroup(identifier));
  }

  void AddToElementGroup(GUIElement element, String groupID)
  {
    for (int i = 0; i < elementGroups.size(); i++)
    {
      GUIElementGroup group = elementGroups.get(i); 
      if (group.ID == groupID)
      {
        for (int j = 0; j < elements.size(); j++)
        {
          if (elements.get(j) == element)
          {
            group.add(element);
          }
        }
      }
    }
  }

  GUIElementGroup GetElementGroup(String identifier)
  {
     for(int i = 0; i < elementGroups.size(); i++)
     {
        if(elementGroups.get(i).ID == identifier)
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
  
  float   GetFloat (int elementIndex){return (float)  get(elementIndex).GetValue(); }
  int     GetInt   (int elementIndex){return (int)    get(elementIndex).GetValue(); }
  boolean GetBool  (int elementIndex){return (boolean)get(elementIndex).GetValue(); }
  String  GetString(int elementIndex){return (String) get(elementIndex).GetValue(); }
  byte    GetByte  (int elementIndex){return (byte)   get(elementIndex).GetValue(); }
  char    GetChar  (int elementIndex){return (char)   get(elementIndex).GetValue(); }
  color   GetColor (int elementIndex){return (color)  get(elementIndex).GetValue(); }
  double  GetDouble(int elementIndex){return (double) get(elementIndex).GetValue(); }
  long    GetLong  (int elementIndex){return (long)   get(elementIndex).GetValue(); }

  void PrintDebug()
  {
    println("------------groupname: "+ ID + "----------------");
    print("connected elements");
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
