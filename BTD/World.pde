class World{
  
  
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
      map[BTD.WORLD_HEIGHT-1][BTD.WORLD_WIDTH-2]=
      player=new Player(BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-2,100);
      
    map[0][0]=map[0][1]=map[1][0]=map[1][1]=new EnemyBase(0,0,100);
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
        if(map[y][x]==null)
        if(random(0)>1){
         map[y][x]=new DartTower(x,y,100);
         
        }
      }
    }
    updatePathFindingMap();
    enemies.add(new Balloon(0,0,1,1));
    enemies.get(0).setSpeed(4);
  }
  
  public boolean updatePathFindingMap(){
    
    int[][] newPathFindingMap = new int[BTD.WORLD_WIDTH][BTD.WORLD_HEIGHT];
    for(int i = 0; i < BTD.WORLD_WIDTH; i++){
      for(int j = 0; j < BTD.WORLD_HEIGHT; j++){
        newPathFindingMap[i][j]=-1;
      }
    }
    
    ArrayList<int[]> lastVisitedCoords = new ArrayList<int[]>();
    int[][] playerCoords = {{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-1},{BTD.WORLD_WIDTH-1,BTD.WORLD_HEIGHT-2},{BTD.WORLD_WIDTH-2,BTD.WORLD_HEIGHT-2}}; 
    lastVisitedCoords.add(playerCoords[0]);
    lastVisitedCoords.add(playerCoords[1]);
    lastVisitedCoords.add(playerCoords[2]);
    lastVisitedCoords.add(playerCoords[3]);
    newPathFindingMap[BTD.WORLD_WIDTH-2][BTD.WORLD_HEIGHT-2]=
    newPathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-1]=
    newPathFindingMap[BTD.WORLD_WIDTH-2][BTD.WORLD_HEIGHT-1]=
    newPathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-2]=0;
    
    //println(pathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-1]);
    while(lastVisitedCoords.size()>0){
      ArrayList<int[]> justVisitedCoords = new ArrayList<int[]>();
      for(int[] coords : lastVisitedCoords){
        
        if((coords[1]==5 && coords[0]==3) && (map[coords[0]][coords[1]]==null)){
          println("our special square");
          println(isValidCoord(coords[1],coords[0]+1) && newPathFindingMap[coords[0]+1][coords[1]] == -1 && (((map[coords[0]+1][coords[1]]==null))||(coords[0]+1<2 && coords[1]<2)));
          println(isValidCoord(coords[1],coords[0]-1) && newPathFindingMap[coords[0]-1][coords[1]] == -1 && (((map[coords[0]-1][coords[1]]==null))||(coords[0]-1<2 && coords[1]<2)));
          println(isValidCoord(coords[1]+1,coords[0]) && newPathFindingMap[coords[0]][coords[1]+1] == -1 && (((map[coords[0]][coords[1]+1]==null))||(coords[0]<2 && coords[1]+1<2)));
          println(isValidCoord(coords[1]-1,coords[0]) && newPathFindingMap[coords[0]][coords[1]-1] == -1 && (((map[coords[0]][coords[1]-1]==null))||(coords[0]<2 && coords[1]-1<2)));
        }
        
        if(isValidCoord(coords[1],coords[0]+1) && newPathFindingMap[coords[0]+1][coords[1]] == -1 && (((map[coords[0]+1][coords[1]]==null))||(coords[0]+1<2 && coords[1]<2))){
          newPathFindingMap[coords[0]+1][coords[1]] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0]+1,coords[1]};
          justVisitedCoords.add(thisCoord);
          
        }
         
        if(isValidCoord(coords[1],coords[0]-1) && newPathFindingMap[coords[0]-1][coords[1]] == -1 && (((map[coords[0]-1][coords[1]]==null))||(coords[0]-1<2 && coords[1]<2))){
          newPathFindingMap[coords[0]-1][coords[1]] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0]-1,coords[1]};
          justVisitedCoords.add(thisCoord);
          
        }
        
        if(isValidCoord(coords[1]+1,coords[0]) && newPathFindingMap[coords[0]][coords[1]+1] == -1 && (((map[coords[0]][coords[1]+1]==null))||(coords[0]<2 && coords[1]+1<2))){
          newPathFindingMap[coords[0]][coords[1]+1] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0],coords[1]+1};
          justVisitedCoords.add(thisCoord);
          
        }
        
        if(isValidCoord(coords[1]-1,coords[0]) && newPathFindingMap[coords[0]][coords[1]-1] == -1 && (((map[coords[0]][coords[1]-1]==null))||(coords[0]<2 && coords[1]-1<2))){
          newPathFindingMap[coords[0]][coords[1]-1] = newPathFindingMap[coords[0]][coords[1]]+1;
          int[] thisCoord = {coords[0],coords[1]-1};
          justVisitedCoords.add(thisCoord);
          
        }
      }
      
      lastVisitedCoords = justVisitedCoords;
    }
    //println(newPathFindingMap[BTD.WORLD_WIDTH-1][BTD.WORLD_HEIGHT-1]);
    if(newPathFindingMap[0][1] == -1 && newPathFindingMap[1][0] == -1 && newPathFindingMap[1][1] == -1){
      return false;
    }
    else{
      
      newPathFindingMap[0][0]=min(newPathFindingMap[0][1],newPathFindingMap[0][1])+1;
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
    
    for(int i = 0; i < enemies.size(); i++){
      Enemy e=enemies.get(i);
      e.display();
      if(e!=enemies.get(i)){
        i--;
      }
    }
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
         if(map[y][x]!=null){
            map[y][x].display(); 
         }
      }
    }
    if(random(60)<1){
      enemies.add(new Balloon(0,0,1,1));
      enemies.get(enemies.size()-1).setSpeed(4);
    }
    for(int y = 0; y < WORLD_HEIGHT; y++){
      for(int x = 0; x < WORLD_HEIGHT; x++){
        fill(255,255,255);
        text(pathFindingMap[y][x],width/BTD.WORLD_WIDTH * x+10,height/BTD.WORLD_HEIGHT*y+10);
      }
    }
  }
  
   void onMouseClick(){
    int y = screenToWorldY(mouseY);
    int x = screenToWorldX(mouseX);
    if(map[y][x]==null){
      
      map[y][x]=new DartTower(x,y,100);
      if(map[y][x].price>player.money){
        map[y][x]=null;
      }
      else if(!updatePathFindingMap()){
        map[y][x]=null;
      }
      else{
        player.money-=map[y][x].price;
        updatePathFindingMap();
      }
    }else{
     player.money+=SELL_RATIO*map[y][x].price;
     map[y][x]=null;
     updatePathFindingMap();
    }
  }
  
  public  int screenToWorldX(int x){
    return (int)(x/(float)width*(float)BTD.WORLD_WIDTH);
  }
  
  public  int screenToWorldY(int y){
    return (int)(y/(float)height*(float)BTD.WORLD_HEIGHT);
  }
}
