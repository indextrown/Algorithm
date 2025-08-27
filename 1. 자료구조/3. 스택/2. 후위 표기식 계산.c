//
//  2. 괄호 문제.c
//  Algorithm
//
//  Created by 김동현 on 8/22/25.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

int eval(const char *input) {
    StackType s;
    init_stack(&s);
    size_t n = strlen(input);
    
    for (size_t i = 0; i<n; i++) {
        char ch = input[i];
        
        // 피연산자라면
        // if (ch != '+' && ch != '-' && ch != '*' && ch != '/') {
        if (!(ch == '+' || ch == '-' || ch == '*' || ch == '/')) {
            int value = ch - '0';
            push(&s, value);
        }
        
        // 연산자라면 피연산자를 스택에서 제거
        else {
            int op2 = pop(&s);
            int op1 = pop(&s);
            
            switch (ch) {
                case '+': push(&s, op1 + op2) ; break;
                case '-': push(&s, op1 - op2) ; break;
                case '*': push(&s, op1 * op2) ; break;
                case '/': push(&s, op1 / op2) ; break;
            }
            
        }
    }
    
    return pop(&s);
}

int main(void) {
    
    char *str = "82/3-32*+";
    int result = eval(str);
    printf("결과: %d\n", result);
    
    return 0;
}
