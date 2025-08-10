//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/10/25.
//

#include <iostream>
#include <vector>
using namespace std;


int solution(vector<vector<int>> board, vector<int> moves) {
    
    int count = 0;
    int boardSize = static_cast<int>(board.size()); // ← 명시적 변환
    vector<int> bucket;
    vector<vector<int>> stacks(boardSize);
    
    // for (size_t i = boardSize; i-- > 0; ) {
    for (int i = boardSize - 1; i >= 0; i--) {
        for (int j=0; j<boardSize; j++) {
            int doll = board[i][j];
            if (doll != 0) {
                stacks[j].push_back(doll);
            }
        }
    }
    
    for (const auto& move : moves) {
        if (!stacks[move-1].empty()) {
            int doll = stacks[move-1].back();
            stacks[move-1].pop_back();
            
            if (bucket.empty()) {
                bucket.push_back(doll);
            } else {
                if (bucket.back() == doll) {
                    bucket.pop_back();
                    count += 2;
                } else {
                    bucket.push_back(doll);
                }
            }
        }
    }
    return count;
}

int main() {
    cout << solution( {
        {0, 0, 0, 0, 0},
        {0, 0, 1, 0, 3},
        {0, 2, 5, 0, 1},
        {4, 2, 4, 4, 2},
        {3, 5, 1, 3, 1}
    }, {1, 5, 3, 5, 1, 2, 1, 4} )
    << endl; // 4
    return 0;
}
