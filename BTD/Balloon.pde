public class Balloon extends Enemy{
  public Balloon(int x, int y, int bal){
    super( x,  y,  0);
    setHealth(balloonHealths[bal]);
    setSpeed(balloonSpeeds[bal]);
    setRGB(balloonCols[bal]);
  }
  public void damage(int amt){
    super.damage(amt);
    player.money+=amt;
    if(health >0){
      setSpeed(balloonSpeeds[health-1]);
      setRGB(balloonCols[health-1]);
    }
  }
  
}
