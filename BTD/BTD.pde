World world;
public static final int WORLD_WIDTH=20;
public static final int WORLD_HEIGHT=20;
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
