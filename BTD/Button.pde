public class Button{
  private float x,y,w,h,r,g,b;
  public String name;
  public Button(float x, float y, float w, float h, String name){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    r=g=b=255;
    this.name=name;
  }
  void setRGB(float r, float g, float b){
    this.r=r;
    this.g=g;
    this.b=b;
  }
  void display(){
    fill(r,g,b);
    rect(x,y,w,h,10);
  }
  boolean mouseOver(){
    return mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h;
  }
}
