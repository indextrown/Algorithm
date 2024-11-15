# 그래프 이론 (Graph Theory)

## 그래프 (Graph)
그래프는 정점과 간선으로 이루어진 집합이다.

## 정점 (Vertex)
- 노드라고도 불리며, 그래프를 형성하는 기본 단위이다.
- 분할할 수 없는 객체로 "점"으로 표현되는 위치, 사람, 물건 등이 될 수 있다.

## 간선 (Edge)
- 정점을 잇는 선을 의미한다. 관계, 경로 등이 될 수 있다.
- 사람과 사람 간의 관계도 포함된다.

## 예시 1
- "어떠한 위치나 어떠한 사람"으로부터 "무언가를 통해 간다"라고 했을 때,
  - 정점: "어떠한 위치나 어떠한 사람"
  - 간선: "무언가를 통해 간다"

## 예시 2
- 남자가 여자를 좋아한다. 초콜릿을 집 앞에 두고 카톡을 보냈지만, 다음 날 초콜릿은 사라지고 카톡은 읽씹당했다.
  - 정점: 남자, 여자
  - 간선: 좋아한다는 감정

## 단방향 간선 (Directed Edge)
- 하나의 방향만 있는 간선이다.
- 예: 남자가 여자를 짝사랑함

## 양방향 간선 (Bidirectional Edge)
- 양방향이 있는 간선이다.
- 예: 남자와 여자가 서로 사랑함

## 참고 (관례적)
- `u`: from으로 사용된다.
- `v`: to로 사용된다.

## 예시
- `u -> v` 경로가 4가지 있을 때
- `u <- v` 경로가 7가지 있을 때
  - `u`의 outdegree가 4개이다.
  - `u`의 indegree가 7개이다.

## 가중치 (Weight)
- 정점과 정점 사이에 드는 비용을 의미한다. 즉, 간선의 비용을 가중치라고 한다.

## 예시
- 진주에서 서울까지 택시로 간다고 가정
  - 시간: 1시간 30분
  - 요금: 50,000원
  - 통행료: 3,500원
  - 연료비: 15,000원
  - ==> 전부 비용, 즉 가중치이다.

## 알고리즘 문제에서의 예시
- 정점에서 어떠한 정점으로 이동해야 할 때 `n`칸을 움직여야 한다.
  - 여기서 `n`칸이 가중치이다.

## 트리
- 자신노드와 부모노드로 이루어진 계층적인 구조를 가지며 무방향 그래프의 일종이자 사이클이 없는 자료구조이다
- 부모: 위에 있는거
- 자식: 아래 있는거
- 계층적 구조이다(회사조직도)
- 트리를 설명할때는 무방향 그래프 사용
- 그래프의 일종이다
- 정점과 간선의 집합 = 그래프인데 그중에서 트리라는 특징을 가진 자료구조를 트리라고 한다
- Vertex - 1 = E
- 트리내의 어떤 노드로도 이동 가능(그냥 그래프이면 불가능할수도)
- 대부분 알고리즘은 루트노드를 먼저 확인하고 루트부터 시작하면 잘 풀림
- 루트노드, 내부노드, 리프노드
- 높이: 루트노드에서 리프노드까지 가장 긴 길이

## 그래프
- 방향그래프: directed graph
- 무방향그래프: undirected graph
- 방향성이 있는 간선: directed Edge(arc)
 
## 이진탐색트리
- 시간복잡도: 
    - 군형잡힌 이진트리: 탐색, 삽입, 삭제 모드 O(logN)
    - 균형이진트리 높이: logN에 가까운 값
    - 완전이진트리인 높이: log(n+1) - 1
- 자식 노드의 수: 2이하
- 검색에 유리
- 선형적 = 직선적이다 = O(N)시간복잡도가 되어버림(최악의 경우)
- 균형잡게 하도록 하는법: AVL, RedBlack 트리

## Map
- 삽입, 탐색, 삭제, 수정의 시간복잡도: O(logN)을 보장받음
    - 균형잡힌 레드블랙트리를 기반으로 구현되었기 때문 

## 균형이진트리
- AVL
- RedBlackTree

## 참고
- 정점과 간섭의 집합 = 그래프
- 그래프를 컴퓨터에 알려주는 방법
- 인접 행렬과 인접 리스트
- 인접 = 연결되어있다
- 화살표없는 간선 = 무방향간선 = 양방향간선

## 인접행렬
- 정점과 간선의 관계를 나타내는 Bool타입의 정사각형 행렬
- from 정점에서 to까지 간선이 있으면 1 없으면 0
- [면접] 인접 행렬이란?
- [대답] 인접 행렬이란 그래프에서 정점과 간선의 관계를 나타내는 bool 타입의 정사각형 행렬을 의미합니다. 정사각형 행렬의 각 요소가 0 또는 1이라는 값으로 가정을 의미하는데요, 0은 두 정점 사이의 경로가 없음을 의미하며 1은 두 정점 사이의 경로가 있음을 의미합니다. 

