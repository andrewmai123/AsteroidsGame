//your variable declarations here
SpaceShip bob = new SpaceShip();
star[] random = new star[400];
ArrayList <asteroid> field = new ArrayList <asteroid>();
bullet bill = new bullet();
ArrayList <bullet> list = new ArrayList <bullet>();




public void keyPressed()
  {
    if (key == 'h')
    {
      bob.setX((int)(Math.random()*800));
      bob.setY((int)(Math.random()*800));
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      bob.accelerate(0);
      bob.setPointDirection((int)(Math.random()*360));
    }

    if (key == 'w')
    {
      bob.accelerate(0.5);
      if (key == 'a')
      {
        bob.accelerate(0.5);
        bob.rotate(-10);
      }
    }
    if (key == 's')
    {
      bob.accelerate(-0.5);
    }
    if (key == 'a')
    {
      bob.rotate(-10);
    }
    else if(key == 'd')
    {
      bob.rotate(10);
    }

    if (key == 'f')
    {
      for (int i=0; i<1; i++)
      {
        bullet somebullet = new bullet();
        list.add(somebullet);
      }
    }

  
}

public void setup() 
{
  size(800,800);

  background(0);
  for (int i = 0; i < random.length; i++)
  {
    random[i] = new star();
  }

  for (int i = 0; i < 50; i++)
  {
    asteroid someasteroid  = new asteroid();
    field.add(someasteroid);
  }


}
public void draw() 
{
  background(0);
  
  for (int i = 0; i < random.length;i++)
  {
    random[i].show();
  }

  for (int i = 0; i < field.size(); i++)
  {
   field.get(i).show();
   field.get(i).move();
   if (dist(field.get(i).getX(), field.get(i).getY(), bob.getX(), bob.getY()) < 20)
    {
      field.remove(i);
    }
  } 

  for (int i = 0; i < list.size(); i++)
  {
    list.get(i).show();
    list.get(i).move();
  } 
  bob.show();
  bob.move(); 
  bill.show();
  bill.move();


}

class asteroid extends Floater
{
  private int rotSpeed = (int)(Math.random()*3+1);

  public asteroid()
  {
    myColor = 100;
    corners = 8;
    int[] xS = {-12,-8,0,0,12,10,2,0};
    int[] yS = {-2 ,6 ,8,8, 0,-6,-6,-7};
    xCorners = xS;
    yCorners = yS;
    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
    myPointDirection = 0;

  }

  public void move()
  {
    rotate (rotSpeed);
    super.move();
  }
  
   public void setX(int x){myCenterX = x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX = x;}  
   public double getDirectionX(){return myDirectionX;}
   public void setDirectionY(double y){myDirectionY = y;}
   public double getDirectionY(){return myDirectionY;}
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;}
}

class star 
{
  private int x, y;
  public star()
  {
    x = (int)(Math.random()*800);
    y = (int)(Math.random()*800);
  }

  public void show()
  {
    fill(255);
    ellipse(x,y,2,2);
  }
}

class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
   myColor = 255; 
   corners = 6;
   int[] xS = {-11,7,13,7,-11,-5};
   int[] yS = {-8,-8,0,8,8,0};
   xCorners = xS;
   yCorners = yS;
   myCenterX = Math.random()*400;
   myCenterY = Math.random()*400;
   myDirectionX = 2;
   myDirectionY = 0;
   myPointDirection = -3;
}
   public void setX(int x){myCenterX = x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX = x;}  
   public double getDirectionX(){return myDirectionX;}
   public void setDirectionY(double y){myDirectionY = y;}
   public double getDirectionY(){return myDirectionY;}
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}
