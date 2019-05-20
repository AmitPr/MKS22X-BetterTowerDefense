World world;
void setup(){
  fullScreen();
  world = new World();
}
void draw(){
  world.tick();
}
