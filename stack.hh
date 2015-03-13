# include <iostream>
typedef struct
  {
    int *Y;
    int *X;
    int size;
  }Stk;
  
void Stack(Stk &M, int size);
void DelStk(Stk &M);
int data(const Stk &M);
void Push(Stk &M, int val);
int Pop(Stk &M);
int OverFlow(const Stk &M);
int UnderFlow(const Stk &M);
std::ostream& operator<<(std::ostream &os, const Stk &);