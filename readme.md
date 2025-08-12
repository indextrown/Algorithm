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

|  Round  |                            Title                             |                             C++                              |                            Swift                             |                                                              |
| :-----: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | ------------------------------------------------------------ |
| 워밍업  |                                                              |                                                              |                                                              |                                                              |
|    1    |                      [배열 정렬하기]()                       | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/1.%20배열%20정렬하기/1.%20배열%20정렬하기.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/1.%20배열%20정렬하기/1.%20배열%20정렬하기.swift) | `sort(by:)`, `sorted(by:)`를 이용해 배열을 정렬할 수 있다.   |
|    2    |                      [배열 제어하기]()                       | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/2.%20배열%20제어하기/2.%20배열%20제어하기.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/2.%20배열%20제어하기/2.%20배열%20제어하기.swift) | `sorted(by:)`는 비교 함수를 인자로 받아 정렬 기준을 지정할 수 있다. |
|    3    |                  [두 수를 뽑아서 더하기]()                   | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/3.%20두%20수를%20뽑아서%20더하기/main.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/3.%20두%20수를%20뽑아서%20더하기/main.swift) | **var** set = Set<Int>()로 정의하고,<br />`Set`은 중복 제거에 유용하며 `insert`, `remove`로 관리할 수 있다. |
|    4    |                         [모의고사]()                         | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/4.%20모의고사/main.cpp) | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/4.%20모의고사/main2.swift) | return point<br/>    .sorted { $0.key < $1.key }                       // 1. key 기준 오름차순 정렬<br/>    .filter { $0.value == point.values.max() }  // 2. 가장 큰 value를 가진 항목만 필터링<br/>    .map { $0.key }                                        // 3. 해당 key들만 추출하여 반환 |
|    5    |                       [행렬의 곱셈]()                        |                           [Link]()                           | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/5.%20행렬의%20곱셈/main.swift) |                                                              |
|    6    | [실패율](https://school.programmers.co.kr/learn/courses/30/lessons/42889) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/6.%20실패율/main.swift) | sorted(by:)는 두 요소를 비교하는 함수를 인자로 받아 정렬 기준을 직접 지정할 수 있다. |
|    7    | [방문 길이](https://school.programmers.co.kr/learn/courses/30/lessons/49994) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/7.%20방문%20길이/main.swift) | 좌표 이동 시 중복된 길을 `Set`으로 처리하는 시뮬레이션 문제다. |
| [Stack] |                                                              |                                                              |                                                              |                                                              |
|    8    | [올바른 괄호](https://school.programmers.co.kr/learn/courses/30/lessons/12909) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/7889a2b71bb308dac732cf4ffe557dba312d33d8/3.%20Programmers/8.%20올바른%20괄호/main.swift) | 스택과 카운팅 방식 모두 괄호 짝 검증에 사용될 수 있다.       |
|    9    |                [10진수를 2진수로 표현하기]()                 |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/9.%2010진수를%202진수로%20표현하기/main.swift) | map: 배열 요소에 연산을 적용해 새 배열을 만든다.<br />joined: 문자열 배열의 요소들을 하나의 문자열로 이어 붙이는 함수다. |
|   10    | [괄호 회전하기](https://school.programmers.co.kr/learn/courses/30/lessons/76502?gad_source=1&gad_campaignid=22215033033&gbraid=0AAAAAC_c4nAAQkhwrn5XeOo5DO3ib2W7i&gclid=Cj0KCQjwtMHEBhC-ARIsABua5iSsyPkyF3nIVa6MX3jYIarPW57ZMeFbmAnrAdYhhiBP4cziu7htYtEaAtPBEALw_wcB) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/10.%20괄호%20회전하기/main.swift) | 문자열 슬라이싱과 인덱스 offset을 이용한 회전 구현이 가능하다.<br />.s.index(s.startIndex, offsetBy: i) |
|   11    | [짝지어 제거하기](https://school.programmers.co.kr/learn/courses/30/lessons/12973?gad_source=1&gad_campaignid=22799790467&gbraid=0AAAAAC_c4nAXXXhBZAhHLb75CUqrMKejm&gclid=Cj0KCQjwtMHEBhC-ARIsABua5iQTerKv0kjsDgWcH-8RYHzun7Fq58-3AdDObk7pSrSe1IBaIpzlc5gaAkbvEALw_wcB) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/11.%20짝지어%20제거하기/main.swift) | 스택과 단락평가로 조건 검사를 간결하게 할 수 있다            |
|   12    | [주식가격](https://school.programmers.co.kr/learn/courses/30/lessons/42584) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/12.%20주식%20가격/main.swift) | 알고리즘이 떠오르지 않으면 O(n^2)으로 정확성 테스트 정보 확보하자 |
|   13    | [크레인 인형뽑기 게임](https://school.programmers.co.kr/learn/courses/30/lessons/64061?gad_source=1&gad_campaignid=22799790467&gbraid=0AAAAAC_c4nAbwVKtQQb4_F8Cyojb2437d&gclid=Cj0KCQjwzOvEBhDVARIsADHfJJSDknKOmwVeH3uivFP86lBQWAYdZm3SUtTfYe6Jr-lTkOKYrmmiJroaAm4iEALw_wcB) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/13.%20크레인%20인형뽑기%20게임/main.swift) | `board`열을column)별로 스택 형태로 변환하여 인형 뽑기 연산을 효율적으로 수행할 수 있다. |
|   14    | [표편집](https://school.programmers.co.kr/learn/courses/30/lessons/81303?gad_source=1&gad_campaignid=22799790467&gbraid=0AAAAAC_c4nAbwVKtQQb4_F8Cyojb2437d&gclid=Cj0KCQjwzOvEBhDVARIsADHfJJRI3BmjPXNkuahW0P-DYld7LL1MkosII0rL963_3B74O7h554TL0pgaAre1EALw_wcB) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/14.%20표편집/main.swift) | `up`, `down` 배열을 이용해 연결 리스트 동작을 시뮬레이션하고, <br/> 삭제 행은 스택에 저장해 O(1)로 복구하고, U/D 이동은 연결을 따라 처리한다. |
| [Queue] |                                                              |                                                              |                                                              |                                                              |
|   15    |    [요세푸스 문제](https://www.acmicpc.net/problem/1158)     |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/15.%20요세푸스%20문제/main.swift) | 큐를 사용해 k-1번 회전 후 k번째 원소를 제거하는 과정을 반복하여 제거 순서를 구할 수 있다. |
|   16    | [기능개발](https://school.programmers.co.kr/learn/courses/30/lessons/42586) |                                                              | [Link](https://github.com/indextrown/Algorithm/blob/main/3.%20Programmers/16.%20기능개발/main.swift) | 각 작업의 배포일까지 필요한 날짜를 계산하고, 앞선 작업보다 늦게 끝나는 경우 해당 날짜로 갱신해 같은 날 배포될 기능 개수를 구한다. |

