float hue = 154;
float saturation = 113; 
float brightness = 225;

float[] cordX = new float[250];
float[] cordY = new float[250];
float[] velocityY = new float[250];
float[] radius = new float[250];
int cordYm;
float colourTrans = 100;
boolean thing;  


void setup()
{
  size(700, 700);
  background(255);
  colorMode(HSB);

  for (int i = 0; i < cordX.length; i++)
  {
    cordX[i] = int(random(width));
    cordY[i] = height;
    radius[i] = int(random(4, 10));
    velocityY[i] = random(1, 5);
  }
}

void draw()
{  
  drawCircle();
  fillColour();

  for (int i = 0; i < cordX.length; i++)
  {
    cordY[i] = cordY[i] - velocityY[i];
  }
}


void drawCircle()
{

  noStroke();

  //for (int i = 0; i <cordX.length; i++)
  // {
  //   ellipse(cordX[i], cordY, rectSize[i], rectSize[i]);

  // }


  //for (int i = 0; i < 0; i++) 
  //{
  //  ellipse(cordX[i], cordY, rectSize[i], rectSize[i]);
  //}

  for (int i = 0; i < cordX.length; i++)
  {
    ellipse(cordX[i], cordY[i], radius[i], radius[i]);

    if (cordY[i] < 1)
    {
      cordY[i] = height;
      cordX[i] = int(random(width));
    }
  }
}


void fillColour()
{
  fill(hue, saturation, brightness, colourTrans);
      hue -= 0.3;
  for (int i = 0; i < cordX.length; i++)
  {
    if (cordY[i] < 0) 
    {  
      thing = true;
    }

    if (thing == true)
    {
       colourTrans = 100;
      hue = 154;
    }
  }
}