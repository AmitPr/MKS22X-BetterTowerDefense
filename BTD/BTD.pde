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
public static final int[] balloonHealths = new int[]{1,2,3,4,5,50};
public static final int[] balloonSpeeds = new int[]{8,6,5,4,3,16};
public static final int[][] balloonCols = new int[][]{{255,0,0},{0,0,255},{0,255,0},{255,211,0},{255,0,90},{255,0,255}};
public static final int MOAB_START_INDEX=5;
public static final float[] balloonRadiiAsPercent = new float[]{0.7,0.7,0.7,0.7,0.7,1};
public static final int REGEN_TICKCOUNT =120;
public static PShape enemy;
public String currentSelection;
void setup(){
  fullScreen(P2D);
  frameRate(60);
  HEIGHT=height>width?width:height;
  WIDTH=height>width?width:height;
  enemy = createShape(ELLIPSE,0,0,WIDTH/WORLD_WIDTH/2,HEIGHT/WORLD_HEIGHT/2);
  enemy.setStroke(false);
  world = new World();
  currentSelection = "Dart Tower";
}
void draw(){
  if(!world.isDead){
    world.tick();
    if(world.fast){
      world.tick();
    }
  }
  if(height > width){
    fill(0);
    rect(0,width,height-width,width);
  }else{
    fill(0);
    rect(height,0,width-height,height);
    float uiWidth = width-height;
    fill(255);
    textSize(uiWidth/16);
    text("Tower Info",WIDTH+(uiWidth/2)-(textWidth("Tower Info")/2),height/20);
    stroke(255,255,255);
    //rect(WIDTH+(uiWidth/10),height/18,width-(uiWidth/10),height/10);
    line(WIDTH+(uiWidth/10),height/15,width-(uiWidth/10),height/15);
    line(WIDTH+(uiWidth/10),height/15,WIDTH+(uiWidth/10),height/2.5);
    line(width-(uiWidth/10),height/15,width-(uiWidth/10),height/2.5);
    line(WIDTH+(uiWidth/10),height/2.5,width-(uiWidth/10),height/2.5);
    textSize(uiWidth/20);
    text(currentSelection,WIDTH+(uiWidth/2)-(textWidth(currentSelection)/2),height/10);
    noStroke();
    switch(currentSelection){
      case "Dart Tower":
      break;
      default:
      break;
    }
  }
}
void mouseClicked(){
  if(mouseX<WIDTH&&mouseY<HEIGHT)
    world.onMouseClick();
}
