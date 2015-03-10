Generic

Type MyType Is Private;
Max: Positive;

Package GenericStack is 

Procedure Push(X: In MyType; Y: Out Boolean);
Procedure Pop(X: Out MyType; Y: Out Boolean);

end GenericStack;