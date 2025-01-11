//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 12/26/24.
//

#include <iostream>
using namespace std;

int scores[] = {1, 2, 3, 4, 5};

int get_max_score(int n) {
    int largest;
    largest = scores[0];
    
    for (int i=1; i<n; i++) {
        if (scores[i] > largest) {
            largest = scores[i];
        }
    }
    
    return largest;
}

int main() {
    //int n = sizeof(scores)/sizeof(scores[0]);
    int n = static_cast<int>(size(scores));
    cout << get_max_score(n) << "\n";
}
