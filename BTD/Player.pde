public class Player extends Tower{
  public int money;
  public Player(int x, int y, int maxHealth){
      super(x,y,maxHealth);
      money=STARTING_MONEY;
      health=STARTING_HEALTH;
  }
  public void display(){
    fill(0,255,0);
    rect(width/WORLD_WIDTH * x,height/WORLD_HEIGHT*y,width/WORLD_WIDTH*2,height/WORLD_HEIGHT*2); 
    text("$"+Integer.toString(money),width/WORLD_WIDTH * x,height/WORLD_HEIGHT*y);
    text("HP: "+Integer.toString(health) +"/"+STARTING_HEALTH,width/WORLD_WIDTH * x+50,height/WORLD_HEIGHT*y);
  }
}