abstract class Tower extends Obstacle {
  Bullet bullet;
  float range;
  float RoF;
  float timeTillNextFire;
  float r,g,b;
  public Tower(int x, int y, int maxHealth){
     super(x,y,maxHealth); 
     r = random(255);
     g = random(255);
     b = random(255);
  }
  public void display(){
    fill(r,g,b);
    rect(width/BTD.WORLD_WIDTH * x,height/BTD.WORLD_HEIGHT*y,width/BTD.WORLD_WIDTH,height/BTD.WORLD_HEIGHT);
    //fill(255,255,255);
    
  }
}
