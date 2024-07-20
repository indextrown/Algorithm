//
//  평행사변형.cpp
//  Algorithm
//
//  Created by 김동현 on 7/19/24.
//

#include <iostream>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <cmath>
using namespace std;

struct Point
{
    int x, y;
};


inline bool compare(const Point &a, const Point &b)
{
    return a.x < b.x;
}

inline long long distance(const Point &a, const Point &b)
{
//    return sqrt(pow(b.x-a.x, 2) + pow(b.y-a.y, 2));
    return pow(b.x-a.x, 2) + pow(b.y-a.y, 2);
}


fstream inpfile("1.inp");
ofstream outfile("parallelogram.out");

Point point[4];
string line;

int main()
{
    // file I/O
    while (true)
    {
        getline(inpfile, line);
        istringstream iss(line);
        
        for (int i=0; i<4; i++)
        {
            iss >> point[i].x >> point[i].y;
        }
        
        // 기저사례
        if (point[0].x == 0 &&  point[0].y == 0 &&
            point[1].x == 0 &&  point[1].y == 0 &&
            point[2].x == 0 &&  point[2].y == 0 &&
            point[3].x == 0 &&  point[3].y == 0) break;
        
        // x좌표 기준 오름차순 정렬
        sort(point, point+4, compare);
        
        
        if (distance(point[0], point[1]) == distance(point[2], point[3]) && distance(point[0], point[2]) == distance(point[1], point[3]))
        {
            outfile << 1 << "\n";
        }
        else
        {
            outfile << 0 << "\n";
        }
    }
    inpfile.close();
    outfile.close();
    return 0;
}






//#include <iostream>
//#include <fstream>
//#include <sstream>
//using namespace std;
//
//struct Point
//{
//    int x, y;
//};
//
//fstream inpfile("1.inp");
//Point point[4];
//string line;
//
//int main()
//{
//    while (getline(inpfile, line))
//    {
//       istringstream iss(line);
//        for (int i=0; i<4; i++)
//        {
//            iss >> point[i].x >> point[i].y;
//            cout << point[i].x << " : " << point[i].y << "\n";
//        }
//    }
//    
//    return 0;
//}
