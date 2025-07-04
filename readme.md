# Swift를 이용한 알고리즘 공부 

## [알고리즘 세팅](https://github.com/indextrown/Algorithm/tree/main/0.%20알고리즘%20개념공부)

## 자료구조

| Round |    Name    |                            Swift                             |
| :---: | :--------: | :----------------------------------------------------------: |
|   0   |   Stack    | [Link](https://github.com/indextrown/Algorithm/blob/main/1.%20자료구조/0.%20stack.swift) |
|   1   |   Queue    | [Link](https://github.com/indextrown/Algorithm/blob/main/1.%20자료구조/1.%20queue.swift) |
|   2   |    Heap    | [Link](https://github.com/indextrown/Algorithm/blob/main/1.%20자료구조/2.%20heap.swift) |
|   3   | Dictionary | [Link](https://github.com/indextrown/Algorithm/blob/main/1.%20자료구조/4.%20Dictionary.swift) |




## 개념

| Round |                            Title                             |       Keyword        |
| :---: | :----------------------------------------------------------: | :------------------: |
|   0   | [인접행렬](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-02-17-[알고리즘]%20인접행렬.md) |   adjacency matrix   |
|   1   | [인접리스트](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-02-17-[알고리즘]%20인접리스트.md) |    adjacency list    |
|   2   | [깊이 우선 탐색](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-02-17-[알고리즘]%20깊이%20우선%20탐색%20개념.md) |  Depth First Search  |
|   3   | [너비 우선 탐색](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-02-17-[알고리즘]%20너비%20우선%20탐색%20개념.md) | Breadth First Search |
|   4   | [DFS BFS 비교](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-04-15-[알고리즘]%20DFS%20BFS%20비교%20copy.md) |         비교         |
|   5   | [트리 순회](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/2025-04-15-[알고리즘]%20트리%20순회.md) |         Tree         |



## 백준

|     Round     |                        Title                        |                             C++                              |                            Swift                             |                                                              |
| :-----------: | :-------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | ------------------------------------------------------------ |
| 탐색 알고리즘 |                                                     |                                                              |                                                              |                                                              |
|     1012      | [유기농 배추](https://www.acmicpc.net/problem/1012) | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/1.%201012-유기농%20배추/main.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/1.%201012-유기농%20배추/main.swift) | **Connected Component 개수 구하기** → BFS 또는 DFS 모두 가능. 인접한 배추 묶음을 하나의 영역으로 간주. |
|     2178      |  [미로탐색](https://www.acmicpc.net/problem/2178)   | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/2.%202178-미로탐색/2178-미로탐색.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/2.%202178-미로탐색/main.swift) | **최단 거리 구하기 (BFS)** → (0,0)부터 (N-1,M-1)까지 최소 이동 칸 수를 구함. |
|     2468      |  [안전영역](https://www.acmicpc.net/problem/2468)   |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/3.%202468-안전영역/main.swift) | **Connected Component 개수 구하기** → 모든 높이에 대해 안전 영역의 개수를 구함. BFS/DFS 모두 가능. |
|     2583      | [영역 구하기](https://www.acmicpc.net/problem/2583) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/4.%20%202178-영역%20구하기/main.swift) | **넓이 구하기 + Connected Component** → 직사각형이 그려진 도화지에서 남은 영역의 개수와 넓이를 구함. |
|     1992      |  [쿼드트리](https://www.acmicpc.net/problem/1992)   |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/0.%20알고리즘%20개념공부/2주차/09.%20예제문제/5.%201922-쿼드트리/main.swift) | **분할정복 (재귀, 큰 문제를 하위 문제로 쪼개어 상위 문제를 해결)** → 2차원 배열을 같은 숫자로 구성된 4등분 단위로 압축. 재귀적으로 처리하며 필요 시 괄호로 묶음. Stack으로도 구현 가능. |
|               |                                                     |                                                              |                                                              |                                                              |



## 프로그래머스

| Round  |                            Title                             |                             C++                              |                            Swift                             |      |
| :----: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | ---- |
| 워밍업 |                                                              |                                                              |                                                              |      |
|   1    |                      [배열 정렬하기]()                       | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/1.%20배열%20정렬하기/1.%20배열%20정렬하기.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/1.%20배열%20정렬하기/1.%20배열%20정렬하기.swift) |      |
|   2    |                      [배열 제어하기]()                       | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/2.%20배열%20제어하기/2.%20배열%20제어하기.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/2.%20배열%20제어하기/2.%20배열%20제어하기.swift) |      |
|   3    |                  [두 수를 뽑아서 더하기]()                   | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/3.%20두%20수를%20뽑아서%20더하기/main.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/3.%20두%20수를%20뽑아서%20더하기/main.swift) |      |
|   4    |                         [모의고사]()                         | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/4.%20모의고사/main.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/4.%20모의고사/main2.swift) |      |
|   5    |                       [행렬의 곱셈]()                        |                           [Link]()                           | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/5.%20행렬의%20곱셈/main.swift) |      |
|   6    | [실패율](https://school.programmers.co.kr/learn/courses/30/lessons/42889) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/6.%20실패율/main.swift) |      |
|   7    | [방문 길이](https://school.programmers.co.kr/learn/courses/30/lessons/49994) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/7.%20방문%20길이/main.swift) |      |
|   8    | [올바른 괄호](https://school.programmers.co.kr/learn/courses/30/lessons/12909) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/7889a2b71bb308dac732cf4ffe557dba312d33d8/3.%20Programmers/8.%20올바른%20괄호/main.swift) |      |

