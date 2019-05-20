World world;
public static final int WORLD_WIDTH=40;
public static final int WORLD_HEIGHT=40;
void setup(){
  fullScreen();
  world = new World();
}
void draw(){
  world.tick();
}
