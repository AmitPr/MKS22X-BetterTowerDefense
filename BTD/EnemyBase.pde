public class EnemyBase extends Tower{
  public EnemyBase(int x, int y, float maxHealth){
      super(x,y,maxHealth); 
  }
  public void display(){
    fill(255,0,0);
    rect(width/WORLD_WIDTH * x,height/WORLD_HEIGHT*y,width/WORLD_WIDTH*2,height/WORLD_HEIGHT*2); 
  }
}
