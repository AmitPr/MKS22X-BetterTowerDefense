public class Balloon extends Enemy{
  public Balloon(int x, int y, int bal){
    super( x,  y,  0);
    setHealth(balloonHealths[bal]);
    setSpeed(balloonSpeeds[bal]);
    setRGB(balloonCols[bal]);
  }
  
}