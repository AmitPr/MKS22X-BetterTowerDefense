abstract class Tower extends Obstacle {
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
    timeTillNextFire-=1/frameRate;
      println(timeTillNextFire);
    if(timeTillNextFire<=0){
      float minSquareDist = Float.MAX_VALUE;
      Enemy closest=null;
      for(Enemy e : world.enemies){
        float squareDist=abs(pow((e.getX()-x),2)+pow((e.getY()-y),2));
        if(squareDist<minSquareDist){
           closest=e;
           minSquareDist=squareDist;
        }
      }
      if(minSquareDist <= 100)
        fire(closest); 
       timeTillNextFire=0.5;
    }
    rect(width/BTD.WORLD_WIDTH * x,height/BTD.WORLD_HEIGHT*y,width/BTD.WORLD_WIDTH,height/BTD.WORLD_HEIGHT);
  }
  public void fire(Enemy e){
    Dart d = new Dart(this,e);
    world.bullets.add(d);
  }
}
