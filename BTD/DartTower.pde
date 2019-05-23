public class DartTower extends Tower{
   public DartTower(int x, int y, int maxHealth){
     super(x,y,maxHealth); 
     r=g=115;
     b=55;
     this.price=200;
   }
   public void display(){
     super.display();
   }
}
