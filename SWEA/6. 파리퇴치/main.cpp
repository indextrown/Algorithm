//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/16/24.
//

#include <iostream>
#include <vector>
#import <queue>
using namespace std;

int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    int T;
    int N, M;
    cin >> T;
    
    for (int tc=0; tc<T; tc++)
    {
        cin >> N >> M;
        vector<vector<int>> arr(N, vector<int>(N));
        
        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) {
                cin >> arr[i][j];
            }
        }
        
        int maxscore=0;
        
        // MxM 크기의 모든 사각형 탐색
        for (int i=0; i<=N-M; i++)  {
            for (int j=0; j<=N-M; j++) {
                
                int score = 0;
                
                // MxM 크기 내부 값 합산
                for (int x=0; x<M; x++) {
                    for (int y=0; y<M; y++) {
                        score += arr[i+x][j+y];
                    }
                }

                // 최대 점수 갱신
                if (score > maxscore) maxscore = score;
            }
        }
        cout << "#" << tc+1 << " " << maxscore << "\n";
    }
    return 0;
}



