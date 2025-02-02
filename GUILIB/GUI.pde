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
      group.values[i] = elements.get(group.elementIDS[i]).GetValue();
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
}
