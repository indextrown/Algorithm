---
title: "[알고리즘] DFS BFS 비교"
tags: 
- Algorithm
use_math: true
header: 
  teaser: 

---


## DFS BFS 비교
둘다 시간복잡도는 인접리스트로 이루어졌다면 O(V+E)이고, 인접행렬의 경우 O(V^2)가 되는 것은 동일하며 다음과 같은 차이가 있다.
- DFS: 메모리를 덜 쓴다. 절단점 등 구할 수 있다. 코드가 더 짧으며 완전탐색의 경우에 많이 쓴다.
- BFS: 메모리를 더 쓴다(queue가 필요하기 때문). 가중치가 같은 그래프내에서 최단거리를 구할 수 있다. 코드가 길다.

문제에서 "퍼저나간다", "탐색한다" 이 2글자가 있으면 BFS, DFS 생각부터 하자, 