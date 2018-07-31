int begin; 
int duration = 36;
int time = 36;
int enemiesCount;

boolean keyLeft = false;
boolean keyRight = false;
boolean keySpace = false;
boolean timerstarted = false;
boolean timerstopped;
 

float playerX, playerY;
float diff = 2;
float referenceX, referenceY, referenceSpeed;

Enemy enemies[];
Point[] point;
Agent Agent =  new Agent(); 
Ship ship = new Ship();
Laser laser = new Laser();

void setup() {
  size(1080, 800);  
  point = new Point[100];
  for (int i=0; i<point.length; i++) {
    point[i] = new Point(random(width), random(height));
  }
  enemies = new Enemy[40];
  enemiesCount = 40;
  for (int i=0; i<enemies.length; i++) {
    enemies[i]=new Enemy((i%10)*70, 70*(i/10));
  }
  playerX = width/2;
  playerY = height-50-5;
  referenceX = 100;
  referenceY = 200;
  referenceSpeed = 1;
}

void draw() {
  background(0, 0, 0);
  text("ENEMIES "+enemiesCount, 125, 50);
  fill(20, 20, 0);
  textSize(30);
  for (int i=0; i<enemies.length; i++) {
    enemies[i].draw();
    if (enemiesCount <= 0) {
      String s = "You Win";
      fill(255, 60, 255);
      textAlign(CENTER, CENTER);
      textSize(80);
      text(s, width/2, height/2);
      fill(255, 255, 255); 
    }
  }
  if (key == ' ') timerstarted = true;
  if (timerstarted && !timerstopped) { 
    time = duration - (millis() - begin)/1000;
    text(time, 1000, 50);
    textSize(45);
    if (time<=0) {
      timerstopped = true;
    }
  }
  if (enemiesCount<=0) {
    timerstopped=true;
  }
  if (timerstopped && enemiesCount>0) {
    String g = "GAME OVER";
    fill(255, 60, 255);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(g, width/2, height/2);
  }

  if (keyLeft) {
    playerX = playerX - 10;
  }
  if (keyRight) {
    playerX = playerX + 10;
  }
  if (playerX < 25) {
    playerX = 25;
  }
  if (playerX > width-25) {
    playerX = width-25;
  }

  if (keySpace && !laser.fired) {
    laser.fire();
  }
  Agent.draw();
  ship.draw();
  laser.draw();
  laser.update();

  for (int i=0; i<enemies.length; i++) {
    if (enemies[i].hit(laser.x, laser.y)) {
      laser.fired = false;
      break;
    }
  }

  referenceX = referenceX+referenceSpeed;
  if (referenceX<50 || referenceX>350) {
    referenceSpeed = -referenceSpeed;
    referenceY = referenceY+5;
  }
}
void keyPressed() {
  if (keyCode==LEFT) {
    keyLeft = true;
  }
  if (timerstopped && enemiesCount>0) {
    keyLeft = false;
  }
  if (keyCode==RIGHT) {
    keyRight = true;
  }
  if (timerstopped && enemiesCount>0) {
    keyRight = false;
  }
  if (key==' ') {
    keySpace = true;
  }
  if (timerstopped && enemiesCount>0) {
    keySpace = false;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    keyLeft = false;
  }
  if (keyCode == RIGHT) {
    keyRight = false;
  }
  if (key==' ') {
    keySpace = false;
  }

  if (enemiesCount==0) { 
    textAlign(CENTER, CENTER);
    textSize(128);
    text("YOU WIN!", width/2, height/2);
  }
}
