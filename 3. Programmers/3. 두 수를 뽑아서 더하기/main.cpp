//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//




#include <iostream>
#include <vector>
#include <set>
using namespace std;

vector<int> solution3(vector<int> lst) {
    /*
     4 2 2 1 1 3 4
     2 2 1 1 3 4
     2 1 1 3 4
     1 1 3 4
     1 3 4
     3 4
     4
     */
    
    // 두 수의 합을 저장할 저장 공간
    set<int> sum;
    
    for (int i=0; i<lst.size(); i++) {
        for (int j=i+1; j<lst.size(); j++) {
            sum.insert(lst[i] + lst[j]);
        }
    }
    vector<int> answer(sum.begin(), sum.end());
    return answer;
}

#include <iterator>
void print(vector<int> vec)
{
    copy(vec.begin(), vec.end(), std::ostream_iterator<int>(cout, " "));
    cout << endl;
}

int main()
{
    print(solution3({2, 1, 3, 4, 1}));
    return 0;
}





#include <iostream>
#include <vector>
#include <set>
using namespace std;

// 내가한 방법
vector<int> solution2(vector<int> numbers) {
    vector<int> arr;
    for (int i=0; i<numbers.size(); i++) {
        for (int j=i+1; j<numbers.size(); j++)
        arr.push_back(numbers[i] + numbers[j]);
    }
    sort(arr.begin(), arr.end());
    arr.erase(unique(arr.begin(), arr.end()), arr.end());
    return arr;
}

// 모범 답안
// set은 중복값을 자동으로 제거해주고, 오름차순으로 데이터를 정렬해준다
vector<int> solution(vector<int> numbers) {
    set<int> sum;
    for (int i=0; i<numbers.size(); i++) {
        for (int j=i+1; j<numbers.size(); j++) {
            sum.insert(numbers[i] + numbers[j]);
        }
    }
    vector<int> answer(sum.begin(), sum.end());
    return answer;
}

//void print(vector<int> vec)
//{
//    copy(vec.begin(), vec.end(), std::ostream_iterator<int>(cout, " "));
//    cout << endl;
//}
//
//int main()
//{
//    print(solution({2, 1, 3, 4, 1}));     // 2 3 4 5 6 7
//    print(solution({5, 0, 2, 7}));        // 2 5 7 9 12
//    return 0;
//}
