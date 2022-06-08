class SelectShip
{
    private PFont font = createFont("./Data/fonts/Retro.ttf",100);;
    private PImage player1 = loadImage("./Data/sprits/player1.png");
    private PImage player3 = loadImage("./Data/sprits/player3.png");
    private PImage player5 = loadImage("./Data/sprits/player5.png");
    private int ship = 1;
    
    public SelectShip()
    {
    }
    
    public void Show()
    {
        textFont(font,40);
        fill(0, 255, 61);
        text("Select your charecter:", 100, 100);
        
        player1.resize(214,126);
        image(player1, 200, 300);
        player3.resize(214,126);
        image(player3, 600, 300);
        
        player5.resize(214,126);
        image(player5, 400, 500);
        
        textFont(font,40);
        fill(0, 255, 61);
        text("Press 1", 100, 400);
        text("Press 2", 500, 400);
        text("Press 3", 300, 600);
    }
    
    public void SetShip(int i)
    {
        this.ship = i;
    }
    
    public int GetShip()
    {
        return this.ship;
    }
}
