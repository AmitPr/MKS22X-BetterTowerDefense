class Enemy{
  
  private float health;
  private float x;
  private float y;
  private color c;
  private float speed;
  
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
  public void draw(){
    
  }
}
