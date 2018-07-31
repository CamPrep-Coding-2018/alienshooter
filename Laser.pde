class Laser {
  public float x;
  public float y;
  public boolean fired = false;
  
 
  public void draw() {
    if (fired) {
      fill(200,20,10);
      rect(x-5, y-10, 10, 20);
    }
  }

  public void fire() {
    fired = true;
    x = playerX;
    y = playerY;
  }

  public void update() {
    if (!fired) {
      return;
    }

    y=y-30;
    if (y<0) {
      fired=false;
    }
  }
}
