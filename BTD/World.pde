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
    enemies.add(new Balloon(1,0,1));
    enemies.get(0).setSpeed(4);
  }
  private void pathFindingMapHelper(int x, int y, int curMove){
    Integer[][] allCoords = {{x-1,y},{x+1,y},{x,y-1},{x,y+1}}; 
    for(Integer[] coord : allCoords){
      if(isValidCoord(coord[0],coord[1])){
        int newX = coord[0];
        int newY = coord[1];
    //println(curMove + " " + newX + " " + newY + " " + pathFindingMap[newY][newX]);
        if(pathFindingMap[newY][newX]>curMove||pathFindingMap[newY][newX]==0){
          pathFindingMap[newY][newX]=curMove;
          pathFindingMapHelper(newX,newY,curMove+1);
        }
      }
    }
  }
  public boolean updatePathFindingMap(){
    pathFindingMap = new int[BTD.WORLD_HEIGHT][BTD.WORLD_WIDTH];
    for(int i = 0; i < BTD.WORLD_HEIGHT; i++){
      for(int j = 0; j < BTD.WORLD_WIDTH; j++){
        if(map[i][j]!=null)
          pathFindingMap[i][j]=-1;
      }
    }
    pathFindingMapHelper(WORLD_WIDTH-2,WORLD_HEIGHT-2,1);
    pathFindingMap[BTD.WORLD_HEIGHT-2][BTD.WORLD_WIDTH-2]=
    pathFindingMap[BTD.WORLD_HEIGHT-1][BTD.WORLD_WIDTH-1]=
    pathFindingMap[BTD.WORLD_HEIGHT-1][BTD.WORLD_WIDTH-2]=
    pathFindingMap[BTD.WORLD_HEIGHT-2][BTD.WORLD_WIDTH-1]=0;
    /*
    ArrayList<int[]> lastVisitedCoords = new ArrayList<int[]>();
    int[][] playerCoords = {{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-2},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-2}}; 
    lastVisitedCoords.add(playerCoords[0]);
    lastVisitedCoords.add(playerCoords[1]);
    lastVisitedCoords.add(playerCoords[2]);
    
    while(lastVisitedCoords.size()>0){
      ArrayList<int[]> justVisitedCoords = new ArrayList<int[]>();
      for(int[] coords : lastVisitedCoords){
        if(isValidCoord((coords[1]+1),coords[0]) && newPathFindingMap[coords[1]+1][coords[0]] == -1 && (((map[coords[1]+1][coords[0]]==null))||(coords[1]+1<2 && coords[0]<2))){
          newPathFindingMap[coords[1]+1][coords[0]] = newPathFindingMap[coords[1]][coords[0]]+1;
          int[] thisCoord = {coords[1]+1,coords[0]};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord((coords[1]-1),coords[0]) && newPathFindingMap[coords[1]-1][coords[0]] == -1 && (((map[coords[1]-1][coords[0]]==null))||(coords[1]-1<2 && coords[0]<2))){
          println("valid coords:" + (coords[1]-1) + ", " + (coords[0]));
          newPathFindingMap[coords[1]-1][coords[0]] = newPathFindingMap[coords[1]][coords[0]]+1;
          int[] thisCoord = {coords[1]-1,coords[0]};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord(coords[1],(coords[0]+1)) && newPathFindingMap[coords[1]][coords[0]+1] == -1 && (((map[coords[1]][coords[0]+1]==null))||(coords[1]<2 && coords[0]+1<2))){
          println("valid coords:" + (coords[1]) + ", " + (coords[0]+1));
          newPathFindingMap[coords[1]][coords[0]+1] = newPathFindingMap[coords[1]][coords[0]]+1;
          int[] thisCoord = {coords[1],coords[0]+1};
          justVisitedCoords.add(thisCoord);
        }
        if(isValidCoord(coords[1],(coords[0]-1)) && newPathFindingMap[coords[1]][coords[0]-1] == -1 && (((map[coords[1]][coords[0]-1]==null))||(coords[1]<2 && coords[0]-1<2))){
          println("valid coords:" + (coords[1]) + ", " + (coords[0]-1));
          newPathFindingMap[coords[1]][coords[0]-1] = newPathFindingMap[coords[1]][coords[0]]+1;
          int[] thisCoord = {coords[1],coords[0]-1};
          justVisitedCoords.add(thisCoord);
        }
      }
      
      lastVisitedCoords = justVisitedCoords;
    }
    
    if(newPathFindingMap[1][0] == -1 && newPathFindingMap[0][1] == -1 && newPathFindingMap[1][1] == -1){
      println("returning false");
      return false;
    }
    else{
      if(newPathFindingMap[0][1]>0){
        newPathFindingMap[1][0] = newPathFindingMap[1][1] = newPathFindingMap[0][1];
      }
      else if(newPathFindingMap[0][1]>0){
        newPathFindingMap[0][1] = newPathFindingMap[1][1] = newPathFindingMap[1][0];
      }
      else if(newPathFindingMap[1][1]>0){
        newPathFindingMap[0][1] = newPathFindingMap[1][0] = newPathFindingMap[1][1];
      }
      newPathFindingMap[0][0]=newPathFindingMap[0][1]+1;
      pathFindingMap = newPathFindingMap;
      */
      for(int[] line : pathFindingMap){
        for(int i : line){
          String s = i + "";
          if(s.length() == 2){
           s+= " "; 
          }else{
            s+= "  ";
          }
          print(s);
        }
        println();
      }
      return true;
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
