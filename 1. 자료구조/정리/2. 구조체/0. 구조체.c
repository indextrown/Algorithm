//
//  0. 구조체.c
//  Algorithm
//
//  Created by 김동현 on 8/2/25.
//

#include <stdio.h>
#include <string.h>


struct Student {
    char name[10];
    int age;
    double gpa;
};

typedef struct {
    char name[10];
    int age;
    double gpa;
} People;

int main(void) {
    
    struct Student s;
    strcpy(s.name, "Index");
    s.age = 26;
    s.gpa = 4.5;
    
    People p;
    strcpy(p.name, "Index");
    p.age = 26;
    p.gpa = 4.5;
    
    People p2 = { "Index", 26, 4.5 };
    
    
    
    return 0;
}
