World world;
Player player;
public static final int WORLD_WIDTH=20;
public static final int WORLD_HEIGHT=20;
public static int HEIGHT=0;
public static int WIDTH=0;
public static final float SELL_RATIO=0.8;
public static final int STARTING_MONEY=1000;
public static final int STARTING_HEALTH=100;
public static int[][] pathFindingMap;
public static final int[] towerPrices = new int[]{200,20,350,300};
public static final int[] balloonHealths = new int[]{1,2,3,4,50};
public static final int[] balloonSpeeds = new int[]{8,6,5,4,16};
public static final int[][] balloonCols = new int[][]{{255,0,0},{0,0,255},{0,255,0},{255,255,0},{255,0,255}};
public static final float[] balloonRadiiAsPercent = new float[]{0.7,0.7,0.7,0.7,1};
public static PShape enemy;
void setup(){
  fullScreen();
  frameRate(60);
  HEIGHT=height>width?width:height;
  WIDTH=height>width?width:height;
  enemy = createShape(ELLIPSE,0,0,WIDTH/WORLD_WIDTH/2,HEIGHT/WORLD_HEIGHT/2);
  enemy.setStroke(false);
  world = new World();
}
void draw(){
  world.tick();
  if(height > width){
    
  }else{
    fill(0);
    rect(height,0,width-height,height);
  }
}
void mouseClicked(){
  if(mouseX<WIDTH&&mouseY<HEIGHT)
    world.onMouseClick();
}
