String page = "MainMenu";
PFont pixelFont;
int xCenter;

void setup() {
  size(1000, 800, P3D);
  xCenter = width / 2;
  pixelFont = createFont("../font/PressStart2P-Regular.ttf", 50);
  textFont(pixelFont);
  smooth();
}

void clickToRenderPage(String thePage, boolean changeTheme, float xPos, float yPos, 
                   float objHalfWidth, float objHalfHeight) {
  if((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) && 
     (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {
      page = thePage;
      if (changeTheme) {
        renderTheme(); 
      }
  }                
}

void mouseClicked() {
  mainMenuMouseClicked();
  settingsPageMouseClicked();
  playGameMouseClicked();
}

void setCamera() {
  camera(mouseX, mouseY, 
    (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void resetCamera() {
  camera();
}

void draw() {
  if(page == "MainMenu") {
    setCamera();
    mainMenu(); 
  } else if(page == "SettingsPage") {
    setCamera();
    settingsPage(); 
  } else if(page == "PlayGame") {
    resetCamera();
    playGame();
  }
}
