abstract class Obstacle{
  float health;
  float maxHealth;
  int x;
  int y;
  
  public Obstacle(int x, int y, float maxHealth){
    this.x=x;
    this.y=y;
    this.maxHealth=maxHealth;
  }
  public void display(){
  }
  public int getX(){return x;}
  public void setX(int x){this.x=x;}
  public int getY(){return y;}
  public void setY(int y){this.y=y;}
  public float getHealth(){return health;}
  public void setHealth(float health){this.health=health;}
  public float getMaxHealth(){return maxHealth;}
  public void setMaxHealth(float maxHealth){this.maxHealth=maxHealth;}
  public void damage(float damageAmount){
   this.health-=damageAmount; 
  }
}
