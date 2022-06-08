class Menu
{
    private PImage spaceinvaders = loadImage("./Data/sprits/SpaceInvaders.png");
    private PImage start1 = loadImage("./Data/sprits/start.png");
    private PImage enemie_pink = loadImage("./Data/sprits/enemie_pink.png");
    private PImage enemie_green = loadImage("./Data/sprits/enemie_green.png");
    private float ang1 = 0;
    private float ang2 = 0;
    private float escala = 0;
    private PFont font = createFont("./Data/fonts/Retro.ttf",100);
    
    public Menu()
    {
    }
    
    public void Show()
    {
        background(51);
        pushMatrix();
        start1.resize(254,185);
        translate(400,100);
        scale(escala);
        imageMode(CENTER);
        image(spaceinvaders, 0,0);
        escala+=0.01;
        if(escala>0.5)
        {
            escala=0.5;
        }
        popMatrix();
        
        start1.resize(254,185);
        imageMode(CENTER);
        image(start1,400, 350);
        
        pushMatrix();
        translate(750,650);
        rotate(radians(this.ang1++));
        enemie_pink.resize(66,48);
        imageMode(CENTER);
        image(enemie_pink,0,0);
        popMatrix();
        
        pushMatrix();
        translate(50,650);
        rotate(radians(this.ang2--));
        enemie_green.resize(66,48);
        imageMode(CENTER);
        image(enemie_green,0,0);
        popMatrix();
        
        textFont(font,30);
        fill(0, 255, 61);
        text("Enter for start", 250, 500);
        text("Z for Select your character", 140, 550);
        text("Up Arrow for story", 225, 600);
        text("Down Arrow for credit", 215, 650);
    }
}
