//Aurelio aRango

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>


using namespace std;
double get_probability(string string_matrix [39],double pro_matrix[39],string find);

int main()
{
  cout <<"Probablilty Matrix\t"<<endl;
  //unordered_map<string,double> pro_table;
  double single_pro=0;
  string string_matrix[]= {"P(a|null)","P(b|null)","P(c|null)"
                            ,"P(a|a)","P(b|a)","P(c|a)"
                            ,"P(a|b)","P(b|b)","P(c|b)"
                            ,"P(a|c)","P(b|c)","P(c|c)"
                            ,"P(a|aa)","P(b|aa)","P(c|aa)"
                            ,"P(a|ab)","P(b|ab)","P(c|ab)"
                            ,"P(a|ac)","P(b|ac)","P(c|ac)"
                            ,"P(a|ba)","P(b|ba)","P(c|ba)"
                            ,"P(a|bb)","P(b|bb)","P(c|bb)"
                            ,"P(a|bc)","P(b|bc)","P(c|bc)"
                            ,"P(a|ca)","P(b|ca)","P(c|ca)"
                            ,"P(a|cb)","P(b|cb)","P(c|cb)"
                            ,"P(a|cc)","P(b|cc)","P(c|cc)"};
  double pro_matrix[39];
  for(int i=0; i<39;i++)
  {
    pro_matrix[i]=0;
  }

  ifstream nlpProb("nlpProb.txt");
  int i=0;
  int j=0;
  if(nlpProb.is_open())
  {
    while(nlpProb>>single_pro)
    {

        pro_matrix[i]=single_pro;
        i++;
    }
  }
  //--Display Table
  for(int i=0; i<39; i++)
  {
    if(i==0)
    {
      cout << "P("<<string_matrix[i]<<")="<<pro_matrix[i]<<"\t";
    }
    else if(i%3==2)
    {
      cout << "P("<<string_matrix[i]<<")="<<pro_matrix[i]<<endl;

    }
    else
    {
      cout << "P("<<string_matrix[i]<<")="<<pro_matrix[i]<<"\t";
    }
  }
  cout<<endl;
  cout<<"Program will ask for 3 words and calculate probalility for each one"<<endl;
  double probability=0;
  for (i =0; i<3; i++)
  {
    string word ;
    cout <<"Enter single word(any combinations of a, b or c)): ";
    cin >> word;
    cout<<endl;
    cout <<word.size() <<endl;

    probability=0;
    //cout<<"probability "<<probability<<endl;
    //cout<<word.substr(0,1)<<endl;
    //parsing string to get probability
    for(int i=0; i<word.size();i++)
    {
      if(i==0)
      {
        string temp = "P("+word.substr(0,i+1) +"|null)";
        probability = get_probability(string_matrix,pro_matrix,temp);
      }
      else if(i==1)
      {
        //cout<<"here"<<endl;
        cout<<"2"<<endl;
        string temp = "P("+word.substr(i,i) +"|"+word.substr(i-1,i)+")";
        probability *= get_probability(string_matrix,pro_matrix,temp);
      }
      else if(i==2)
      {
        cout<<"3"<<endl;
        string temp = "P("+word.substr(i+1,i) +"|"+word.substr(i-2,i)+")";
        probability *= get_probability(string_matrix,pro_matrix,temp);
      }
      else
      {
        cout<<"4"<<endl;
        string temp = "P("+word.substr(i,i-1) +"|"+word.substr(i-2,i)+")";
        probability *= get_probability(string_matrix,pro_matrix,temp);
      }

    }
    //displaying probability
    cout<<"Probability of word " << word <<" is "<<probability<<endl;
  }


  return 0;
}
//function to look for the probability
double get_probability(string string_matrix[39], double pro_matrix[39],string word)
{
  //cout<<word<<"=";
  int found=-1;
  double temp=0;
  //look in matrix for string

  for(int i=0; i<39; i++)
  {
    cout <<"looking " <<word <<" "<<string_matrix[i]<<" "<<endl;
    if(word == string_matrix[i])
    {
      cout <<"looking " <<word <<" "<<string_matrix[i]<<" "<<endl;
      cout<<"Probability of "<<word;
      found=i;
    }
  }
  //get the pro value
  temp = pro_matrix[found];
  cout<<" = "<<temp<<" "<<endl;
  return temp;
}
