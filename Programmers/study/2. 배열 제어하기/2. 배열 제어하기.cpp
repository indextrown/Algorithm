//
//  2. 배열 제어하기.cpp
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//

#include <iostream>
#include <vector>
using namespace std;

bool compare(int a, int b) {
    return a > b;
}

// sort(시작 반복자, 끝 반복자)
// sort(시작 반복자, 끝 반복자, 비교 함수)    비교 함수는 반환값이 false일 때 원소의 위치를 바꾼다
// sort(v.rbegin(), v.rend())
vector<int> solution(vector<int> lst) {
    //sort(lst.rbegin(), lst.rend());
    sort(lst.begin(), lst.end(), compare);
    lst.erase(unique(lst.begin(), lst.end()), lst.end());
    return lst;
}

#include <iterator>
void print(vector<int> vec)
{
    copy(vec.begin(), vec.end(), std::ostream_iterator<int>(cout, " "));
    cout << endl;
}

int main()
{
    print(solution({4, 2, 2, 1, 1, 3, 4})); // 4 3 2 1
    print(solution({2, 1, 1, 3, 2, 5, 4})); // 5 4 3 2 1
    
    return 0;
}
