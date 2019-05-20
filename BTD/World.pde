class World{
  public ArrayList<Tower> towers = new ArrayList<Tower>();
  public ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  public Obstacle[][] map;
  
  public World(){
    map = new Obstacle[BTD.WORLD_WIDTH][BTD.WORLD_HEIGHT]; 
    map[38][38]=new Player(38,38,100);
    map[0][0]=new EnemyBase(0,0,100);
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
        if(map[y][x]==null)
        if(random(2)<1){
          if((y<38||x<38)&&(x>2||y>2))
         map[y][x]=new DartTower(x,y,100);
        }
      }
    }
    enemies.add(new Balloon(33,24,1));
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
    background(46,125,50);
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
         if(map[y][x]!=null){
            map[y][x].display(); 
         }
      }
    }
    for(Enemy e : enemies){
      e.display();
    }
  }
}
