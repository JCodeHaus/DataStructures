# include "stack.hh"
# include <iostream>

void Stack(Stk &M, int size)
  {
     M.X= new int[size];
     M.Y= M.X;
     M.size= size;
  }
void DelStk(Stk &M)
  {
    delete [] M.X;
  }
int data(const Stk &M)
  {
    return (M.Y-M.X);
  }
void Push(Stk &M, int val)
  {
    *M.Y=val;
    M.Y++;
  }
int Pop(Stk &M)
  {
    M.Y--;
    return *M.Y;
  }
int OverFlow(const Stk &M)
  {
    return(data(M) >=M.size);
  }
int UnderFlow(const Stk &M)
  {
    return(data(M) >=M.size);
  }
std::ostream& operator<<(std::ostream &os, const Stk &M)
  {
    os << "Stack Amount: " << data(M) << " items: " ;        
      for (int *N=M.X; N<M.Y; N++)
        {
          os << "  " << *N;
        }
      os << "\n";
      return os;
  }