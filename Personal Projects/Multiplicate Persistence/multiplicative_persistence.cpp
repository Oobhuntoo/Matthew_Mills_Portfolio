/*
@Author: Matthew Mills
@Title: Multiplicative Persistence
@Purpose: Calculates multiplicative persistence of a given integer
@Date: 04/20/2019
*/


#include <iostream>
#include <cmath>
using namespace std;

int Persist(int n, int c);
int Prod(int n);
int Digit(int n, int ith);

int main()
{
	int n;
	int c = 0;
	int final_var = 1;
	
	cout << "Enter the number you want to test the multiplicative persistence of" << endl;
	cin >> n;

	while (n < 0)
	{
		cout << "Error: the test value can only be non-negative" << endl;
		cout << "Enter in a non-negative integer" << endl;
		cin >> n;
	}

	if (0 <= n && n < 10)
		cout << "The multiplicative persistence of " << n << " is 0" << endl;
	
	else
	    final_var = Persist(n, c);

	cout << "The multiplicative persistence of " << n << " is " << final_var << endl;

	return 0;
}

int Persist(int n, int c)
{

	if (n < 10)
	{
		cout << n << endl;
		return c;
	}

	else
	{
		int P;
		P = Prod(n);
		cout << P << endl;
		c++;
		Persist(P, c);
	}
}

int Prod(int n)
{
	int P = 1;
	int ith = 1;

	int upper_bound = int(floor(log10(n))) + 1;

	for (int j = 1; j <= upper_bound; j++)
	{
		ith = Digit(n, j);
		P = P * ith;
		
	}
	return P;
}

int Digit(int n, int ith) {

	int n_i = floor((n - int(floor(n / pow(10, ith))) * int(pow(10, ith))) / int(pow(10, ith - 1)));
	return n_i;

}