public class Player extends Tower{
  public int money;
  public Player(int x, int y, int maxHealth){
      super(x,y,maxHealth);
      money=STARTING_MONEY;
      health=STARTING_HEALTH;
  }
  public void display(){
    fill(0,255,0);
    rect(WIDTH/WORLD_WIDTH * x,HEIGHT/WORLD_HEIGHT*y,WIDTH/WORLD_WIDTH*2,HEIGHT/WORLD_HEIGHT*2); 
    text("$"+Integer.toString(money),WIDTH/WORLD_WIDTH * x,HEIGHT/WORLD_HEIGHT*y);
    text("HP: "+Integer.toString(health) +"/"+STARTING_HEALTH,WIDTH/WORLD_WIDTH * x+40,HEIGHT/WORLD_HEIGHT*y);
  }
}
