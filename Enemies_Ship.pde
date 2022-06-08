class EnemiesShip
{
    private int y;
    private float x;
    private int r = 20;
    private boolean ToRemove = false;
    private float xdir = 1;
    private PImage enemie1 = loadImage("./Data/sprits/enemies1.png");
    private PImage enemie2 = loadImage("./Data/sprits/enemies2.png");
    private int timer = 0;
    private int sprit = 1;
    
    public EnemiesShip(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    
    public void ShowShip()
    {
        if(sprit == 1)
        {    
            enemie1.resize(56,41);
            imageMode(CENTER);
            image(enemie1, this.x, this.y);
        }
        else
        {
            enemie2.resize(56,41);
            imageMode(CENTER);
            image(enemie2, this.x, this.y);
        }
        timer++;
        if(timer == 20 && sprit == 1)
        {
            timer = 0;
            sprit = -1;
        }
        if(timer == 20 && sprit == -1)
        {
            timer = 0;
            sprit = 1;
        }
    }
    
    public void Move(float vel)
    {
        this.x = this.x + vel * this.xdir;
    }
    
    public float GetX()
    {
        return this.x;
    }
    
    public int GetY()
    {
        return this.y;
    }
    
    public int GetR()
    {
        return this.r;
    }
    
    public boolean GetRm()
    {
        return this.ToRemove;
    }
    
    public void SetXdir(float i)
    {
        this.xdir = i;
    }

    public void SetYdir(int i)
    {
        this.y = i;
    }
}
