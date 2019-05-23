abstract class Bullet{
  float damage;
  float damagePerEnemy;
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
  void display(){
    x+=dx*speed;
    y+=dy*speed;
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
    Enemy closest;
    for(Enemy e : world.enemies){
      float squareDist=(e.getX()-x)+(e.getY()-y);
      if(squareDist<minSquareDist){
         closest=e;
         minSquareDist=squareDist;
      }
    }
    //if(minSquareDist<
  }
  
}
