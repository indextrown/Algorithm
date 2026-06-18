//
//  0. 큐.cpp
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//

#include <iostream>
#include <queue>
using namespace std;

int main() {
    queue<int> q;
    q.push(10);
    q.push(20);
    q.push(30);
    cout << "Front: " << q.front() << "\n";
    
    while (!q.empty()) {
        cout << q.front() << "를 큐에서 삭제했습니다." << "\n";
        q.pop();
    }
    
    cout << "큐가 비어있나요?: " << (q.empty() ? "Yes" : "No") << "\n";
    
    return 0;
}
