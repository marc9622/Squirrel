import de.bezier.data.sql.*;
import java.util.Collections;

SQLite database;

class ScoreManager {
    
  int score = 0;
  int[] highscores = new int[5];
  PImage signImage;
  String file = "scores.txt";
  HighscoreUpdater highscoreUpdaterThread = new HighscoreUpdater();
  
  ScoreManager(PApplet pApplet) {
    database = new SQLite(pApplet, "scores.sqlite");
    signImage = loadImage("Assets/Sign.png");
    signImage.resize(193, 100);
  }
  
  void display() {
    image(signImage, 125, 75);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(score, 122, 93);
  }
  
  void saveScore(int score) {
    if(database.connect())
      database.query("INSERT INTO Scores (Score) VALUES (" + score + ");");
  }
  
  void getHighscores() {
    ArrayList<Integer> scores = new ArrayList<Integer>();
    if(database.connect())
      database.query("SELECT Score FROM Scores");
    else
      return;
    while(database.next())
      scores.add(database.getInt("Score"));
    getTopScores(scores);
  }
  
  void getTopScores(ArrayList<Integer> scores) {
    for(int i = 0; i < highscores.length; i++) {
      if(scores.size() == 0) {
        highscores[i] = 0;
        continue;
      }
      highscores[i] = Collections.max(scores);
      scores.remove(scores.indexOf(highscores[i]));
    }
  }
  
  class HighscoreUpdater extends Thread {
    void run() {
      saveScore(score);
      getHighscores();
    }
  }
}
