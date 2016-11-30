class bullet extends Floater
{	
	public void show()
	{
		ellipse((int)myCenterX,(int)myCenterY,50,50);
	}

	public bullet(SpaceShip theShip)
	{
		myColor = 0;
	    corners = 4;
	    int[] xS = {-4,4,4,-4};
	    int[] yS = {4,4,-4,-4};
	    xCorners = xS;
	    yCorners = yS;
	    myCenterX = theShip.getX();
	    myCenterY = theShip.getY();
	    double dRadians =myPointDirection*(Math.PI/180);
	    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
	   	myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
	    myPointDirection = theShip.getPointDirection();		


	}


	public bullet()
	{
		myColor = 0;
	    corners = 4;
	    int[] xS = {-4,4,4,-4};
	    int[] yS = {4,4,-4,-4};
	    xCorners = xS;
	    yCorners = yS;
	    myCenterX = Math.random()*800;
	    myCenterY = Math.random()*800;
	    myDirectionX = Math.random()*2-1;
	    myDirectionY = Math.random()*2-1;
	    myPointDirection = 0;		
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