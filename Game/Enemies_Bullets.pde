class EnemiesBullets
{
    private int x, y;
    private int r = 5;
    private boolean ToRemove = false;
    private PImage aux = loadImage("./Data/sprits/enemies_bullet.png");
    
    public EnemiesBullets(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    
    public void ShowBullet()
    {
        aux.resize(15,26);
        imageMode(CENTER);
        image(aux, this.x, this.y);
    }
    
    public void Move()
    {
        this.y = this.y + 5;
    }
    
    public boolean Hits(PlayerShip player)
    {
        float aux = dist(this.x, this.y, player.GetX(), player.GetY());
        if(aux < (this.r + player.GetR()))
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
