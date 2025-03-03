//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//

#include <string>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> firstPattern = {1, 2, 3, 4, 5};
vector<int> secondPattern = {2, 1, 2, 3, 2, 4, 2, 5};
vector<int> thirdPattern = {3, 3, 1, 1, 2, 2, 4, 4, 5, 5};

vector<int> solution(vector<int> answers) {
    vector<int> answer;         // 가장 문제를 많이 맞춘 사람이 저장될 벡터
    vector<int> matchCnt(3);    // 실제 정답과 비교하여 수포자들의 패턴을 비교해서 맞춘 개수
    
    for (int i=0; i<answers.size(); i++) {
        if (answers[i] == firstPattern[i%firstPattern.size()]) {
            matchCnt[0]++;
        }
        if (answers[i] == secondPattern[i%secondPattern.size()]) {
            matchCnt[1]++;
        }
        if (answers[i] == thirdPattern[i%thirdPattern.size()]) {
            matchCnt[2]++;
        }
    }
    
    // 가장 많이 맞춘 수포자가 얻은 점수
    int max_score = *max_element(matchCnt.begin(), matchCnt.end());
    
    // 가장 많이 맞춘 수포자의 번호를 저장
    for (int i=0; i<3; i++) {
        if (matchCnt[i] == max_score) {
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
