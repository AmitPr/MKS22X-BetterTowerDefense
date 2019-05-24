public class Effect{
  private float speedMultiplier;
  private float duration;
  private String name;
  public Effect(float speedMult, float duration, String name){
   this.speedMultiplier=speedMult;
   this.duration=duration;
   this.name=name;
  }
  public float getMultiplier(){
     return speedMultiplier; 
  }
  public void reduceDuration(float elapsed){
    duration-=elapsed;
  }
  public boolean isExpired(){
    return duration <=0;
  }
  public String getName(){
    return name;
  }
}
