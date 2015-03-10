Package Body GenericStack Is

Stack: Array(1..Max) Of MyType;
--Stack is memory locations 1 through M
--Set Empty
Top: Integer Range 0..Max:=0;

--Procedure: Push: Start
Procedure Push(X: In MyType; Y: Out Boolean) Is
  Begin
  --Condition 1: Start
    If Max<Top then 
    --Boolean Value To Determine Overflow
    --Normally an Error Condition
      Y:=True;
    --Condition 1: In Progress
    Else
    --Insert MyType (X) into Stack
      Top:=Top+1;
      Stack(Top):=X;
      Y:=False;
    End If;
  --Condition 1: Complete  
    End Push;
--Procedure: Push: Complete


--Procedure: Pop: Start
Procedure Pop(X: Out MyType; Y: Out Boolean) Is
Begin
--Condition 1: Start
  If 0>=Top then 
  --This is normally a desired condition
    Y:=True;
--Condition 1: In progress
  Else
    X:=Stack(Top);
    Y:=False;
  --Pop The Stack
    Top:=Top-1;
  End If;
--Condition 1: Complete
End Pop;

--Initialize Top to 0
Begin
Top:=0;

End GenericStack;