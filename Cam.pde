class Cam
{
  int x;
  int y;
  int dir;
  int field;
  int length = 10000;
  int r, g, b;

  public Cam()
  {
    x = width/2;
    y = 0;
    dir = 90;
    field = 90;
    r = round(random(0, 255));
    g = round(random(0, 255));
    b = round(random(0, 255));
  }

  public Cam(int xI, int yI, int dirI, int fieldI)
  {
    x = xI;
    y = yI;
    dir = dirI;
    field = fieldI;
    r = round(random(0, 255));
    g = round(random(0, 255));
    b = round(random(0, 255));
  }

  void rotate(int amt)
  {
    dir += amt;
  }

  void changeF(int amt)
  {
    field += amt;
  }

  void cColor()
  {
    r = round(random(0, 255));
    g = round(random(0, 255));
    b = round(random(0, 255));
  }

  void d(ArrayList<Obj> objs)
  {
    x=mouseX;
    y=mouseY;
    fill(r, g, b, 100);
    beginShape();
    vertex(x, y);
    vertex(x+length*cos(radians(dir-(field/2))), y+length*sin(radians(dir-(field/2))));
    vertex(x+length*cos(radians(dir+(field/2))), y+length*sin(radians(dir+(field/2))));
    vertex(x, y);
    endShape();
    for (Obj o : objs)
    {
      float h = dist(x, y, o.getX(), o.getY());
      float b = x-o.getX();
      float r = o.getR();
      float theta = asin(b/h);
      float phi = asin(r/h);
      int a;

      beginShape();
      float l = sqrt(sq(r)+sq(h));
      fill(0);
      if (o.getY()>=y)
      {
        vertex(x+l*cos(radians(90)+(theta-phi)), y+l*sin(radians(90)+(theta-phi)));
        vertex(x+length*cos(radians(90)+(theta-phi)), y+length*sin(radians(90)+(theta-phi)));
        vertex(x+length*cos(radians(90)+(theta+phi)), y+length*sin(radians(90)+(theta+phi)));
        vertex(x+l*cos(radians(90)+(theta+phi)), y+l*sin(radians(90)+(theta+phi)));
        vertex(x+l*cos(radians(90)+(theta-phi)), y+l*sin(radians(90)+(theta-phi)));
        endShape();
      }
      else
      {
        vertex(x+l*cos(radians(270)-(theta-phi)), y+l*sin(radians(270)-(theta-phi)));
        vertex(x+length*cos(radians(270)-(theta-phi)), y+length*sin(radians(270)-(theta-phi)));
        vertex(x+length*cos(radians(270)-(theta+phi)), y+length*sin(radians(270)-(theta+phi)));
        vertex(x+l*cos(radians(270)-(theta+phi)), y+l*sin(radians(270)-(theta+phi)));
        vertex(x+l*cos(radians(270)-(theta-phi)), y+l*sin(radians(270)-(theta-phi)));
        endShape();
      }
    }
    fill(100);
    ellipse(x, y, 50, 50);
  }
}
