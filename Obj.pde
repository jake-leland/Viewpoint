class Obj
{
  int x;
  int y;
  int size;
  int length = 1500;

  public Obj()
  {
    x = mouseX;
    y = mouseY;
    size = 50;
  }

  public Obj(int xI, int yI, int sizeI)
  {
    x = xI;
    y = yI;
    size = sizeI;
  }

  void d()
  {
    fill(100);
    ellipse(x, y, size, size);
  }

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  int getR()
  {
    return size/2;
  }
}

