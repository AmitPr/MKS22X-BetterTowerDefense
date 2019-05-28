class WaveAction{
  int type = 0;
  int enemyCount = 0;
  int enemySpacing = 5;
  int timeTillNext = enemySpacing;
  boolean isDone=false;
  public WaveAction(int type, int enemyCount, int enemySpacing){
    this.type=type;
    this.enemyCount = enemyCount;
    this.enemySpacing=enemySpacing;
    this.timeTillNext=enemySpacing;
  }
  public int getType(){
    return type;
  }
  public int getEnemyCount(){
    return enemyCount;
  }
  public int getEnemySpacing(){
    return enemySpacing;
  }
  void tick(){
    timeTillNext--;
    if(timeTillNext<=0){
      if(enemyCount<=0){
        isDone=true;
        return;
      }
      Enemy e = new Balloon(0,0,type);
      world.enemies.add(e);
      enemyCount--;
      timeTillNext=enemySpacing;
      
    }
  }
  boolean isDone(){
    return isDone;
  }
  
}
