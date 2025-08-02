//
//  0. 스택.c
//  Algorithm
//
//  Created by 김동현 on 8/2/25.
//

#include <stdio.h>
#include <stdlib.h>

#define MAX_STACK_SIZE 100
typedef int element;
typedef struct {
    element data[MAX_STACK_SIZE];
    int top;
} Stack;

//element stack[MAX_STACK_SIZE];
//int top = -1;

// 스택 초기화 함수
void initStack(Stack *s) {
    s->top = -1;
}

// 공백 검출
int isEmpty(Stack *s) {
    return (s->top == -1);
}

// 포화 상태
int is_full(Stack *s) {
    return (s->top == (MAX_STACK_SIZE - 1));
}

// 삽입
void push(Stack *s, element item) {
    if (is_full(s)) {
        fprintf(stderr, "스택 포화 에러\n");
        return;
    }
    s->data[++(s->top)] = item;
}

// 삭제
element pop(Stack *s) {
    if (isEmpty(s)) {
        fprintf(stderr, "스택 공백 에러\n");
        exit(1);
    }
    return s->data[(s->top)--];
}

// 피크
element peek(Stack *s) {
    if (isEmpty(s)) {
        fprintf(stderr, "스택 공백 에러\n");
        exit(1);
    }
    return s->data[s->top];
}

int main(void) {
    
    Stack s;
    initStack(&s);
    
    push(&s, 1);
    push(&s, 2);
    push(&s, 3);
    printf("%d\n", pop(&s));
    printf("%d\n", pop(&s));
    printf("%d\n", pop(&s));
    return 0;
}

