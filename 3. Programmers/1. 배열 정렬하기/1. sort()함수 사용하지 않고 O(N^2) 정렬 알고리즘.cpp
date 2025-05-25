//
//  1. sort()함수 사용하지 않고 O(N^2) 정렬 알고리즘.cpp
//  Algorithm
//
//  Created by 김동현 on 5/26/25.
//

/*
 버블 정렬 시간: 2.72177초
 기본 정렬 시간: 0.000221초
 */

#include <iostream>
#include <vector>
#include <algorithm> // sort를 위해 선언
#include <ctime>     // clock_t를 위해 선언
using namespace std;

// MARK: - 버블 정렬 함수 (O(N^2))
void bubbleSortgo(vector<int> &arr) {
    for (size_t i = 0; i<arr.size()-1; i++) {
        for (size_t j = 0; j<arr.size()-1-i; j++) {
            if (arr[j] > arr[j+1]) {
                swap(arr[j], arr[j+1]);
            }
        }
    }
}

int main() {
    // 숫자 1~30000으로 벡터 채우기
    vector<int> vec(30000);
    
    for (int i=0; i<30000; i++) {
        vec[i] = i + 1;
    }
    
    // 버블 정렬 테스트
    vector<int> bubbleSort = vec;
    clock_t startBubblesSort = clock();
    bubbleSortgo(bubbleSort);
    clock_t endBubbleSort = clock();
    double timeBubbleSort = double(endBubbleSort - startBubblesSort)/CLOCKS_PER_SEC;
    
    // C++ 기본 정렬 테스트
    vector<int> stdSort = vec;
    clock_t startStdSort = clock();
    sort(vec.begin(), vec.end());
    clock_t endStdSort = clock();
    double timeStdSort = double(endStdSort - startStdSort)/CLOCKS_PER_SEC;
    
    cout << "버블 정렬 시간: " << timeBubbleSort << "초" << "\n";
    cout << "기본 정렬 시간: " << timeStdSort << "초" << "\n";
    
    return 0;
}
