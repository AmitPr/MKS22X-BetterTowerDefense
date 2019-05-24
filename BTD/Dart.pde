class Dart extends Bullet{
  public Dart (Tower parent, Enemy target){
    super(parent,target);
    this.damage=3;
    this.damagePerEnemy=3;
    speed=0.75;
  }
}
