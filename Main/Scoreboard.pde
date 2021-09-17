class ScoreManager {
  
  int score = 0;
  int[] highscores = new int[5];
  PImage signImage;
  
  ScoreManager() {
    signImage = loadImage("Assets/Sign.png");
    signImage.resize(193, 100);
    highscores = getHighScores();
  }
  
  void display() {
    image(signImage, 125, 75);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(score, 122, 93);
  }
  
  void saveScore() {
    
  }
  
  int[] getHighScores() {
    int[] scoresInt = new int[5];
    String[] scoresString = readScoreFile("scores.txt");
    for(int i = 0; i < scoresInt.length; i++) {
      if(i >= scoresString.length || scoresString[i] == null)
        scoresInt[i] = 0;
      else
        scoresInt[i] = Integer.parseInt(scoresString[i]);
    }
    return scoresInt;
  }
  
  String[] readScoreFile(String file) {
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
