class Dart extends Bullet{
  public Dart (Tower parent, Enemy target){
    super(parent,target);
    this.damage=1;
    this.damagePerEnemy=1;
    speed=0.75;
  }
}
