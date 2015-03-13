#include <iostream>
#include "stack.hh"

int main()
{
  Stk M;
  Stack(M, 4);
  std::cout<<"\n" <<M <<"\n";
  Push(M, 4);
  Push(M, 5);
  Push(M, 7);
  
  std::cout<< M << "\n";
  if(!OverFlow(M)) Push(M, 99);
  
  std::cout<<M<<"\n";
  std::cout<<"Popped value is: "<< Pop(M)<< "\n";
  std::cout<<M;
  
  
  DelStk(M);
  return 0;
}
