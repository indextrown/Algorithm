//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 1/9/25.
//

#include <iostream>
using namespace std;

// visited배열: 방문한 정점은 다시 방문하지 않도록 해당 정점에 1로 색칠을 해둔다
const int V = 10;
bool a[V][V], visited[V];

void go(int from) {
    visited[from] = 1;
    cout << from << "\n";
    
    for (int i=0; i<V; i++) {
        if (a[from][i] && !visited[i]) go(i);
        // if (visited[i]) continue;
        // if (a[from][i]) go(i);
    }
    return;
}

int main() {
    
    // 1번과 2번, 1번과 3번, 3번과 4번은 연결되어있다
    a[1][2] = 1; a[1][3] = 1; a[3][4] = 1;
    a[2][1] = 1; a[3][1] = 1; a[4][3] = 1;
    
    for (int i=0; i<V; i++) {
        for (int j=0; j<V; j++) {
            // i부터 j까지 가는 간선이 존재하고 해당 정점을 방문하지 않았다면
            if (a[i][j] && !visited[i]) {
                go(i);
            }
        }
    }
    return 0;
}




