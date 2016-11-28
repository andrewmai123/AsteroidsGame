class bullet extends Floater
{
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