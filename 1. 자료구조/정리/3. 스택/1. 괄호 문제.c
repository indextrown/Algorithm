//
//  2. 괄호 문제.c
//  Algorithm
//
//  Created by 김동현 on 8/22/25.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_STACK_SOZE 100

typedef int element;
typedef struct {
    element *data;  // 포인터
    int capacity;   // 현재 크기
    int top;
} StackType;

// 스택 생성 함수
void init_stack(StackType *s) {
    s->top = -1;
    s->capacity = 1;
    s->data = (element *)malloc(s->capacity * sizeof(element));
}

// 공백 상태 검출 함수
int is_empty(StackType *s) {
    return (s->top == -1);
}

// 포화 상태 검출 함수
int is_full(StackType *s) {
    return (s->top == s->capacity - 1);
}

// 삽입 함수
void push(StackType *s, element item) {
    if (is_full(s)) {
        s->capacity *= 2;
        s->data = (element *)realloc(s->data, s->capacity * sizeof(element));
    }
    // top 값을 1 증가시키고 그 위치에 item 저장
    s->data[++(s->top)] = item;
}

// 삭제 함수
element pop(StackType *s) {
    if (is_empty(s)) {
        fprintf(stderr, "스택 공백 에러\n");
        exit(1);
    }
    // top 값을 가져오고 포인터를 한 칸 아래로 내림
    return s->data[(s->top)--];
}

int check_matching(const char *input) {
    StackType s;
    init_stack(&s);
    size_t n = strlen(input);
    char openCh;
    
    for (size_t i = 0; i<n; i++) {
        char ch = input[i];
        switch (ch) {
            case '(': case '[': case '{':
                push(&s, ch);
                break;
            case ')': case ']': case '}':
                if (is_empty(&s)) return 0;
                
                openCh = pop(&s);
                // 짝이 안맞는 경우를 찾기
                if  (!((openCh == '(' && ch == ')') ||
                       (openCh == '[' && ch == ']') ||
                       (openCh == '{' && ch == '}'))) {
                    return 0;
                }
                break;
        }
    }
    
    free(s.data);
    return is_empty(&s) ? 1 : 0;
}

int main(void) {
    
    char *p = "{ A[(i+1)]=0; }";
    if (check_matching(p)) {
        printf("%s 괄호검사 성공\n", p);
    } else {
        printf("%s 괄호검사 실패\n", p);
    }
    
    return 0;
}
