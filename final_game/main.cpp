
#include <iostream>
#include <stdio.h>
#include <string>
#include <cstdio>

#include "Board.h"

using namespace std;

int main()
{

  Board board;
  board.display_board();
  board.update_board(1,1,'X');
  cout<<endl;
  //board.display_board();

  return 0;
}
