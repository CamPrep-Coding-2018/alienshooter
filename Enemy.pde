class Enemy {
  int health; 
  boolean bulletLanded;
  public float x;
  public float y;
  public boolean live;
  public Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    live = true;
  }

  public void draw() {
    if (live) {
      fill(246, 230, 0);
      rect(referenceX+x-25, referenceY+y-25, 60, 30);
    }
  }
  public boolean hit(float laserX, float laserY) {
    if (live && laserX>=referenceX+x-25 && laserX<=referenceX+x+25 && laserY>=referenceY+y-25 && laserY<=referenceY+y+25) {
      live = false;
      enemiesCount = enemiesCount-1;
      return true;
    } else {
      return false;
    }
  }
}
