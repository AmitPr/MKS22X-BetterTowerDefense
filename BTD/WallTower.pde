public class WallTower extends Tower{
   public WallTower(int x, int y, int maxHealth){
     super(x,y,maxHealth); 
     timeTillNextFire=reloadTime=Float.MAX_VALUE;
     r=g=b=115;
     this.price=20;
   }
   public void display(){
     super.display();
   }
   public void fire(Enemy e){}
}
