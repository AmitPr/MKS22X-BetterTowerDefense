class Tack extends Bullet{
  int tackNum;
  public Tack (Tower parent, Enemy target,int tacknum){
    super(parent,target);
    this.damage=1;
    this.damagePerEnemy=1;
    speed=0.3;
    this.dx=setDx(tacknum);
    this.dy=setDy(tacknum);
    this.x=parent.x;
    this.y=parent.y;
  }
  private float setDx(int tackNum){
    if(tackNum%4==0){
      return 0.0;
    }
    if(tackNum==1 || tackNum==3){
      return 0.707;
    }
    if(tackNum==5 || tackNum==7){
      return -0.707;
    }
    if(tackNum==2){
      return 1;
    }
    return -1;
  }
  private float setDy(int tackNum){
    if(tackNum%4==2){
      return 0.0;
    }
    if(tackNum==1 || tackNum==7){
      return 0.707;
    }
    if(tackNum==5 || tackNum==3){
      return -0.707;
    }
    if(tackNum==0){
      return 1;
    }
    return -1;
  }
  public float distFromHome(){
    return sqrt((x-parent.x)*(x-parent.x)+(y-parent.y)*(y-parent.y));
  }
  public void display(){
    x+=dx*speed;
    y+=dy*speed;
    super.damageCheck();
    if(damage<=0){
      world.bullets.remove(this);
      return;
    }
    if(x > WORLD_WIDTH || x < 0 || y > WORLD_HEIGHT || y < 0 || distFromHome()>2){
      world.bullets.remove(this);
      return;
    }
    int screenX = (int)(WIDTH/WORLD_WIDTH*x);
    int screenY = (int)(HEIGHT/WORLD_HEIGHT*y);
    pushMatrix();
    translate(screenX,screenY);
    rotate(radians);
    translate(-screenX,-screenY);
    fill(0);
    rect(screenX,screenY,(WIDTH/WORLD_WIDTH*0.1),(HEIGHT/WORLD_HEIGHT*0.1));
    popMatrix();
  }
}