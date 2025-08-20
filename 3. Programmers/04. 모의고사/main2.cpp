//
//  main2.cpp
//  Algorithm
//
//  Created by 김동현 on 5/27/25.
//

#include <string>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> solution(vector<int> answers) {
    vector<int> firstVec({1, 2, 3, 4, 5});
    vector<int> secondVec({2, 1, 2, 3, 2, 4, 2, 5});
    vector<int> thirdVec({3, 3, 1, 1, 2, 2, 4, 4, 5, 5});
    vector<int> scoreBox(3, 0);  // 실제 정답과 비교하여 수포자들의 패턴을 비교해서 맞춘 개수
    vector<int> answer;          // 가장 문제를 많이 맞춘 사람이 저장될 벡터
    
    for (int i=0; i<answers.size(); i++) {
        if (answers[i] == firstVec[i%firstVec.size()]) {
            scoreBox[0] += 1;
        }
        if (answers[i] == secondVec[i%secondVec.size()]) {
            scoreBox[1] += 1;
        }
        if (answers[i] == thirdVec[i%thirdVec.size()]) {
            scoreBox[2] += 1;
        }
    }
    // 가장 많이 맞춘 수포자가 얻은 점수
    int maxScore = *max_element(scoreBox.begin(), scoreBox.end());
    
    // 가장 많이 맞춘 수포자의 번호를 저장
    for (int i=0; i<3; i++) {
        if (scoreBox[i] == maxScore) {
            answer.push_back(i+1);
        }
    }
    
    return answer;
}

#include <iostream>
void print(vector<int> vec) {
    copy(vec.begin(), vec.end(), std::ostream_iterator<int>(cout, " "));
    cout << endl;
}

int main()
{
    print(solution({1, 2, 3, 4, 5}));     // 1
    print(solution({1, 3, 2, 4, 2}));     // 1, 2, 3
    return 0;
}
