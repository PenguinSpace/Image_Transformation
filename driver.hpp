#include <iostream>
#include <stdlib.h>
#include <fstream>
using namespace std;

int checkfiles(ifstream& input, ofstream& output) {
  if(input.is_open() == false) {
    cout << "Input file failed to open";
    exit(1);
  }

  if(output.is_open() == false) {
    cout << "Output file failed to open";
    exit(1);
  }

  cout << "Files opened successfully!";

  return(0);
}
