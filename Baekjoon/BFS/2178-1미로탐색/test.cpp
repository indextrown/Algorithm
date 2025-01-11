//
//  test.cpp
//  Algorithm
//
//  Created by 김동현 on 12/28/24.
//

/*
#include <iostream>
#include <vector>
using namespace std;


int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    int N, M;
    string row;
    cin >> N >> M;
    
    // 배열
    vector<vector<int>> maze(N, vector<int>(M));
    
    // 입력
    for (int i=0; i<N; i++) {
        cin >> row;
        for (int j=0; j<M; j++) {
            maze[i][j] = row[j] - '0';
        }
    }
    
    return 0;
}
*/

//#include <iostream>
//#include <vector>
//using namespace std;
//
//int main() {
//    vector<int> v;
//    v.push_back(1);
//    v.push_back(1);
//    v.push_back(1);
//    v.erase(unique(v.begin(), v.end()), v.end());
//    
//    for (const auto &i: v) {
//        cout << i << "\n";
//    }
//    
//    return 0;
//}
