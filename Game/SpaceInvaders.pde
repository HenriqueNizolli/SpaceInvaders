import java.util.ArrayList;
import processing.sound.*;

PFont font;
PlayerShip player;
ArrayList<EnemiesShip> enemies;
ArrayList<PlayerBullets> player_bullets;
ArrayList<EnemiesBullets> enemies_bullets;
Menu menu;
Story story;
Credit credit;
SelectShip selectship;
SoundFile track1;
SoundFile track2;
SoundFile track3;

int updown = 1;
int dificult = 1;
int points = 0;
float vel = 0.3;
int timer = 0;
int op = -1;

void setup()
{
    size(800, 700, P2D);
    menu = new Menu();
    story = new Story();
    credit = new Credit();
    selectship = new SelectShip();
    track1 = new SoundFile(this, "./Data/sounds/menu.mp3");
    track2 = new SoundFile(this, "./Data/sounds/fire.wav");
    track3 = new SoundFile(this, "./Data/sounds/enemyhit.wav");
}
void draw()
{
    background(51);
    switch(op)
    {
        case 0:
            track1.stop();
            story.Show();
            break;

        case 1:
            track1.stop();
            credit.Show();
            break;

        case 2:
            track1.stop();
            selectship.Show();
            break;

        case 3:
            break;

        case 4:
            track1.stop();
            enemies = new ArrayList<EnemiesShip>();
            player_bullets = new ArrayList<PlayerBullets>();
            enemies_bullets = new ArrayList<EnemiesBullets>();
            player = new PlayerShip(selectship.GetShip());
            GenerateEnemies(dificult);
            font = createFont("./Data/fonts/Retro.ttf",100);
            updown = 1;
            dificult = 1;
            points = 0;
            vel = 0.3;
            timer = 0;
            op = 5;
            break;
            
        case 5:
            player.ShowShip();
            player.Move();
            for(int i = 0; i < player_bullets.size(); i++)
            {
                player_bullets.get(i).ShowBullet();
                player_bullets.get(i).Move();
                for(int j = 0 ; j < enemies.size(); j ++)
                {
                    if(player_bullets.get(i).Hits(enemies.get(j)))
                    {
                        track3.stop();
                        enemies.get(j).ToRemove = true;
                        player_bullets.get(i).ToRemove = true;
                        track3.play();
                    }
                }
            }
            for(int i = 0 ; i < enemies_bullets.size(); i ++)
                {
                   enemies_bullets.get(i).ShowBullet();
                   enemies_bullets.get(i).Move();
                   if(enemies_bullets.get(i).Hits(player))
                   {
                       player.SetLife();
                       println(player.GetLife());
                       enemies_bullets.get(i).ToRemove = true;
                   }
                }
            for(int i = 0; i < enemies.size(); i++)
            {
                enemies.get(i).ShowShip();
                enemies.get(i).Move(vel);
            }
            MapEdge();
            RemoveObj();
            Score();
            HP();
            timer ++;
            Level();
            if(enemies.size() == 0)
            {
                dificult  ++;
                RemoveBullets();
                player.SetX(400);
                GenerateEnemies(dificult);
                timer = 0;
                delay(1000);
            }
            if(player.GetLife() == 0)
            {
                RemoveBullets();
                RemoveEnemies();
                player.SetX(900);
                GameOver();
            }
            break;

        default:
            menu.Show();
            if(!track1.isPlaying())
            {
                track1.play();
            }
            break;
    }
}

void keyPressed()
{
    if(op == 5)
    {
        switch(keyCode)
        {
            case 39:
                player.SetDir(1);
                break;
                
            case 37:
                player.SetDir(-1);
                break;
                
            case 32:
                track2.stop();
                PlayerBullets p_bullet = new PlayerBullets(player.GetX(), player.GetY());
                player_bullets.add(p_bullet);
                track2.play();
                break;
                
            case 8:
                op = -1;
                break;
                
            default:
                break;
        }
    }
    else
    {
        if(op == 2)
        {
           switch(keyCode)
            {
                case 49:
                    selectship.SetShip(1);
                    break;

                case 50:
                    selectship.SetShip(2);
                    break;
                    
                case 51:
                    selectship.SetShip(3);
                    break;

                default:
                    break;
            } 
        }
        switch(keyCode)
        {
            case 10:
                op = 4;
                break;

            case 38:
                op = 0;
                break;

            case 40:
                op = 1;
                break;

            case 90:
                op = 2;
                break;

            case 8:
                op = -1;
                break;

            default:
                break;
        }
    }
}

void keyReleased()
{
    if(key != ' ' && op == 5)
    {
        player.SetDir(0);
    }
}

void GenerateEnemies(int dificult)
{
    if(dificult <= 5)
    {
        for(int i = 0; i < dificult; i++)
        {
            for(int j = 0; j < 10; j++)
            {
                EnemiesShip enemie = new EnemiesShip((j * 70 + 100), (50 + 50 * i));
                enemies.add(enemie);
            }
        }
        vel = 0.3;
    }
    else
    {
      if(dificult == 6)
      {
          for(int i = 0; i < 6; i++)
          {
              for(int j = 0; j < 10; j++)
              {
                  EnemiesShip enemie = new EnemiesShip((j * 70 + 100), (50 + 50 * i));
                  enemies.add(enemie);
              }
          }
          vel = 0.3;
      }
      else
      {
          for(int i = 0; i < 6; i++)
          {
              for(int j = 0; j < 10; j++)
              {
                  EnemiesShip enemie = new EnemiesShip((j * 70 + 90), (50 + 50 * i));
                  enemies.add(enemie);
              }
          } 
        }
    }
}

void RemoveObj()
{
    for(int i = 0; i < player_bullets.size(); i ++)
    {
        if(player_bullets.get(i).GetRm())
        {
            player_bullets.remove(i);
        }
    }
    for(int i = 0; i < enemies_bullets.size(); i ++)
    {
        if(enemies_bullets.get(i).GetRm())
        {
            enemies_bullets.remove(i);
        }
    }
    for(int i = 0; i < enemies.size(); i ++)
    {
        if(enemies.get(i).GetRm())
        {
            enemies.remove(i);
            points ++;
            if(dificult > 5)
            {
                vel = vel + 0.01;
            }
            else
            {
                vel = vel + 0.1;
            }
        }
    }
    for(int i = 0; i < player_bullets.size(); i++)
    {
        if(player_bullets.get(i).GetY() <= 0)
        {
            player_bullets.get(i).ToRemove = true;
        }
    }
    for(int i = 0; i < enemies_bullets.size(); i++)
    {
        if(enemies_bullets.get(i).GetY() >= 700)
        {
            enemies_bullets.get(i).ToRemove = true;
        }
    }
}

void RemoveBullets()
{

    while(player_bullets.size() != 0)
    {
        player_bullets.remove(0);
    }
    while(enemies_bullets.size() != 0)
    {
        enemies_bullets.remove(0);
    }
}

void RemoveEnemies()
{
    while(enemies.size() != 0)
    {
      enemies.remove(0);
    }
}

void MapEdge()
{
    boolean right = false;
    boolean left = false;
    boolean up = false;
    boolean down =false;
    for(int i = 0; i < enemies.size(); i++)
    { 
        if (enemies.get(i).GetX() > 750)
        {
            right = true;
        }
        if (enemies.get(i).GetX() < 50)
        {
            left = true;
        }
        if (enemies.get(i).GetY() < 100)
        {
            up = true;
        }
        if (enemies.get(i).GetY() > 400)
        {
            down = true;
        }
    }
    if(up)
    {
        updown = 1;
    }
    if(down)
    {
        updown = -1;
    }
    if(right)
    {
        for(int i = 0; i < enemies.size(); i++)
        {
            enemies.get(i).SetXdir(-1);
            enemies.get(i).SetYdir(enemies.get(i).GetY() + (40 * updown));
        }
    }
    if(left)
    {
        for(int i = 0; i < enemies.size(); i++)
        {
            enemies.get(i).SetXdir(1);
            enemies.get(i).SetYdir(enemies.get(i).GetY() + (40 * updown));
        }
    }
    if((timer % 70) == 0)
    {
        EnemiesShip aux = enemies.get((int)random(enemies.size()));
        EnemiesBullets e_bullet = new EnemiesBullets((int)aux.GetX(), aux.GetY());
        enemies_bullets.add(e_bullet);
    }
}

void Score()
{
    textFont(font,40);
    fill(0, 255, 61);
    text(points * 10, 20, 680);
}

void HP()
{
    textFont(font,40);
    fill(0, 255, 61);
    text(player.GetLife(), 750, 680);
}

void Level()
{
    textFont(font,40);
    fill(0, 255, 61);
    text("LEVEL " + dificult, 300, 680);
}

void GameOver()
{
    textFont(font);
    fill(255, 0, 0);
    text("GAME", 250, 300);
    text("OVER", 250, 400);
    op = -1;
}
