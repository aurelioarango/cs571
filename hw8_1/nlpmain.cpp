#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

//void initialize_matrix();



int main()
{
  cout <<"starting program"<<endl;
  //matrix that contains probability numbers
  string array_matrix[]= {"null","a","b","c","aa","ab","ac","ba",
                                        "bb","bc","ca","cb","cc"};
  double **pro_matrix;
  pro_matrix = new double * [9];
  for(int i=0; i <9; i++)
  {
    pro_matrix[i]=new double[3];
  }

  //cout <<"finish initializing matrix"<<endl;
  //--------------------------------------------
  for(int i=0; i<9; i++)
  {
    for(int j=0; j<3; j++)
    {
      pro_matrix[i][j]=0;
    }
  }
  //---------------------------------------------
  //cout <<"finish filling matrix"<<endl;
  //get line from file
  string line;
  //get probability
  string prob;
  //opening file
  ifstream nlpProb("nlpProb.txt");
  //check if is a valid file
  double single_pro=0;
  //indeces for matrix
  int i=0;
  int j=0;
  if(nlpProb.is_open())
  {//getting each number at a time
    while(nlpProb>>single_pro){
      pro_matrix[i][j]=single_pro;
      j++;
      if(j==3)
      {
        j=0;
        i++;
      }
    }
  }
  nlpProb.close();
  //Display Probalility matrix --
  char matrix [] ={'a','b','c'};
  for(int i=0; i< 3; i++)
  {
    cout<<matrix[i]<<"\t";
  }
  cout <<endl;
  for(int i=0; i <9; i++)
  {
    for(int j=0; j<3; j++)
    {
      cout << pro_matrix[i][j] <<"\t";
    }
    cout<<endl;
  }

  return 0;
}
