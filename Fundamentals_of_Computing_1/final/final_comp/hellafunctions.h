//hellfunctions.h
//prototypes for all our functions
//Authors: James Marvin, J. Patrick Lacher (jmarvin1,jlacher1)

//dino jump: dinosaur
struct Dino {
	int yVelocity;
	int vCounter;
	int xcenter;
	int ycenter;
} dinos;

//dino jump: obstacles
struct Cactus {
	int xVelocity;
	int xcenter;
	int ycenter; 
} cacti;

//pong: paddles
struct Paddle {
	int xpos;
	int ypos;
	int yvelocity;
} paddles;

//pong: ball
struct Ball{
	int ypos;
	int xpos;
	int xvelocity;
	int yvelocity;
} balls;

//pong: score
struct Score{
	int lscore;
	int rscore;
} scores;

//utility: draws the program's main menu
void draw_main_screen();

//dino jump: runs the game
void dinojump();

//dino jump: draws an instance of the dinosaur to X11
void draw_dino(struct Dino);

//dino jump: draws obstacles to X11
void draw_cactus(struct Cactus);

//dino jump: evaluates if the dinosaur has collided with the obstacle
int dino_collision(struct Dino,struct Cactus);

//utility: converts an int to a string
char *num2str(int n);

//minesweeper: runs the game
void minesweeper();

//minesweeper: resets all tiles in the board to 0
void clearboard();

//minesweeper: popluates the board with mines
void placemines(int);

//minesweeper: marks every tile adjacent to a mine
void placemarkers(int,int);

//minesweeper: corrects any errors in the placemarkers() algorithm
void correctcount();

//minesweeper: draws the board in X11
void buildboard();

//minesweeper: draws the new game button
void drawsmile();

//minesweeper: manages the current game
int playgame();

//minesweeper: prints selected tiles to the X11 board
void setnumbercolor(int,int);

//pong: runs the game
void pong();

//pong: draws the user and ai paddles to X11
void draw_paddles(struct Paddle,struct Paddle);

//pong: draws the ball to X11
void draw_ball(struct Ball);

//pong: draws the play court to X11
void draw_court();

//pong: detects commands and moves the user's paddle
int move_paddlel(struct Paddle);

//pong: ai for the computer's paddle
int move_paddler(struct Paddle);

//pong: evaluates the ball's contact with a paddle
int paddle_contact(struct Paddle,struct Paddle,struct Ball);

//pong: prints the current score to X11
void print_score(struct Score);

//pong: evaluates the ball's contact with the scoring sides of the window
int score_contact(struct Ball);

//pong: evaluates the ball's contact with the non-scoring sides of the window
int vertical_contact(struct Ball);

//pong: evaluates the scores relative to the game over conditions
int gameover(struct Score);