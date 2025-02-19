//
//  2_지금 자면 꿈을 꾸지만.cpp 진행중
//  Algorithm
//
//  Created by 김동현 on 7/22/24.
//

#include <iostream>
#include <algorithm>
using namespace std;

// N: 과제개수
// A: 과제완료 초기시간
// B: 시간단축의 기준이 되는 정수
// 1 <= N, A, B <= 100
// 1  <= Ti <= 10000
int N, A, B;
int cur_time, complete1, complete2;
int T[100]; // 과제의 기한

int main()
{
    freopen("input.txt", "r", stdin);
    cin >> N >> A >> B;
    
    for (int i=0; i<N; i++) cin >> T[i];
    sort(T, T+N);
    
    // 1) 우선 잠을 자지 않는 경우
    for (const auto &t : T)
    {
        if (t-cur_time >= A)
        {
            cur_time += A;
            complete1++;
        }
        else break;
    }
    
    cout << complete1 << "\n";
    
    int complete2;
    for (int x=0; x<A; x++)
    {
        int sleep = B * x;
        cur_time = sleep;
        
        for (const auto &t : T)
        {
            if (t >= (A-x))
            {
                cur_time += (A-x);
//                complete2++;
            }
        }
    }
    cout << complete2 << "\n";
    
    
    
    // x범위: 0 ~ A-1
//    int newA;
//    int mymax = 0;
//    for (int x=0; x<A; x++)
//    {
//        // 잠을 먼저 자고 일어남
//        cur_time = B*x;
//        complete2 = 0;
//        
//        if (T[x]-cur_time >= (A-x))
//        {
//            cur_time += (A-x);
//            complete2++;
//        }
//        else break;
//        if (mymax < complete2)
//        {
//            mymax = complete2;
//        }
//    }
//    cout << max(complete1, mymax) << "\n";
    
//    int mymax = 0;
//    for (int x=0; x<A; x++)
//    {
//        // 잠을 먼저 자고 일어남
//        cur_time = B*x;
//        complete2 = 0;
//        for (const auto &t : T)
//        {
//            if (t-cur_time >= (A-x))
//            {
//                cur_time += (A-x);
//                complete2++;
//            }
//            else break;
//            cout << B*x << "\n";
//        }
//        if (mymax < complete2)
//        {
//            mymax = complete2;
//        }
//    }
//    cout << complete1 << " : " << mymax << "\n";
//    cout << max(complete1, mymax) << "\n";
    return 0;
}
