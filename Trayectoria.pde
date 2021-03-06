class Box 
{
  Body body;
  float w;
  float h;

  Box(float x, float y) 
  {
    w = 2.5;
    h = 2.5;
    makeBody(new Vec2(x, y), w, h);
  }

  void killBody() 
  {
    box2d.destroyBody(body);
  }

  boolean done() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    if (pos.y <= 100 & pos.y <300) 
    {
      noStroke();
      fill(random(0,255),random(0,255),random(0,255));
      rect(pos.x, pos.y-10, 5, 5);
      rect(pos.x+10, pos.y, 5, 5);
      rect(pos.x, pos.y+10, 5, 5);
      rect(pos.x-10, pos.y, 5, 5);
     
      rect(pos.x+5, pos.y-7.5, 5, 5);
      rect(pos.x+5, pos.y+7.5, 5, 5);
      rect(pos.x-5, pos.y+7.5, 5, 5);
      rect(pos.x-5, pos.y-7.5, 5, 5);
     
      fill(random(0,255),random(0,255),random(0,255));
      rect(pos.x+5, pos.y-12.5, 5, 5); //1
      rect(pos.x+12.5, pos.y+5, 5, 5); //2
      rect(pos.x-5, pos.y+12.5, 5, 5); //3
      rect(pos.x-12.5, pos.y+5, 5, 5); //4
      
      rect(pos.x+12.5, pos.y-5, 5, 5); //5
      rect(pos.x+5, pos.y+12.5, 5, 5); //6
      rect(pos.x-12.5, pos.y-5, 5, 5); //7
      rect(pos.x-5, pos.y-12.5, 5, 5); //8
      
      fill(random(0,255),random(0,255),random(0,255));
      rect(pos.x+10, pos.y-15, 5, 5); //1
      rect(pos.x+15, pos.y+10, 5, 5); //2
      rect(pos.x-10, pos.y+15, 5, 5); //3
      rect(pos.x-15, pos.y+10, 5, 5); //4
      
      rect(pos.x+15, pos.y-10, 5, 5); //5
      rect(pos.x+10, pos.y+15, 5, 5); //6
      rect(pos.x-15, pos.y-10, 5, 5); //7
      rect(pos.x-10, pos.y-15, 5, 5); //8

      fill(random(0,255),random(0,255),random(0,255));
      rect(pos.x+15, pos.y-17.5, 5, 5); //1
      rect(pos.x+17.5, pos.y+15, 5, 5); //2
      rect(pos.x-15, pos.y+17.5, 5, 5); //3
      rect(pos.x-17.5, pos.y+15, 5, 5); //4
      
      rect(pos.x+17.5, pos.y-15, 5, 5); //5
      rect(pos.x+15, pos.y+17.5, 5, 5); //6
      rect(pos.x-17.5, pos.y-15, 5, 5); //7
      rect(pos.x-15, pos.y-17.5, 5, 5); //8
      
      fill(random(0,255),random(0,255),random(0,255));
      rect(pos.x+20, pos.y-20, 5, 5); //1
      rect(pos.x+20, pos.y+20, 5, 5); //2
      rect(pos.x-20, pos.y+20, 5, 5); //3
      rect(pos.x-20, pos.y+20, 5, 5); //4
      
      rect(pos.x+20, pos.y-20, 5, 5); //5
      rect(pos.x+20, pos.y+20, 5, 5); //6
      rect(pos.x-20, pos.y-20, 5, 5); //7
      rect(pos.x-20, pos.y-20, 5, 5); //8
      killBody();
      return true;
    }
    return false;
  }
  
  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(255);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(Vec2 center, float w_, float h_)
  {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);

    body.setLinearVelocity(new Vec2(random(-7.5,7.5), random(25,50)));
  }
}