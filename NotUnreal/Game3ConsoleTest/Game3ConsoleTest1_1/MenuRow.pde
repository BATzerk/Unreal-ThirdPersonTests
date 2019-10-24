class MenuRow {
  boolean isHighlighted;
  String rowStr;
  String interactFuncStr;
  float x,y;
  
  MenuRow(String _rowStr, String _funcStr) {
    this.rowStr = _rowStr;
    this.interactFuncStr = _funcStr;
  }
  
  void SetIsHighlighted(boolean val) {
    this.isHighlighted = val;
  }
  
  
  
  void Draw() {
    String displayStr = "";
    if (isHighlighted) { displayStr += ">"; }
    else { displayStr += "  "; }
    displayStr += rowStr;
    text(displayStr, x,y);
  }
  
}
