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
