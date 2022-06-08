class Story
{
    private PFont font = createFont("./Data/fonts/Retro.ttf",100);
    
    public Story()
    {
    }
    
    public void Show()
    {
        textFont(font,30);
        fill(0, 255, 61);
        text("Story", 350, 100);
        text("Um bravo guerreiro solitário lutando", 50, 200);
        text("com seu tanque contra um exército", 25, 250);
        text("de invasores alienígenas do espaço,", 25, 300);
        text("alienígenas do espaço, com a nobre e ", 25, 350);
        text("quase impossível missão de antes que ", 25, 400);
        text("eles alcancem o solo.", 25, 450);
    }
}
