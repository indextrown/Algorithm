//
//  후위순회.cpp
//  Algorithm
//
//  Created by 김동현 on 4/15/25.
//

#include <iostream>
using namespace std;

vector<int> adj[100]; // 인접리스트
int visited[100];     // 방문배열


// 후위순회(Postorder Traversal): 자식들 노드를 방문하고 자신의 노드르 방문하는 것
void postOrder(int here) {
    // 1. 방문하지 않았다면 자식노드부터 재귀함수 호출
    if (visited[here] == 0) {
        // 2. 하나밖에 없다면
        if (adj[here].size() == 1) {
            postOrder(adj[here][0]);
        }
        // 2. 두개라면
        if (adj[here].size() == 2) {
            postOrder(adj[here][0]);
            postOrder(adj[here][1]);
        }
        // 3. 방문처리
        visited[here] = 1;
        cout << here << ' ';
    }
}

// 전위순회
void preOrder(int here) {
    // 1. 방문하지 않았다면
    if (visited[here] == 0) {
        // 2. 방문처리
        visited[here] = 1;
        cout << here << ' ';
        
        // 3. 자식노드 탐색
        if (adj[here].size() == 1) {
            preOrder(adj[here][0]);
        }
        if (adj[here].size() == 2) {
            preOrder(adj[here][0]);
            preOrder(adj[here][1]);
        }
    }
}

// 중위순회
void inOrder(int here) {
    // 1. 방문하지 않았다면
    if (visited[here] == 0) {
        // 2. left밖에 없다면 left방문처리후 출력
        if (adj[here].size() == 1) {
            inOrder(adj[here][0]);
            visited[here] = 1;
            cout << here << ' ';
            // 2. 자식도느가 2개라면
        } else if (adj[here].size() == 2) {
            inOrder(adj[here][0]); // 왼쪽
            visited[here] = 1;     // 자신
            cout << here << ' ';
            inOrder(adj[here][1]); // 오른쪽
            // 3. 자식이 아무것도 없다면
        } else {
            visited[here] = 1;
            cout << here << ' ';
        }
    }
}


int main() {
    adj[1].push_back(2); // adj[1][0] = 2
    adj[1].push_back(3); // adj[1][1] = 3
    
    adj[2].push_back(4); // adj[2][0] = 4
    adj[2].push_back(5); // adj[2][1] = 5
    
    int root = 1;
    cout << "전위순회: ";
    preOrder(root);
    cout << "\n";
    memset(visited, 0, sizeof(visited));
    
    cout << "중위순회: ";
    inOrder(root);
    cout << "\n";
    memset(visited, 0, sizeof(visited));
    
    cout << "후위순회: ";
    postOrder(root);
    cout << "\n";
    memset(visited, 0, sizeof(visited));
    return 0;
}

