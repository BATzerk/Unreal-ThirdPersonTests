// Game3ConsoleTest
// by Brett Taylor
// started 10/24/2019
// for Playdead's Game3

// Objects
ArrayList currPanels; // pushed and popped to.
MenuPanel panelMain;
MenuPanel panelLights;
// References
MenuPanel currPanel;
// Properties
private color bgColor;



void setup() {
  size(512,512);
  colorMode(HSB);
  
  // Default values.
  SetLights(0);
  
  // Init panels.
  panelMain = new MenuPanel(new MenuRow[]{
    new MenuRow("One", ""),
    new MenuRow("Twoo", ""),
    new MenuRow("3hreeee", ""),
    new MenuRow("Control Lights", "PushPanel_Lights")
  });
  panelLights = new MenuPanel(new MenuRow[]{
    new MenuRow("Back", "PopPanel"),
    new MenuRow("No lights", "SetLights_0"),
    new MenuRow("Some lights", "SetLights_1")
  });
  
  currPanels = new ArrayList();
  // Add first main panel!
  PushPanel(panelMain);
}

void PushPanel(MenuPanel _panel) {
  currPanels.add(_panel);
  currPanel = (MenuPanel) currPanels.get(currPanels.size()-1);
}
void PopPanel() {
  if (currPanels.size() > 1) { // Don't pop the bottommost panel.
    currPanels.remove(currPanels.size()-1);
    currPanel = (MenuPanel) currPanels.get(currPanels.size()-1);
  }
}

void InteractCurrRow() {
  MenuRow currRow = currPanel.GetCurrRow();
  String funcStr = currRow.interactFuncStr;
  if (funcStr == "PopPanel") {
    PopPanel();
  }
  else if (funcStr == "PushPanel_Lights") {
    PushPanel(panelLights);
  }
  else if (funcStr == "SetLights_0") {
    SetLights(0);
  }
  else if (funcStr == "SetLights_1") {
    SetLights(1);
  }
  else {
    println("Oops! FuncStr not recognized: \"" + funcStr + "\"");
  }
}

void SetLights(int index) {
  switch (index) {
    case 0: bgColor = color(0,0, 12); break;
    case 1: bgColor = color(0,0, 100); break;
  }
  println("Set lights: " + index + "   " + bgColor);
}




void draw() {
  background(bgColor);
  
  currPanel.Draw();
}


void keyPressed() {
  if (keyCode == UP) {
    currPanel.ChangeCurrRowIndex(-1);
  }
  else if (keyCode == DOWN) {
    currPanel.ChangeCurrRowIndex(1);
  }
  else if (key == ' ') {
    InteractCurrRow();
  }
}






