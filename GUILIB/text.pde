class Text extends GUIElement
{
  Text(PVector _pos, String _text)
  {
    super(_pos);
    textLines = 1 + _text.split("/n").length; 
  }
}
