#ifndef BOARD_H_
#define BOARD_H_
#include <iostream>
#define board_size 3;

class Board{

  private:
    char **board;
    bool spot_taken(int row,int col, char value);

  public:
    Board();
    ~Board();
    void reset_board();
    void display_board();
    void update_board(int row,int col,char value);


};

#endif
