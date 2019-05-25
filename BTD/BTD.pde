World world;
Player player;
public static final int WORLD_WIDTH=20;
public static final int WORLD_HEIGHT=20;
public static final float SELL_RATIO=0.8;
public static final int STARTING_MONEY=1000;
public static final int STARTING_HEALTH=100;
public static int[][] pathFindingMap;
public static final int[] towerPrices = new int[]{200,20,100};
public static final int[] balloonHealths = new int[]{1,2,3,4};
public static final int[] balloonSpeeds = new int[]{8,6,5,4};
public static final int[][] balloonCols = new int[][]{{255,0,0},{0,0,255},{0,255,0},{255,192,203}};
void setup(){
  fullScreen();
  frameRate(60);
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
