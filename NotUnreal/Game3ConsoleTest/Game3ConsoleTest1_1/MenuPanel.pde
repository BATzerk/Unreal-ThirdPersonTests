class MenuPanel {
  int currRowIndex;
  MenuRow[] rows;
  
  MenuPanel(MenuRow[] rows) {
    this.rows = rows;
    // Sloppily set row poses.
    for (int i=0; i<this.rows.length; i++) {
      this.rows[i].x = 100;
      this.rows[i].y = 100 + i * 50;
    }
    
    SetCurrRowIndex(0);
  }
  
  void Draw() {
    fill(255);
    textSize(32);
    textAlign(LEFT, TOP);
    
    for (int i=0; i<rows.length; i++) {
      rows[i].Draw();
    }
  }
  
  MenuRow GetCurrRow() {
    return rows[currRowIndex];
  }
  
  void ChangeCurrRowIndex(int delta) {
    int newIndex = currRowIndex + delta;
    if (newIndex < 0) { newIndex += rows.length; }
    if (newIndex >= rows.length) { newIndex -= rows.length; }
    SetCurrRowIndex(newIndex);
  }
  void SetCurrRowIndex(int _index) {
    GetCurrRow().SetIsHighlighted(false);
    currRowIndex = _index;
    GetCurrRow().SetIsHighlighted(true);
  }
  
//  void InteractCurrRow() {
//    rows[currRowIndex].Interact();
//  }
  
  
}
