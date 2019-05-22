abstract class Enemy{
  
  private float health;
  private float x;
  private float y;
  private float speed;
  private float r,g,b;
  private int currentDirection;
  private boolean isMoving = false;
  
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
  public void move(int direction){
    //0 is up, 1 is right, 2 is down, 3 is left
    if(!isMoving){
      currentDirection=direction;
    }
    isMoving=true;
    switch(currentDirection){
      case 0:
        y-=1/(4*speed);
        break;
      case 1:
        x+=1/(4*speed);
        break;
      case 2: 
        y+=1/(4*speed);
        break;
      case 3:
        x-=1/(4*speed);
        break;
      default:
        break;
    } 
    if(abs(round(x)-x) < 0.0001 && abs(round(y)-y)<0.0001){
      isMoving=false;
    }
  }
  public boolean isValidCoord(int x, int y){
    
    if(0 <= x && x < BTD.WORLD_WIDTH && 0 <= y && y < BTD.WORLD_HEIGHT){
      return true;
    }
    
    return false;
  }
  public int getDirection(){
    if(!isMoving){
      int x_inted = round(x);
      println(x_inted);
      int y_inted = round(y);
      println(y_inted);
      ArrayList<Integer> possibleDirecs = new ArrayList<Integer>();
      int minLength = Integer.MAX_VALUE;
      
      if(isValidCoord(x_inted+1,y_inted)&& minLength>pathFindingMap[x_inted+1][y_inted] && pathFindingMap[x_inted+1][y_inted]>-1){
        minLength = pathFindingMap[x_inted+1][y_inted];
      }
      if(isValidCoord(x_inted-1,y_inted)&& minLength>pathFindingMap[x_inted-1][y_inted] && pathFindingMap[x_inted-1][y_inted]>-1){
        minLength = pathFindingMap[x_inted-1][y_inted];
      }
      if(isValidCoord(x_inted,y_inted+1)&& minLength>pathFindingMap[x_inted][y_inted+1] && pathFindingMap[x_inted][y_inted+1]>-1){
        minLength = pathFindingMap[x_inted][y_inted+1];
      }
      if(isValidCoord(x_inted,y_inted-1)&& minLength>pathFindingMap[x_inted][y_inted-1] && pathFindingMap[x_inted][y_inted-1]>-1){
        minLength = pathFindingMap[x_inted][y_inted-1];
      }
      println(minLength);
      
      if(isValidCoord(x_inted,y_inted-1) && pathFindingMap[x_inted][y_inted-1]>-1 && minLength == pathFindingMap[x_inted][y_inted-1]){
        println("case 0");
        possibleDirecs.add(0);
      }
      if(isValidCoord(x_inted+1,y_inted) && pathFindingMap[x_inted+1][y_inted]>-1 && minLength == pathFindingMap[x_inted+1][y_inted]){
        println("case 1");
        possibleDirecs.add(1);
      }
      if(isValidCoord(x_inted,y_inted+1) && pathFindingMap[x_inted][y_inted+1]>-1 && minLength == pathFindingMap[x_inted][y_inted+1]){
        println("case 2");
        possibleDirecs.add(2);
      }
      if(isValidCoord(x_inted-1,y_inted) && pathFindingMap[x_inted-1][y_inted]>-1 && minLength == pathFindingMap[x_inted-1][y_inted]){
        println("case 3");
        possibleDirecs.add(3);
      }
      println(possibleDirecs);
      if(possibleDirecs.size()==0){
         world.enemies.remove(this);
         return -1;
      }
      return possibleDirecs.get((int)(random(possibleDirecs.size())));
    }
    return 0;
  }
  public void display(){
    ellipseMode(RADIUS);
    fill(r,g,b);
    move(getDirection());
    ellipse(width/WORLD_WIDTH*(y+0.5),height/WORLD_HEIGHT*(x+0.5),width/WORLD_WIDTH/2,height/WORLD_HEIGHT/2);
  }
}
