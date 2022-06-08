class PlayerShip
{
    private int x, y;
    private int dir = 0;
    private int r = 20;
    private int life = 3;
    private PImage player1 = loadImage("./Data/sprits/player1.png");
    private PImage player2 = loadImage("./Data/sprits/player2.png");
    private PImage player3 = loadImage("./Data/sprits/player3.png");
    private PImage player4 = loadImage("./Data/sprits/player4.png");
    private PImage player5 = loadImage("./Data/sprits/player5.png");
    private PImage player6 = loadImage("./Data/sprits/player6.png");
    private int ship = 1;
    
    public PlayerShip(int ship)
    {
        this.x = 400;
        this.y = 600;
        this.ship = ship;
    }
    
    public void ShowShip()
    {
        switch(ship)
        {
            case 1:
                if(this.life == 3)
                {
                    imageMode(CENTER);
                    image(player1, this.x, this.y);
                }
                else
                {
                    imageMode(CENTER);
                    image(player2, this.x, this.y);
                }
                break;
                
            case 2:
                if(this.life == 3)
                {
                    imageMode(CENTER);
                    image(player3, this.x, this.y);
                }
                else
                {
                    imageMode(CENTER);
                    image(player4, this.x, this.y);
                }
                break;
                
            case 3:
                if(this.life == 3)
                {
                    imageMode(CENTER);
                    image(player5, this.x, this.y);
                }
                else
                {
                    imageMode(CENTER);
                    image(player6, this.x, this.y);
                }
                break;
                
            default:
                break;
        }
    }
    
    public void Move()
    {
        int aux = this.x + this.dir * 5;
        if(aux <= 20)
        {
            this.x = 20;
        }
        else if(aux >= 780)
        {
            this.x = 780;
        }
        else
        {
            this.x = aux;
        }
    }
    
    public int GetX()
    {
        return this.x;
    }
    
    public int GetY()
    {
        return this.y;
    }
    
    public void SetDir(int i)
    {
        this.dir = i;
    }
    
    public void SetX(int i)
    {
        this.x = i;
    }
    
    public int GetR()
    {
        return this.r;
    }
    
    public int GetLife()
    {
        return this.life;
    }
    
    public void SetLife()
    {
        this.life --;
    }
    
}
