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

// 최상단 함수
element peek(StackType *s) {
    if (is_empty(s)) {
        fprintf(stderr, "스택 공백 에러\n");
        exit(1);
    }
    return s->data[s->top];
}

// 연산자 우선순위 반환
int prec(char op) {
    switch (op) {
        case '(': case ')': return 0;
        case '+': case '-': return 1;
        case '*': case '/': return 2;
    }
    return -1;
}

// 중위 표기 수식 -> 후위 표기 수식
void infix_to_postfix(char *exp) {
    char ch, top_op;
    size_t len = strlen(exp);
    StackType s;
    init_stack(&s);
    
    for (size_t i=0; i<len; i++) {
        ch = exp[i];
        
        switch (ch) {
            case '+': case '-': case '*': case '/':
                while (!is_empty(&s) && (prec(ch) <= prec(peek(&s)))) {
                    printf("%c", pop(&s));
                }
                push(&s, ch);
                break;
            case '(':
                push(&s, ch);
                break;
            case ')':
                top_op = pop(&s);
                while (top_op != '(') {
                    printf("%c", top_op);
                    top_op = pop(&s);
                }
                break;
                
            default:
                printf("%c", ch);
                break;
        }
    }
    
    while (!is_empty(&s)) {
        printf("%c", pop(&s));
    }
}



int main(void) {
    char *s = "(2+3)*4+9";
    printf("중위표시수식: %s\n", s);
    printf("후위표기수식: ");
    infix_to_postfix(s);
    printf("\n");

    return 0;
}
