class GUIElement
{
   PVector pos;
   float w, h;
   String ID;
   GUIElement(PVector _pos, float _w, float _h)
   {
      pos = _pos;
      w = _w;
      h = _h;
   }
   
   void Update(){};
   void Show(){};
   Object GetValue() {return 0;};
   void PrintDebug(){};
}
