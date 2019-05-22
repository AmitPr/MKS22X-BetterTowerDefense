public class Player extends Tower{
  public Player(int x, int y, float maxHealth){
      super(x,y,maxHealth); 
  }
  public void display(int[][] pathfindingMap){
    fill(0,255,0);
    rect(width/WORLD_WIDTH * x,height/WORLD_HEIGHT*y,width/WORLD_WIDTH*2,height/WORLD_HEIGHT*2); 
  }
}
