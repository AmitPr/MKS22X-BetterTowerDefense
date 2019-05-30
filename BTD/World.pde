class World{
  
  
  public ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  public ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  public ArrayList<WaveAction> currentWave= new ArrayList<WaveAction>();
  public int waveNum = 1;
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
    currentWave=getWave(1);
  }
  public ArrayList<WaveAction> getWave(int waveNum){
    ArrayList<WaveAction> toReturn = new ArrayList<WaveAction>();
    toReturn.add(new WaveAction(0,waveNum,20+60/waveNum));
    if(waveNum%5==0){
      toReturn.add(new WaveAction(4,1,20+60/waveNum));
    }
    return toReturn;
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
    if(currentWave.size()>0){
      currentWave.get(0).tick();
      if(currentWave.get(0).isDone()){
       currentWave.remove(0); 
      }
    }else{
      currentWave=getWave(waveNum++);
    }
    for(int y = 0; y < map.length; y++){
      for(int x = 0; x < map[y].length;x++){
         if(map[y][x]!=null){
            map[y][x].display(); 
         }
      }
    }
    for(int i = 0; i < bullets.size(); i++){
      Bullet b = bullets.get(i);
      b.display();
      if(i >= bullets.size() || b!=bullets.get(i)){
        i--;
      }
    }
    for(int i = 0; i < enemies.size(); i++){
      Enemy e=enemies.get(i);
      e.display();
      if(i >= enemies.size() || e!=enemies.get(i)){
        i--;
      }
    }
    
    
    //println("Tower count: "+Integer.toString(towerCounter)); 
    for(int i = 0; i < enemies.size(); i++){
      Enemy e=enemies.get(i);
      e.display();
      if(e.isDead()){enemies.remove(e);}
      if(i<enemies.size() && e!=enemies.get(i)){
        i--;
      }
    }
    for(int y = 0; y < WORLD_HEIGHT; y++){
      for(int x = 0; x < WORLD_HEIGHT; x++){
        fill(255,255,255);
        text(pathFindingMap[y][x],WIDTH/BTD.WORLD_WIDTH * x+10,HEIGHT/BTD.WORLD_HEIGHT*y+10);
      }
    }
  }
   void onMouseClick(){
    int y = screenToWorldY(mouseY);
    int x = screenToWorldX(mouseX);
    if(map[y][x]==null){
      if(key=='d'){
        map[y][x]=new DartTower(x,y,100);
      }else if (key=='w'){
        map[y][x]=new WallTower(x,y,100); 
      }else if (key=='f'){
        map[y][x]=new FreezeTower(x,y,100);
      }else if (key == 't'){
        map[y][x]=new TackTower(x,y,100);
      }
      if(map[y][x]!=null){
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
      }
    }else{
     player.money+=SELL_RATIO*map[y][x].price;
     map[y][x]=null;
     updatePathFindingMap();
    }
  }
  
  public  int screenToWorldX(int x){
    return (int)(x/(float)WIDTH*(float)BTD.WORLD_WIDTH);
  }
  
  public  int screenToWorldY(int y){
    return (int)(y/(float)HEIGHT*(float)BTD.WORLD_HEIGHT);
  }
}