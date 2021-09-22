class ScoreManager {
  
  int score = 0;
  int[] highscores = new int[5];
  PImage signImage;
  String file = "scores.txt";
  
  ScoreManager() {
    signImage = loadImage("Assets/Sign.png");
    signImage.resize(193, 100);
    highscores = getHighscores();
  }
  
  void display() {
    image(signImage, 125, 75);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(score, 122, 93);
  }
  
  void updateHighscore() {
    getHighscores();
    setHighscores(score);
    updateScoreFile();
  }
  
  void setHighscores(int newScore) {
    for(int i = 0; i < highscores.length; i++) {
      if(highscores[i] < newScore) {
        for(int j = highscores.length - 1; j > i - 1 && j > 0; j--) {
          highscores[j] = highscores[j - 1];
        }
        highscores[i] = newScore;
        return;
      }
    }
  }
  
  void updateScoreFile() {
    String[] scoresString = new String[highscores.length];
    for(int i = 0; i < scoresString.length; i++)
      scoresString[i] = Integer.toString(highscores[i]);
    saveStrings(file, scoresString);
  }
  
  int[] getHighscores() {
    int[] scoresInt = new int[highscores.length];
    String[] scoresString = readScoreFile();
    for(int i = 0; i < scoresInt.length; i++) {
      if(i >= scoresString.length || scoresString[i] == null)
        scoresInt[i] = 0;
      else
        scoresInt[i] = Integer.parseInt(scoresString[i]);
    }
    return scoresInt;
  }
  
  String[] readScoreFile() {
    String[] scoresString = null;
    scoresString = loadStrings(file);
    if(scoresString != null) {
      return scoresString;
    }
    saveStrings(file, new String[]{"0", "0", "0", "0", "0"});
    scoresString = loadStrings(file);
    if(scoresString != null) {
      println("SCORES FILE DID NOT EXIST OR WAS NOT ACCESSABLE; A NEW FILE HAS BEEN CREATED.");
      return scoresString;
    }
    println("SCORES FILE IS NOT ACCESSABLE.");
    return new String[]{"0", "0", "0", "0", "0"};
  }
}
