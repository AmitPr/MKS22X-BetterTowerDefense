
World world;
Player player;
public static final int WORLD_WIDTH=20;
public static final int WORLD_HEIGHT=20;
public static final float SELL_RATIO=0.8;
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
  if(0 <= x && x < BTD.WORLD_WIDTH && 0 <= y && y < BTD.WORLD_HEIGHT){
    return true;
  }
  return false;
}
