//
//  Trip.cpp
//  Algorithm
//
//  Created by 김동현 on 7/21/24.
//

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <cmath>
using namespace std;


int n;
double r;
ifstream inpfile("2.inp");


int main()
{
    // 기저사례
    while (inpfile >> n && n != 0)
    {
        double sum = 0.0;
        vector<double>arr(n);
        
        for (int i=0; i<n; i++)
        {
            inpfile >> arr[i];
            sum += arr[i];
        }
        
        double avg = round(sum/arr.size() * 100.0) / 100.0;
        double positive_diff = 0.0, negative_diff = 0.0;
        
        for (const auto &i : arr)
        {
            double result = i - avg;
            if (result >= 0.0) positive_diff += result;
            else  negative_diff -= result;
        }

        cout << fixed << setprecision(2) << "$" << min(positive_diff, negative_diff) << endl;
    }
    return 0;
}

