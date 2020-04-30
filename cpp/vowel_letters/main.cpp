#include <string>

using namespace std;

char vowels[5] = { 'a', 'e', 'i', 'o', 'u' };

int getCount(const string& inputStr){
  int num_vowels = 0;
  
  for (int i = 0; inputStr[i]; i++)
  {
    for (int j = 0; j < 5; j++)
    {
      if (inputStr[i] == vowels[j])
      {
        num_vowels += 1;
      }
    }
  }
  
  return num_vowels;
}