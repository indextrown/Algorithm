//
//  sortArray.cpp
//  Algorithm
//
//  Created by 김동현 on 11/26/24.
//

#include <iostream>
#include <vector>
using namespace std;

vector<int> solution(vector<int> arr) {
    sort(arr.begin(), arr.end());
    return arr;
}

// 테스트 코드
#include <iostream>
void print(vector<int> vec)
{
    copy(vec.begin(), vec.end(), std::ostream_iterator<int>(cout, " "));
    cout << endl;
}

int main()
{
    print(solution({1, -5, 2, 4, 3}));      // -5 1 2 3 4
    print(solution({2, 1, 1, 3, 2, 5, 4})); // 1 1 2 2 3 4 5
    print(solution({6, 1, 7}));             // 1 6 7
    
    return 0;
}
