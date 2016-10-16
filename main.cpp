
#include <iostream>
#include <stdio.h>
#include <string>
#include <cstdio>

using namespace std;

char board[3][3];

void ini_board()
{
    //Initialize tic tac toe board
    for(int i=0; i<3; i++)
    {
      board[i][0]=i;
      board[i][1]=i;
      board[i][2]=i;
    }
}
void display_board()
{
  for(int i=0; i<3; i++){
    cout<< (int)board[i][1]<<" "<<(int)board[i][1]<<" "<<(int)board[i][2]<<endl;
    //printf("%s \n", row.c_str() );
  }
  cout <<"Done"<<endl;
}
int main()
{

  ini_board();
  display_board();
  return 0;
}
