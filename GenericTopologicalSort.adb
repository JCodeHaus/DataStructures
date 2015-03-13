with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Unchecked_Conversion;
use Ada.Integer_Text_IO, Ada.Text_IO;
Package Body GenericTopologicalSort Is

--This should read (get) the relations and print (put) The results
	

	Type Node;
	Type NodePointer Is Access Node;
	Type Node Is Record
		Suc: integer;
		--The successor of the relation to be sorted
		Next: NodePointer;
	End Record;

	Type JobElement Is Record
		Qlink: integer := 0;
		--This uses the Count Field to build the Queue link
		Top: NodePointer := null;
		--Points to the Preceding action
	End Record;
    
	SortStructure:  Array(0..NA) of JobElement;
	--Instantiations to convert between Integer and NodePointer
	function IntToSe is new Ada.Unchecked_Conversion(SortElement, Integer);
  

    
       Procedure TopologicalSort is
  --Program to sort and print results
    KN: Integer;
  --KN when set as KN<-NA where KN is the number of actions
  --still to be processed
    NR: Integer;
  --Number of actions
    Counter: Integer;
  --Count is the number of actions that must be accomplished
  --before K may be performed
    F: Integer;
  --F is used as the pointers to the front of a queue of actions eligible for output
    R: Integer;
  --R is used as the pointers to the rear of a rear of actions eligible for output
    K: Integer;
  --K is used as the pointer to the action waiting on action "J"
    P: NodePointer;
  --P is the available node 
    Precident:integer;
  --Precident is J,J<K, action J precedes action K
    Successor:integer;
  --Successor is K,J<K, action K succeedes action J
  --Procedure: TopologicalSort: In Progress

	Begin
	  --Initialize array
	  For K in 1..NA Loop
        SortStructure(K).Qlink:=0;
        SortStructure(K).Top := null;
      End Loop;
      
      KN:=NA;
    --Where KN is the number of actions are waiting on
    --action still to be processed
	
      
       --Process 1: UserInput: Relations(J action precedes action K): Amount: ");
    Put("Process: UserInput: Relations(J action precedes action K): Amount:  ");
    get(NR);
     new_line;
     
     Counter:=1;
     
     put_line("Relations are in the form of 'precident < successor'.");
      put("Enter the precident of relation 1, then hit enter: ");
      get(precident);
      put("Enter the successor of relation 1, then hit enter: ");
      get(successor);
     
     Loop
          P := new Node;
      	SortStructure(successor).Qlink := SortStructure(successor).Qlink + 1;
		--Process: Build DataStructure: Increase Queue link space by 1:
          --Null if Zero: Expect: At Least 1 relation
		P.Suc := successor;
		--Process: Get Relation
		P.Next := SortStructure(precident).Top;
		--The linked List pointed to by Top for 1<=J<=NA
          --Represents the number of actions that must be accomplished
          --before action K may be performed
		SortStructure(precident).Top := P;
		Exit when counter = NR;
          Counter:= Counter+1;
            
          Put("Process: UserInput: ");Put(Counter, 0);Put(" Precident: ");Get(precident);
          new_line;
          --Process: UserInput: Get J (Precident)
          Put("Process: UserInput: ");Put(Counter, 0);Put(" Successor: ");Get(successor);
          new_line;
          --Process: UserInput: Get K (Successor)
          End Loop; 
          r := 0;
      SortStructure(0).Qlink := 0;
		--Process: Initialize Queue Link Field: Start
       
          --State 1: Build DataStructure: Start
		For K in 1..NA Loop
			If SortStructure(K).Qlink = 0 Then
				SortStructure(R).Qlink := K;
				R := K;
			End If;
		End Loop;
		--State 1: Build DataStructure: Complete
		F := SortStructure(0).Qlink;
        Put("Procedure: TopologicalSort: Output: Sorted Order:  ");
        --State 4: TopologicalSort: Start
		While F /= 0 Loop
      		--Perform action F
			Put(F,0); Put(" ");
			KN := KN - 1;
			P := SortStructure(F).Top;
			SortStructure(F).Top := null;
			--State 4: TopologicalSort: In Progress
			While P /= null Loop
				SortStructure(P.Suc).Qlink := SortStructure(P.Suc).Qlink - 1;
				--Condition 1: Add to output queue: Start
				If SortStructure(P.Suc).Qlink = 0 Then
					SortStructure(R).Qlink :=(P.Suc);
					--Add to Output queue
					R := (P.Suc);
				End If;
				--Condition 1: Add to Output queue:Complete
				P := P.Next;
			End Loop;
			--State 4: TopologicalSort: In Progress
			F := SortStructure(F).Qlink;
		End Loop;
		--State 4: ToplogicalSort: Complete
		
		IF KN= 0 Then
            --KN is the number of actions in need of processing
             Put(" Procedure: TopologicalSort: Success ");
             return;
         Else
            --State 1: TopologicalSort: Failure: Start
            For L in 1..NA Loop
			SortStructure(L).Qlink := 0;
      	   End Loop;            
          --Hypothesis of a partial order has been Violated
          --State 1: TopologicalSort: Failure: Complete
          End If;
        --Condition 1: Loop: Complete
        --State 5: TopologicalSort: Output: Loop: Start
        For L in 1..NA Loop
				P := SortStructure(L).Top;
				SortStructure(L).Top := null;
				--State 1: TopologicalSort: Pointers: Start
				While P /= null and then SortStructure(P.Suc).Qlink = 0 Loop
						SortStructure(P.Suc).Qlink := L;
						If P/=null then
						P := P.Next;
					End If;
				End Loop;
			End Loop;
			--Find a K with CountField not equal to Zero
              --State 6: TopologicaSort: Loop: Start
              K:=1;
              While SortStructure(K).Qlink = 0 Loop
				K := K + 1;
			End Loop;
			--State 6: TopologicaSort: Loop: Complete
              --Look for loop and mark it
              --State 7: TopologicalSort: Loop: Marks: Start
              Loop
     			--Repeat
				SortStructure(K).Top := new Node;
				K := SortStructure(K).Qlink;
				--Until Top is not equal to zero
			 Exit When SortStructure(K).Top /= null;
			End Loop;
      		--State 7: TopologicalSort: Loop: Marks: Complete
              --Print the Loop
			Put_Line(""); Put("Elements in the loop: ");
			--State 8: TopologicalSort: Loop: PrintValues: Start
			While SortStructure(K).Top /= null Loop
				Put(K,0); Put(" ");
				--Print Action K
				SortStructure(K).Top := null;
				K := SortStructure(K).Qlink;
			End Loop;
			--State 8: TopologicalSort: Loop: PrintValues: Complete
              --Print The Value of K
              --K is the first node in the loop printed backwards 

				
			Put_Line(""); Put(K,0); Put_Line(" is the first element in the loop.");
			
		
	End TopologicalSort;
	
End GenericTopologicalSort;


     
