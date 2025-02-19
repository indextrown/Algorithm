//
//  sjf.cpp
//  Algorithm
//
//  Created by 김동현 on 7/30/24.
//

#include <iostream>
#include <sstream>
#include <vector>
using namespace std;

int N;
int t;
string line;

int main()
{
    freopen("1.inp", "r", stdin);
    cin >> N;
    cin.ignore();
    
    cout << N << "\n";
    vector<vector<int>> v(N); // N개의 행을 가진 이중 벡터 선언
    
    for (int i=0; i<N; i++)
    {
        getline(cin, line);
        stringstream ss(line);
        
        while (ss >> t)
        {
            if (t == -1) continue;
            cout << t << "\n";
            v[i].push_back(t);
        }
    }
    
    return 0;
}
