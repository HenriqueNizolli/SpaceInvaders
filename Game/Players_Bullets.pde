class PlayerBullets
{
    private int x, y;
    private int r = 5;
    private boolean ToRemove = false;
    
    public PlayerBullets(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    
    public void ShowBullet()
    {
        
        fill(60,60,255);
        rectMode(CENTER);
        rect(this.x, this.y, 5, 20);
    }
    
    public void Move()
    {
        this.y = this.y - 5;
    }
    
    public boolean Hits(EnemiesShip enemie)
    {
        float aux = dist(this.x, this.y, enemie.GetX(), enemie.GetY());
        if(aux < (this.r + enemie.GetR()))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public boolean GetRm()
    {
        return this.ToRemove;
    }
    
    public int GetY()
    {
        return this.y;
    }
}
