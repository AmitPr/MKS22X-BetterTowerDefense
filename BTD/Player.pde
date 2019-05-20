public class Player extends Tower{
  public Player(int x, int y, float maxHealth){
      super(x,y,maxHealth); 
  }
  public void display(){
    fill(0,255,0);
    rect(width/40 * x,height/40*y,width/20,height/20); 
  }
}
