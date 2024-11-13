//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/13/24.
//

// 달팽이 숫자
/*
 
 [배열 생성]
 - N x N 크기의 2차원 배열에서 1 ~ N^2까지 숫자를 시계방향으로 채우겠다
 - 오른쪽 -> 아래 -> 왼쪽 -> 위
 
 [제약사항]
 - 1 <= N <= 10이므로 반복문 + 조건문으로 해결가능
 
 [반복 조건]
 - 다음 이동 위치가 배열의 경계를 벗어나거나 이미 숫자를 채워져 있는 경우 방향 제한
 
 -----> dy
 |
 |
 |
 dx
 
 */

#include <iostream>
#include <vector>
using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    
    int T;
    cin >> T;
     
    // 오른쪽 -> 아래 -> 왼쪽 -> 위
    const int dx[4] = {0, 1, 0, -1}; // 행변화
    const int dy[4] = {1, 0, -1, 0}; // 열변화
    
    
    
    for (int tc=0; tc<T; tc++) {
        int N;
        int x=0, y=0, dir=0;
        cin >> N;
        cout << "#" << tc+1 << "\n";
        
        vector<vector<int>> snail(N, vector<int>(N, 0));
        
        for (int num=1; num<=N*N; num++) {
            snail[x][y] = num;
            
            int nx = x + dx[dir];
            int ny = y + dy[dir];
            
            if (nx<0 || nx>=N || ny<0 || ny>=N || snail[nx][ny]) {
                dir = (dir + 1) % 4;
                nx = x + dx[dir];
                ny = y + dy[dir];
            }
            x = nx;
            y = ny;
        }
        
        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) {
                cout << snail[i][j] << " ";
            }
            cout << "\n";
        }
    }
    
    return 0;
}



