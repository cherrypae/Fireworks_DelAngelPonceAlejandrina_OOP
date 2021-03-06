import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
Box2DProcessing box2d;
PImage bg;


ArrayList<Box> boxes;


void setup() 
{
  size(1000,500);
  smooth();
  bg = loadImage("city.png");

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  boxes = new ArrayList<Box>();
}

void draw()
{
  background(bg);

  box2d.step();

  if (random(10) < 0.2)
  {
    Box p = new Box(random(250,750),500);
    boxes.add(p);
  }

  for (Box b: boxes) {
    b.display();
  }

  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}