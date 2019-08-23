#include "driver.hpp"


int main(int argc, const char * argv[]) {
  ifstream input;
  ofstream output;

  input.open(argv[1]);
  output.open(argv[2]);

  checkfiles(input, output);

  cout << endl;

  input.close();
  output.close();
  return(0);
}
