//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 1/11/25.
//

#include <iostream>
using namespace std;

// MARK: 4방향
const int dy[] = {-1, 0, 1, 0};
const int dx[] = {0, 1, 0, -1};

// MARK: 8방향
const int dy2[] = {-1, -1, 0, 1, 1, 1, 0, -1};
const int dx2[] = {0, 1, 1, 1, 0, -1, -1, -1};

// MARK: 8방향

int main() {
    int x = 0;
    int y = 0;
    for (int i=0; i<4; i++) {
        int ny = y + dy[i];
        int nx = x + dx[i];
        cout << ny << " : " << nx << '\n';
    }
    return 0;
}
