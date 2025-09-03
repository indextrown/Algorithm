//
//  BFS 기초.cpp
//  Algorithm
//
//  Created by 김동현 on 7/26/24.
//

#include <iostream>
using namespace std;

const int dy[] = {-1, 0, 1, 0};
const int dx[] = {0, 1, 0, -1};

const int dyy[] = {-1, -1, 0, 1, 1, 1, 0, -1};
const int dxx[] = {0, 1, 1, 1, 0, -1, -1, -1};


int main()
{
    int y=0, x=0;
    for (int i=0; i<4; i++)
    {
        int ny = y + dy[i];
        int nx = x + dx[i];
        cout << ny << " : " << nx << "\n";
    }
    cout << "\n";
    
    int yy=0, xx=0;
    for (int i=0; i<8; i++)
    {
        int ny = yy + dyy[i];
        int nx = xx + dxx[i];
        cout << ny << " : " << nx << "\n";
    }

    return 0;
}

