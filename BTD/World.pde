class World{
  public ArrayList<Tower> towers = new ArrayList<Tower>();
  public ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  public Obstacle[][] map;
  
  public World(){
   map = new Obstacle[500][500]; 
  }
  
  public Obstacle[][] getMap(){
    return map;
  }
  public Obstacle objectAt(int x, int y){
   return map[y][x]; 
  }
  public Obstacle objectAt(float x, float y){
   int mx = round(x);
   int my = round(y);
   return map[my][mx];
  }
  public void tick(){
     
  }
}
