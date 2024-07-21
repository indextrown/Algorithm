//
//  3nplus1.cpp
//  Algorithm
//
//  Created by 김동현 on 7/21/24.
//

#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

ifstream inpfile("1.inp");
ofstream oupfile("3nplus1.out");

string line, result;
int a, b;
int x, y;
int n;

int main()
{
    while (getline(inpfile, line))
    {
        stringstream iss(line);
        iss >> a >> b;
        int count=0;
        int max_count = 0;
        
        x = (a<b ? a : b);
        y = (a>b ? a : b);
        
        for (int i=x; i<=y; i++)
        {
            n = i;
            count = 0;
            
            while (true)
            {
                if (n==1) break;
                if (n%2 != 0) n = 3*n + 1;
                else n /= 2;
                count++;
            }
            
            if (max_count < count)
            {
                max_count = count;
            }
        }
        result += to_string(a) + " " + to_string(b) + " " + to_string(max_count + 1) + "\n";
    }
    oupfile << result;
    inpfile.close();
    oupfile.close();
    return 0;
}

