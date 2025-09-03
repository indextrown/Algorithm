//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/21/25.
//

#include <iostream>
using namespace std;

int main() {
    // string -> int
    string str = "7";
    int num = stoi(str);
    cout << num << "\n";
    
    // char -> int
    char c = 'c';
    int num2 = (int)c;
    cout << num2 << "\n";
    
    int a = 'A';
    cout << a << "\n";
    
    char b = 97;
    cout << b << "\n";
    
    return 0;
}
