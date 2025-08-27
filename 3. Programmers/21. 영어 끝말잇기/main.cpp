//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/27/25.
//

#include <string>
#include <vector>
#include <iostream>
#include <unordered_set>
using namespace std;

vector<int> solution(int n, vector<string> words) {
    vector<int> answer = { 0, 0 };
    unordered_set<string> set;
    set.insert(words[0]);
    
    for (int i=1; i<words.size(); i++) {
        const int player = (i % n) + 1;
        const int round = (i / n) + 1;
        string before = words[i-1];
        string now = words[i];
        
        //  if (before.back() != now.front() || set.contains(now) || now.size() == 1) {
        if (before.back() != now.front() || set.find(now) != set.end() || now.size() == 1) {
            answer[0] = player;
            answer[1] = round;
            return answer;
        }
        set.insert(now);
    }
    return answer;
}

#include <iostream>
int main() {
    vector<string> words = { "tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank" };
    vector<int> ans = solution(3, words);
    cout << ans[0] << " " << ans[1] << "\n";
}


