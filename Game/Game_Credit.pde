class Credit
{
    private PFont font = createFont("./Data/fonts/Retro.ttf",100);
    
    public Credit()
    {
    }
    
    public void Show()
    {
        textFont(font,30);
        fill(0, 255, 61);
        text("Create By:", 300, 50);
        fill(255, 145, 0);
        text("Henrique", 315, 200);
        fill(209, 36, 209);
        text("Maria Augusta", 275, 250);
        fill(0, 255, 236);
        text("Eduarda", 315, 300);
        fill(0, 255, 61);
        text("Marcelo", 317, 350);
        fill(27, 2, 247);
        text("Thiago", 335, 400);
    }
}
