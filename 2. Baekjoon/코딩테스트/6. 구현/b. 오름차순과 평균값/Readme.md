# 📌 Java 코테 입출력 정리

## 1️⃣ 전체 입력 흐름 한 장 요약

System.in  
→ InputStreamReader (바이트 → 문자)  
→ BufferedReader (빠른 줄 단위 입력)  
→ readLine() ("10 9 8 7")  
→ StringTokenizer ("10", "9", "8", "7")  
→ nextToken()  
→ Integer.parseInt() (String → int)

---

## 2️⃣ 핵심 클래스 / 메서드 개념

### System.in
- 키보드 입력의 원본 (InputStream)
- 직접 쓰기엔 저수준

### InputStreamReader
- 바이트 입력을 문자 입력으로 변환
- 인코딩 처리

### BufferedReader
- 빠른 입력
- 줄 단위 입력 가능
- 코테 표준

### readLine()
- 한 줄을 그대로 String으로 읽음
- 공백 포함
- 숫자 분리는 안 함

### StringTokenizer
- 문자열을 공백 기준으로 분해
- 토큰 단위 접근 가능

### nextToken()
- 다음 토큰 하나 반환
- 호출할 때마다 이동

### Integer.parseInt()
- 문자열 → 정수
- 공백 포함 문자열은 에러

---

## 3️⃣ 입력 형식별 정석 코드

### 한 줄에 하나 (N)

```
10
```

```java
int n = Integer.parseInt(br.readLine());
```

---

### 한 줄에 여러 개 (배열)

```
10
10 9 8 7 6
```

```java
int n = Integer.parseInt(br.readLine());
int[] arr = new int[n];

StringTokenizer st = new StringTokenizer(br.readLine());
for (int i = 0; i < n; i++) {
    arr[i] = Integer.parseInt(st.nextToken());
}
```

---

### 한 줄에 여러 값 (N M)

```
3 5
```

```java
StringTokenizer st = new StringTokenizer(br.readLine());
int n = Integer.parseInt(st.nextToken());
int m = Integer.parseInt(st.nextToken());
```

---

### 한 줄에 하나씩 N개

```
5
1
2
3
4
5
```

```java
int n = Integer.parseInt(br.readLine());
int[] arr = new int[n];

for (int i = 0; i < n; i++) {
    arr[i] = Integer.parseInt(br.readLine());
}
```

---

## 4️⃣ 출력(Output)

```java
System.out.println(x);
System.out.print(x + " ");
System.out.printf("%.2f%n", avg);
```

---

## 5️⃣ 평균 계산 주의

```java
double avg = (double) sum / n;
```

---

## 6️⃣ 자주 터지는 실수

1. "10 9 8"을 parseInt에 바로 넣기
2. Tokenizer를 readLine 전에 생성
3. 입력 형식과 코드 불일치
4. Scanner로 대량 입력
5. int / int 평균 계산

---

## 7️⃣ 코테용 입력 템플릿

```java
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

int n = Integer.parseInt(br.readLine());
StringTokenizer st = new StringTokenizer(br.readLine());

int[] arr = new int[n];
for (int i = 0; i < n; i++) {
    arr[i] = Integer.parseInt(st.nextToken());
}
```

---

## 8️⃣ 로컬 테스트용

```java
System.setIn(new FileInputStream("input.txt"));
```

(제출 전 제거)

---

## 9️⃣ 한 줄 요약

Java 코테 입력 = BufferedReader → readLine → StringTokenizer → parseInt
