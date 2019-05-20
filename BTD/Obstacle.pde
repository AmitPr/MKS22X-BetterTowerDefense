abstract class Obstacle{
  float health;
  float maxHealth;
  public void display(){
    
  }
  public float getHealth(){return health;}
  public void setHealth(float health){this.health=health;}
  public float getMaxHealth(){return maxHealth;}
  public void setMaxHealth(float maxHealth){this.maxHealth=maxHealth;}
  public void damage(float damageAmount){
   this.health-=damageAmount; 
  }
}
