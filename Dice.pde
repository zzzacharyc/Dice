int total = 0;

void setup() {
  size(320, 350);
  noLoop();
}

void draw() {
  background(200);
  total = 0;

  for (int x = 20; x <= 220; x += 100) {
    for (int y = 20; y <= 220; y += 100) {
      Die d = new Die(x, y);
      d.roll();
      d.show();
      total += d.value;
    }
  }

  fill(0);
  textSize(20);
  text("Total: " + total, 125, 330);
}

void mousePressed() {
  redraw();
}

class Die {
  int x, y, value;

  Die(int myX, int myY) {
    x = myX;
    y = myY;
  }

  void roll() {
    value = (int)(Math.random() * 6 + 1);
  }

  void show() {
    fill(255);
    rect(x, y, 80, 80);
    fill(0);
    float myX = x + 40, myY = y + 40;

    if (value == 1 || value == 3 || value == 5){
      ellipse(myX, myY, 10, 10);
    }
    if (value >= 2) {
      ellipse(x + 20, y + 20, 10, 10);
      ellipse(x + 60, y + 60, 10, 10);
    }
    if (value >= 4) {
      ellipse(x + 60, y + 20, 10, 10);
      ellipse(x + 20, y + 60, 10, 10);
    }
    if (value == 6) {
      ellipse(x + 20, myY, 10, 10);
      ellipse(x + 60, myY, 10, 10);
    }
  }
}
