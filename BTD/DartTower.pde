public class DartTower extends Tower{
   public DartTower(int x, int y, int maxHealth){
     super(x,y,maxHealth); 
     timeTillNextFire=reloadTime=1;
     r=g=115;
     b=55;
     this.price=200;
   }
   public void display(){
     super.display();
   }
   public void fire(Enemy e){
     super.fire(e);
   }
}
