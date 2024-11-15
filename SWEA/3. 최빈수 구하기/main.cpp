//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/15/24.
//

#include <iostream>
using namespace std;

int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL); cout.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    const int N = 1000; // 학생수
    int T;    // 테스트 케이스 수
 
    // 테스트 케이스 수
    cin >> T;
    
    // 테스트 케이스 수만큼 진행
    for(int i=0; i<T; i++) {
        // 테스트 케이스 번호
        int TN;
        cin >> TN;
          
        // 최빈값 저장 배열
        int arr[N] = {0};
        
        // 배열에 저장
        int num;
        
        // 배열에 저장
        for (int j=0; j<N; j++) {
            cin >> num;
            arr[num]+=1;
        }
        
        int mymaxscore = 0; // 점수 j
        int mymaxcount = 0; // 카운트 -> arr[j]
        
        // n번째 테스트 케이스에서 최빈값 구하기
        for (int j=0; j<N; j++) {
            if (arr[j] > mymaxcount || (arr[j] == mymaxcount && j > mymaxscore)) {
                mymaxscore = j;       // 점수
                mymaxcount = arr[j];  // 카운트
            }
        }
        cout << "#" << TN << ": " << mymaxscore << "\n";
    }
    
    
    return 0;
}
