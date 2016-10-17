#ifndef BOARD_H_
#define BOARD_H_
#include <iostream>
#include <stdio.h>
#include <string>
#include <cstdio>
#define board_size 3

class Board{

  private:
    //tick tac toe board
    char **board;
    bool spot_taken(int row,int col, char value);

  public:
    Board();
    ~Board();
    //reset the board
    void reset_board();
    //displays current board state
    void display_board();
    //update board with coordinates
    void update_board(int row,int col,char value);
    //ask user for input
    void player_input();
    //check if the char is valid
    bool valid_char(char input);
    //
    bool valid_position(int row, int col);
};

#endif
