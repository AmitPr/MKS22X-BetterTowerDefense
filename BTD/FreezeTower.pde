public class FreezeTower extends Tower{
   public FreezeTower(int x, int y, int maxHealth){
     super(x,y,maxHealth); 
     timeTillNextFire=reloadTime=3;
     r=g=0;
     b=255;
     this.price=towerPrices[2];
   }
   public void display(){
     fill(r,g,b);
    timeTillNextFire-=1/frameRate;
    if(timeTillNextFire<=0){
      for(int i = 0; i < world.enemies.size(); i++){
        Enemy e = world.enemies.get(i);
        float squareDist=abs(pow((e.getX()-x),2)+pow((e.getY()-y),2));
        if(squareDist<9){
          fire(e);
        }
        if(i>=world.enemies.size() || e!=world.enemies.get(i)){
          i--;
        }
      }
       timeTillNextFire=reloadTime;
    }
    rect(width/BTD.WORLD_WIDTH * x,height/BTD.WORLD_HEIGHT*y,width/BTD.WORLD_WIDTH,height/BTD.WORLD_HEIGHT);
   }
   public void fire(Enemy e){
      if(!e.hasEffect("freeze")){
        e.addEffect(new Effect(5,2,"freeze"));
      }
      e.damage(1);
   }
}
