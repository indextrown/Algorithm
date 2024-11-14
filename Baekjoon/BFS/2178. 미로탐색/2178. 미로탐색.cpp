//
//  2178. 미로탐색.cpp
//  Algorithm
//
//  Created by 김동현 on 7/26/24.
//

/*
 BFS(너비 우선 탐색)
 - 시작 노드를 방문한 후 시작 노드에 있는 인접한 모든 노드들을 탐색 방법
 - 최단 경로 탐색 or 임의 경로 탐색
 - 시작점(0, 0)
 - 도착점(N-1, M-1)
 
 참고링크 - https://better-tomorrow.tistory.com/entry/DFS-BFS-이해하기
 
 
 */

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// '0'의 ASCII값은 48
// '1'의 ASCII값은 49
// 1 - 0.  49 - 48
int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL); cout.tie(NULL);
//    freopen("input.txt", "r", stdin);
    
    int N, M;
    cin >> N >> M;
    
    // 배열
    vector<vector<int>> maze(N, vector<int>(M));
    vector<vector<bool>> visited(N, vector<bool>(M, false));
    
    // 상, 하, 좌, 우
    const int dx[] = {-1, 1, 0, 0}; // 행
    const int dy[] = {0, 0, -1, 1}; // 열
   
    // input
    for (int i=0; i<N; i++) {
        string row;
        cin >> row;
        for (int j=0; j<M; j++) {
            maze[i][j] = row[j] - '0'; // 문자를 정수로 변환
        }
    }
    
    // BFS 초기 설정
    queue<pair<int, int>> q;
    q.push({0, 0});
    visited[0][0] = true;
    
    while (!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();
        
        // 상하좌우 탐색
        for (int i=0; i<4; i++) {
            int nx = x + dx[i];
            int ny = y + dy[i];
            
            // 경계 조건 및 방문 조건 확인(다음칸으로 이동가능할 때)
            // 경계 조건 + 이동가능 + 방문안함
            if (nx>=0 && nx<N && ny>=0 && ny<M && maze[nx][ny] == 1 && !visited[nx][ny]) {
                visited[nx][ny] = true;
                maze[nx][ny] = maze[x][y] + 1;
                q.push({nx, ny});
            }
        }
    }
    
    cout << maze[N-1][M-1] << "\n";
    return 0;
}



