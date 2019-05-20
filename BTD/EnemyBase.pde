public class EnemyBase extends Tower{
  public EnemyBase(int x, int y, float maxHealth){
      super(x,y,maxHealth); 
  }
  public void display(){
    fill(255,0,0);
    rect(width/BTD.WORLD_WIDTH * x,height/BTD.WORLD_HEIGHT*y,width/BTD.WORLD_WIDTH*2,height/BTD.WORLD_HEIGHT*2); 
  }
}
