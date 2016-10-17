#include "Board.h"
#include <iostream>
#include <stdio.h>
#include <string>
#include <cstdio>

Board::Board()
{
  board = new char *[board_size];
  for(int i=0; i< board_size; i++)
  {
    board[i]= new char[board_size];
  }
  Board::reset_board();
}
Board::~Board()
{
  for(int i=0; i<board_size;i++)
    delete [] board[i];
  delete[] board;
}
void Board::display_board()
{
  for(int i=0; i< board_size; i++){
    std::cout<< (char)board[i][0]<<" "<<(char)board[i][1]<<" "<<(char)board[i][2]<<"\n";
  }
}
void Board::reset_board()
{
  for(int i=0; i<board_size; i++)
  {
    board[i][0]=' ';
    board[i][1]=' ';
    board[i][2]=' ';
  }
}
void Board::update_board(int row,int col,char value)
{
  //if spot not taken update board
  if(!spot_taken(row,col,value))
  {
    board[row][col]=value;
  }
  else
  {
    //Throw exception
  }
}

/*check the current postion for X o Y*/
bool Board::spot_taken(int row,int col,char value)
{
  //check for valid values
  if(board[row][col]=='X' || board[row][col]=='O' ||
      board[row][col]=='x' || board[row][col]=='o'){
    return true;
  }
  else
    return false;
}
void Board::player_input()
{
  char input;
  do {
    input = getchar();
  } while(!Board::valid_char(input));
}
bool Board::valid_char(char input)
{
  return input=='X' || input=='O' ||
      input=='x' ||input=='o';
}
//check if row and col are valid values
bool Board::valid_position(int row, int col)
{
  return (row >= 1  && row <= 3) && (col >= 1  && col <= 3);
}
