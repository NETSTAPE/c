#include <iostream>
#include <cmath>
#include <Windows.h>

using namespace std;

int getDigitsSumInNum(int num) { return ceil(log10(abs(num + 0.5))); }

int main()
{
	int k = 1000000000;
	int num = 0;
	int armCount = 0;
	
	for (int i = 0; i < k; i++)
	{
		int dNum = getDigitsSumInNum(i);
		
		int one = 	i % 10;
		int two = 	i % 100 / 10;
		int three = i % 1000 / 100;
		int four = 	i % 10000 / 1000;
		int five = 	i % 100000 / 10000;
		int six = 	i % 1000000 / 100000;
		int seven = i % 10000000 / 1000000;
		int eight = i % 100000000 / 10000000;
		int nine = 	i % 1000000000 / 100000000;
		int ten = 	i % 10000000000 / 1000000000;
			
 		int a = pow(ten, dNum) + pow(nine, dNum) + pow(eight, dNum) + pow(seven, dNum) + pow(six, dNum) + pow(five, dNum) + pow(four, dNum) + pow(three, dNum) + pow(two, dNum) + pow(one, dNum);
		
		if (a == i)
		{
			armCount++;
			cout << "Armstrong number " << armCount << ":\t" << a << endl;
		}
	}
	
	return 0;
}