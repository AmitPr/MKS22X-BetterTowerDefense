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
    if(getHealth()<0){
      return;
    }
    setSpeed(balloonSpeeds[getHealth()]);
    setRGB(balloonCols[getHealth()]);
  }
  
}
