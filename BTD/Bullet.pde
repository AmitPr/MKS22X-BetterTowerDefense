abstract class Bullet{
  int damage;
  int damagePerEnemy;
  float speed;
  float x;
  float y;
  float dx;
  float dy;
  float radians;
  Tower parent;
  public Bullet(Tower parent, Enemy target){
    this.parent = parent;
    this.x=parent.getX();
    this.y=parent.getY();
    float ex = target.getX();
    float ey = target.getY();
    this.radians= atan2(ey-y,ex-x);
    this.dx = cos(radians);
    this.dy = sin(radians);
  }
  public void display(){
    x+=dx*speed;
    y+=dy*speed;
    damageCheck();
    if(damage<=0){
      world.bullets.remove(this);
      return;
    }
    int screenX = (int)(width/WORLD_WIDTH*x);
    int screenY = (int)(height/WORLD_HEIGHT*y);
    pushMatrix();
    translate(screenX,screenY);
    rotate(radians);
    translate(-screenX,-screenY);
    fill(0);
    rect(screenX,screenY,(width/WORLD_WIDTH*0.1),(height/WORLD_HEIGHT*0.1));
    popMatrix();
  }
  private void damageCheck(){
    float minSquareDist = Float.MAX_VALUE;
    Enemy closest=null;
    for(Enemy e : world.enemies){
      float squareDist=abs(pow((e.getX()-x),2)+pow((e.getY()-y),2));
      if(squareDist<minSquareDist){
         closest=e;
         minSquareDist=squareDist;
      }
    }
    if(minSquareDist<=1){
       int toDamage = damagePerEnemy<damage?damagePerEnemy:damage;
       closest.damage(toDamage); 
       damage-=toDamage;
    }
  }
  
}
