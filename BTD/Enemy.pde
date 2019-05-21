abstract class Enemy{
  
  private float health;
  private float x;
  private float y;
  private float speed;
  private float r,g,b;
  private float[][] pathfindList;
  
  public Enemy(float x, float y, float health){
    this.x=x;
    this.y=y;
    this.health=health;
    r=g=b=random(255);
  }
  
  public float getX(){return x;}
  public void setX(float x){this.x=x;}
  public float getY(){return y;}
  public void setY(float y){this.y=y;}
  public float getSpeed(){return speed;}
  public void setSpeed(float speed){this.speed=speed;}
  public float getHealth(){return health;}
  public void setHealth(float health){this.health=health;}
  public void damage(float damageAmount){
   this.health-=damageAmount; 
  }
  //A* pathfinding algorithm
  public void pathfind(Obstacle[][] map){
    float G = 1;
    float curX = this.x;
    float curY = this.y;
    float H = abs(curY-map.length)+abs(curX-map[0].length);
    boolean done = false;
    while(!done){
      
    }
  }
  public void display(){
    ellipseMode(RADIUS);
    fill(r,g,b);
    ellipse(width/BTD.WORLD_WIDTH*(x+0.5),height/BTD.WORLD_HEIGHT*(y+0.5),width/BTD.WORLD_WIDTH/2,height/BTD.WORLD_HEIGHT/2);
  }
}
