//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/27/25.
//

#include <string>
#include <vector>
#include <unordered_map>
using namespace std;

string solution(vector<string> participant, vector<string> completion) {
    unordered_map<string, int> dic;
    
    for (int i=0; i<participant.size(); i++) {
        string name = participant[i];
        dic[name] += 1;
    }
    
    for (int i=0; i<completion.size(); i++) {
        string name = completion[i];
        dic[name] -= 1;
        
        // 없어도 됨
//        if (dic[name] == 0) {
//            dic.erase(dic.find(name));
//        }
    }
    
    return dic.begin()->first;
}

#include <iostream>
int main() {
    vector<string> participant = {"leo", "kiki", "eden"};
    vector<string> completion = {"eden", "kiki"};
    
    string answer = solution(participant, completion);
    cout << answer << endl;  
    return 0;
}
