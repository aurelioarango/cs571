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
    board[i][0]='1';
    board[i][1]='2';
    board[i][2]='3';
  }
}
void Board::update_board(int row,int col,char value)
{
  if(!spot_taken(row,col,value))
  {
    board[row][col]=value;
  }
  else
  {
    //Throw exception
  }
}
bool Board::spot_taken(int row,int col,char value)
{
  if(board[row][col]=='X' || board[row][col]=='O' ||
      board[row][col]=='x' || board[row][col]=='o')
  {
    return true;
  }
  else
    return false;
}
