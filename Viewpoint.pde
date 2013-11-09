// Jake Leland

/*
 * VIEWPOINT
 * 
 * This sketch is intended to visualize a camera's field of view.
 * The camera is located at the mouse location.
 * 
 * Controls:
 ** UP/DOWN - camera rotation
 ** LEFT/RIGHT - camera field of view
 ** CLICK - place an object
 ** SPACE - change the color of the camera field of view
 * 
 * This project was developed to visualize the field of view of the Xbox Kinect,
 * but this sketch just used the mouse.
 */

Cam c, d;
ArrayList<Obj> objs;

void setup()
{
  size(1920, 1080);
  objs = new ArrayList<Obj>();
  noStroke();
  c = new Cam();
}

void draw()
{
  background(0);
  if (keyPressed)
  {
    println((int)key);
    if (key==56 || keyCode==UP)
      c.rotate(2);
    else if (key==50 || keyCode==DOWN)
      c.rotate(-2);
    else if (key==52 || keyCode==LEFT)
      c.changeF(2);
    else if (key==54 || keyCode==RIGHT)
      c.changeF(-2);
  }
  c.d(objs);
  for (Obj o : objs)
    o.d();
}

void mousePressed()
{
  objs.add(new Obj());
}

void keyPressed()
{
  if (key==32)
    c.cColor();
}

