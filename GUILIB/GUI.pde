class GUI
{
  ArrayList<GUIElement> elements = new ArrayList<GUIElement>();
  ArrayList<GUIValueGroup> valueGroups = new ArrayList<GUIValueGroup>();
  void Update()
  {
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).Update();
    }

    for (int i = 0; i < valueGroups.size(); i++)
    {
      GUIValueGroup group = valueGroups.get(i);
      for (int j = 0; j < group.elementIDS.length; j++)
      {
        group.values[j] = elements.get(group.elementIDS[j]).GetValue();
      }
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

  void CreateValueGroup(String identifier)
  {
    valueGroups.add(new GUIValueGroup(identifier));
  }

  void AddToValueGroup(GUIElement element, String groupID)
  {
    for (int i = 0; i < valueGroups.size(); i++)
    {
      GUIValueGroup group = valueGroups.get(i); 
      if (group.ID == groupID)
      {
        for (int j = 0; j < elements.size(); j++)
        {
          if (elements.get(j) == element)
          {
            group.elementIDS = append(group.elementIDS, j);
            group.values = append(group.values, 0);
          }
        }
      }
    }
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
    println("=======GUI class=======");
    println("===[Elements===]");
    for (int i = 0; i < elements.size(); i++)
    {
      elements.get(i).PrintDebug();
    }

    println("[===ValueGroups===]");
    for (int i = 0; i < valueGroups.size(); i++)
    {
      valueGroups.get(i).PrintDebug();
    }
  }
}

class GUIValueGroup
{
  String ID = "";
  int[] elementIDS = new int[0];
  float[] values = new float[0];

  GUIValueGroup(String identifier)
  {
    ID = identifier;
  }

  void PrintDebug()
  {
    println("groupname: "+ ID);
    print("element IDS:\n");
    for(int i = 0; i < elementIDS.length; i++)
    {
       println("  -"+gui.elements.get(elementIDS[i]).ID); 
    }
    print("values:\n");
    for(int i = 0; i < elementIDS.length; i++)
    {
       println("  -"+nf(values[i],0,2)); 
    }
    println();
  }
}
