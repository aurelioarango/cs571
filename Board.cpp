#include "Board.h"

Board::Board()
{
  board = new char *[board_size];
  for(int i=0; i< board_size; i++)
  {
    board[i]= new char[];
    board[i]= new char[];
    board[i]= new char[];
  }
  reset_board();
}
Board::~Board()
{
}
void Board::display_board()
{
  for(int i=0; i< board_size; i++){
    cout<< (int)board[i][1]<<" "<<(int)board[i][1]<<" "<<(int)board[i][2]<<endl;
  }
}
void Board::reset_board()
{
  for(int i=0; i<board_size; i++)
  {
    board[i][0]=" ";
    board[i][1]=" ";
    board[i][2]=" ";
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
  if(board[row][col]=='X' || board[row][col]='O' ||
      board[row][col]=='x' || board[row][col]='o')
  {
    return true;
  }
  else
    return false;
}
