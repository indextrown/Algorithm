#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

int main() {
    std::ifstream inputFile("2.out");
    std::ifstream inputFile2("try2.out");
    
    std::vector<int> integerArray;
    char ch;

    if (inputFile.is_open()) {
        while (inputFile >> ch) {
            // 각 문자를 정수로 변환하여 벡터에 추가합니다.
            integerArray.push_back(ch - '0');
        }
        inputFile.close();
    } else {
        std::cerr << "Unable to open file";
        return 1;
    }
    
    std::vector<int> integerArray2;
    //char ch;

    if (inputFile2.is_open()) {
        while (inputFile2 >> ch) {
            // 각 문자를 정수로 변환하여 벡터에 추가합니다.
            integerArray2.push_back(ch - '0');
        }
        inputFile2.close();
    } else {
        std::cerr << "Unable to open file";
        return 1;
    }

    
    bool test = true;
    for (int i=0; i<integerArray.size(); i++)
    {
        //cout << integerArray[i] << " " << integerArray2[i];
        if (integerArray[i] != integerArray2[i])
        {
            test = false;
        }
    }
    
    cout << (test ? "success\n" : "retry\n");

    
    
//    for (int i=0; i<integerArray.size(); i++)
//    {
//        //cout << integerArray[i] << " " << integerArray2[i];
//        if (integerArray[i] != integerArray2[i])
//        {
//            cout << " bad" << "\n";
//        }
//        else
//        {
//            cout << "\n";
//        }
//    }
    return 0;
}
