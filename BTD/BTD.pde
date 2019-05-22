World world;
public static final int WORLD_WIDTH=20;
public static final int WORLD_HEIGHT=20;
public static int[][] pathFindingMap;
void setup(){
  fullScreen();
  world = new World();
}
void draw(){
  world.tick();
}
void mouseClicked(){
  world.onMouseClick();
}

public boolean isValidCoord(int x, int y){
  
  if(0 <= x && x < WORLD_WIDTH && 0 <= y && y < WORLD_HEIGHT){
    if(!(pathFindingMap[y][x]==-1))
      return true;
  }
  
  return false;
}
