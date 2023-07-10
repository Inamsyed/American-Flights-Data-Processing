class userInterfaceSearchBar {
  
int xPositionOfString;
int yPositionOfString;

int xPositionOfRectangle = 420;
int yPositionOfRectangle ;

int rectangleWidth;
int rectangleHeight;

String label; 
String Text = "" ;
int TextLength = 0;

int Queryevent;

PFont SearchBarFont;

boolean selected = false;

userInterfaceSearchBar(int x,int y, String label, int Queryevent)
{
  
this.xPositionOfString= x; 
this.yPositionOfString= y;

this.yPositionOfRectangle = yPositionOfString - 25 ;

this.rectangleWidth = 60; 
this.rectangleHeight= 30;

this.label=label;
this.Queryevent=Queryevent;
this.SearchBarFont =loadFont("ArialRoundedMTBold-48.vlw");

}


void draw(){
  
if(selected) {
 fill(235); 
  
} else {
 fill(255); 
}

rect(xPositionOfRectangle , yPositionOfRectangle , rectangleWidth , rectangleHeight);

fill(0);
textFont(SearchBarFont);
textSize(25);
text(label, xPositionOfString, yPositionOfString );

textSize(20);
text(Text, xPositionOfRectangle + (textWidth("a") / 2), yPositionOfRectangle + 20);


}

boolean KEYPRESSED(char KEY, int KEYCODE) 
{
  if (KEYCODE == (int)BACKSPACE)
  {
    BACKSPACE();
  }
  
  
  else if (KEYCODE == 32)
  {
    addText(' ');
  }
  
  
  else if (KEYCODE == (int)ENTER)
  {
    return true;
  }
  
  
  
  else if (selected == true)
      {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            switch(Queryevent) {
             case 0:
             if (isKeyNumber && TextLength < 2)
            {
               addText(KEY);
            }
            break;
             case 1:
             if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber)
            {
               addText(str(KEY).toUpperCase().charAt(0));
            }
            break;
            case 2:
            if (isKeyNumber)
            {
               addText(KEY);
            }
            
      }
            
      }
      
      
      return false;
}
   
void addText(char text)
{
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      
      if (textWidth(Text + text) < rectangleWidth )
      {
         Text = Text + text;
         TextLength++;
      }
    
  
}
   
   
void PRESSED(int x, int y)
{
  if (overBox(x, y))
  {
    selected = true;
  } 
  else 
  {
    selected = false;
  }
}
   
boolean overBox(int x, int y)
{
  if(x >xPositionOfRectangle && x < xPositionOfRectangle+rectangleWidth && y > yPositionOfRectangle  && y <yPositionOfRectangle+rectangleHeight)
  {
    System.out.println("Selected box " + Queryevent);
    return true;
    
  }
  
  else
  {
    System.out.println("Deselected box " + Queryevent);
    return false;
  }
  
}

void BACKSPACE() 
{
      if ((selected == true) && (TextLength - 1 >= 0)) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }

}
