abstract class Enemy{
  
  private int health;
  private float x;
  private float y;
  private float speed;
  private float r,g,b;
  private int currentDirection;
  private boolean isMoving = false;
  
  public Enemy(float x, float y, int health){
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
  public int getHealth(){return health;}
  public void setHealth(int health){this.health=health;}
  public void setRGB(int r, int g, int b){this.r = r; this.g=g;this.b=b;}
  public void setRGB(int[] rgb){this.r = rgb[0]; this.g=rgb[1];this.b=rgb[2];}
  public void damage(int damageAmount){
   this.health-=damageAmount; 
   if(health<0){
     world.enemies.remove(this);
   }
  }
  public boolean isDead(){
    return getHealth()<=0;
  }
  public void move(int direction){
    //0 is up, 1 is right, 2 is down, 3 is left
    if(!isMoving){
      currentDirection=direction;
    }
    isMoving=true;
    switch(currentDirection){
      case 0: //north
        y-=1/(4*speed);
        break;
      case 1: //east
        x+=1/(4*speed);
        break;
      case 2: //south
        y+=1/(4*speed);
        break;
      case 3: //west
        x-=1/(4*speed);
        break;
      default:
        break;
    } 
    if(abs(round(x)-x) < 0.0001 && abs(round(y)-y)<0.0001){
      isMoving=false;
    }
    if((round(x)==WORLD_WIDTH-1 || round(x)==WORLD_WIDTH-2)&&(round(y)==WORLD_HEIGHT-1 || round(y)==WORLD_HEIGHT-2)){
      player.health-=health;
      world.enemies.remove(this);
    }
  }
  
  public int getDirection(){
    int x_inted = round(x);
    int y_inted = round(y);
    if(x_inted==y_inted && x_inted==0){
      if(pathFindingMap[0][1]==pathFindingMap[1][0]){
        return (int) random(2)+1;
      }
      else{
        if(pathFindingMap[0][1]<pathFindingMap[1][0]){
          return 1;
        }
        return 2;
      }
    }
    ArrayList<Integer> possibleDirecs = new ArrayList<Integer>();
    if(x_inted+y_inted ==1){
      int[] allowedMoves = new int[]{Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE};
      if(isValidCoord(x_inted+1,y_inted)&&pathFindingMap[y_inted][x_inted+1]!=-1){
        allowedMoves[1]=pathFindingMap[y_inted][x_inted+1];
      }
      if(isValidCoord(x_inted-1,y_inted)&&pathFindingMap[y_inted][x_inted-1]!=-1){
        allowedMoves[3]=pathFindingMap[y_inted][x_inted-1];
      }
      if(isValidCoord(x_inted,y_inted+1)&&pathFindingMap[y_inted+1][x_inted+1]!=-1){
        allowedMoves[2]=pathFindingMap[y_inted+1][x_inted];
      }
      if(isValidCoord(x_inted,y_inted-1)&&pathFindingMap[y_inted-1][x_inted+1]!=-1){
        allowedMoves[0]=pathFindingMap[y_inted-1][x_inted];
      }
      int min = min(allowedMoves);
      for(int i = 0; i < 4;i++){
        if(allowedMoves[i]==min){
          possibleDirecs.add(i);
        }
      }
      return possibleDirecs.get((int)(random(possibleDirecs.size())));
    }
    
    int[] allowedMoves = new int[]{Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE,Integer.MAX_VALUE};
    if(isValidCoord(x_inted+1,y_inted) && (world.map[y_inted][x_inted+1]==null || (x+1 >= WORLD_WIDTH-2) && (y >= WORLD_HEIGHT-2))){
      allowedMoves[1]=pathFindingMap[y_inted][x_inted+1];
    }
    if(isValidCoord(x_inted-1,y_inted)&& (world.map[y_inted][x_inted-1]==null || (x-1 >= WORLD_WIDTH-2) && (y >= WORLD_HEIGHT-2))){
      allowedMoves[3]=pathFindingMap[y_inted][x_inted-1];
    }
    if(isValidCoord(x_inted,y_inted+1)&& (world.map[y_inted+1][x_inted]==null || (x >= WORLD_WIDTH-2) && (y+1 >= WORLD_HEIGHT-2))){
      allowedMoves[2]=pathFindingMap[y_inted+1][x_inted];
    }
    if(isValidCoord(x_inted,y_inted-1)&& (world.map[y_inted-1][x_inted]==null || (x >= WORLD_WIDTH-2) && (y-1 >= WORLD_HEIGHT-2))){
      allowedMoves[0]=pathFindingMap[y_inted-1][x_inted];
    }
    int min = min(allowedMoves);
    for(int i = 0; i < 4;i++){
      if(allowedMoves[i]==min){
        possibleDirecs.add(i);
      }
    }
    return possibleDirecs.get((int)(random(possibleDirecs.size())));
  }
  public void display(){
    ellipseMode(RADIUS);
    fill(r,g,b);
    move(getDirection());
    ellipse(width/WORLD_WIDTH*(x+0.5),height/WORLD_HEIGHT*(y+0.5),width/WORLD_WIDTH/2,height/WORLD_HEIGHT/2);
  }
}
