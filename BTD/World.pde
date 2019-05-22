class World{
  
  public ArrayList<Tower> towers = new ArrayList<Tower>();
  public ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  public Obstacle[][] map;
  
  public World(){
    pathFindingMap = new int[BTD.WORLD_HEIGHT][BTD.WORLD_WIDTH];
    for(int i = 0; i < BTD.WORLD_HEIGHT; i ++){
      for(int j = 0; i < BTD.WORLD_HEIGHT; i ++){
        pathFindingMap[i][j]=-1;
      }
    }
    map = new Obstacle[BTD.WORLD_HEIGHT][BTD.WORLD_WIDTH]; 
    map[BTD.WORLD_HEIGHT-2][BTD.WORLD_WIDTH-2]=
      map[BTD.WORLD_HEIGHT-1][BTD.WORLD_WIDTH-1]=
      map[BTD.WORLD_HEIGHT-2][BTD.WORLD_WIDTH-1]=
      map[BTD.WORLD_HEIGHT-1][BTD.WORLD_WIDTH-2]=new Player(BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-2,100);
      
    map[0][0]=map[0][1]=map[1][0]=map[1][1]=new EnemyBase(0,0,100);
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
        if(map[y][x]==null)
        if(random(4)<1){
         map[y][x]=new DartTower(x,y,100);
        }
      }
    }
    updatePathFindingMap();
    enemies.add(new Balloon(0,0,1));
    enemies.get(0).setSpeed(4);
  }
  
  public boolean isValidCoord(int x, int y) {return ((0 <= x) && (x < BTD.WORLD_WIDTH) && (0 <= y) && (y < BTD.WORLD_HEIGHT)); }
  
  public boolean updatePathFindingMap(){
    int[][] newPathFindingMap = new int[BTD.WORLD_WIDTH][BTD.WORLD_HEIGHT];
    for(int i = 0; i < BTD.WORLD_WIDTH; i++){
      for(int j = 0; j < BTD.WORLD_HEIGHT; j++){
        newPathFindingMap[i][j]=-1;
      }
    }
    println("starting process");
    pathFindingMap[BTD.WORLD_WIDTH-2][BTD.WORLD_HEIGHT-2]=0;
    pathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-1]=0;
    pathFindingMap[BTD.WORLD_WIDTH-2][BTD.WORLD_HEIGHT-1]=0;
    pathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-2]=0;
    ArrayList<int[]> lastVisitedCoords = new ArrayList<int[]>();
    int[][] playerCoords = {{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-2},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-2}}; 
    lastVisitedCoords.add(playerCoords[0]);
    lastVisitedCoords.add(playerCoords[1]);
    lastVisitedCoords.add(playerCoords[2]);
    lastVisitedCoords.add(playerCoords[3]);
    
    for(int i = 0; i < lastVisitedCoords.size(); i++){
        println(Integer.toString(lastVisitedCoords.get(i)[0])+", "+Integer.toString(lastVisitedCoords.get(i)[1]));
      }
    while(lastVisitedCoords.size()>0){
      ArrayList<int[]> justVisitedCoords = new ArrayList<int[]>();
      for(int[] coords : lastVisitedCoords){
        println("coords[0]:" + coords[0]);
        println("coords[1]:" + coords[1]);
        if(isValidCoord((coords[0]+1),coords[1]) && newPathFindingMap[coords[0]+1][coords[1]] == -1 && (((map[coords[0]+1][coords[1]]==null))||(coords[0]+1<2 && coords[1]<2))){
          println("valid coords:" + (coords[0]+1) + ", " + (coords[1]));
          newPathFindingMap[coords[0]+1][coords[1]] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0]+1,coords[1]};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord((coords[0]-1),coords[1]) && newPathFindingMap[coords[0]-1][coords[1]] == -1 && (((map[coords[0]-1][coords[1]]==null))||(coords[0]-1<2 && coords[1]<2))){
          println("valid coords:" + (coords[0]-1) + ", " + (coords[1]));
          newPathFindingMap[coords[0]-1][coords[1]] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0]-1,coords[1]};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord(coords[0],(coords[1]+1)) && newPathFindingMap[coords[0]][coords[1]+1] == -1 && (((map[coords[0]][coords[1]+1]==null))||(coords[0]<2 && coords[1]+1<2))){
          println("valid coords:" + (coords[0]) + ", " + (coords[1]+1));
          newPathFindingMap[coords[0]][coords[1]+1] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0],coords[1]+1};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord(coords[0],(coords[1]-1)) && newPathFindingMap[coords[0]][coords[1]-1] == -1 && (((map[coords[0]][coords[1]-1]==null))||(coords[0]<2 && coords[1]-1<2))){
          println("valid coords:" + (coords[0]) + ", " + (coords[1]-1));
          newPathFindingMap[coords[0]][coords[1]-1] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0],coords[1]-1};
          justVisitedCoords.add(thisCoord);
        }
      }
      
      lastVisitedCoords = justVisitedCoords;
    }
    if(newPathFindingMap[0][1] == -1 && newPathFindingMap[1][0] == -1 && newPathFindingMap[1][1] == -1){
      println("returning false");
      return false;
    }
    else{
      if(newPathFindingMap[0][1]>0){
        newPathFindingMap[1][0] = newPathFindingMap[1][1] = newPathFindingMap[0][1];
      }
      else if(newPathFindingMap[1][0]>0){
        newPathFindingMap[0][1] = newPathFindingMap[1][1] = newPathFindingMap[1][0];
      }
      else if(newPathFindingMap[1][1]>0){
        newPathFindingMap[0][1] = newPathFindingMap[1][0] = newPathFindingMap[1][1];
      }
      newPathFindingMap[0][0]=newPathFindingMap[0][1]+1;
      for(int i = 0; i < BTD.WORLD_HEIGHT; i ++){
        println(newPathFindingMap[i]);
      }
      pathFindingMap = newPathFindingMap;
      return true;
    }
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
    for(Tower t : towers){
      t.display();
    }
  }
  
  public void onMouseClick(){
    int y = screenToWorldY(mouseY);
    int x = screenToWorldX(mouseX);
    if(map[y][x]==null){
      map[y][x]=new DartTower(x,y,100);
      if(!updatePathFindingMap()){
        map[y][x]=null;
      }
    }else{
     map[y][x]=null; 
    }
  }
  
  public  int screenToWorldX(int x){
    return (int)(x/(float)width*(float)BTD.WORLD_WIDTH);
  }
  
  public  int screenToWorldY(int y){
    return (int)(y/(float)height*(float)BTD.WORLD_HEIGHT);
  }
}
