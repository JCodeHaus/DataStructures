PACKAGE BODY GBinarySearchTree IS

   Z, T, S, Pa, R, P, Q: BinarySearchTreePoint;
   Phone: String10;

   stk: stack(1..50);
   num: Integer range 0..50 := 0;

   

   PROCEDURE PreOrder(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN
    Z := TreePoint;
	IF TreePoint = R THEN
	     Put("Traversing tree starting from ROOT.");New_Line;
		 Z := TreePoint.LLink;
	  ELSE
         Put("Traversing tree starting from: ");NamesIO.Put(CustomerName(TreePoint));New_Line;
      END IF;
	Put("Phone     / Name");New_Line;

	Q := Z;

	LOOP
		Phone := CustomerPhone(Q);
		For IP IN 1..10 LOOP
			Put(Phone(IP));
		END LOOP;Put("/ ");
		NamesIO.Put(CustomerName(Q));New_Line;
		IF Q.LTag THEN
			Q := Q.LLink;
		ELSE
			IF Q.RTag = False THEN
				Q := Q.RLink.RLink;
			ELSE
				Q := Q.RLink;
			END IF;
		END IF;
		IF Q = R THEN
			Q := Q.LLink;
		END IF;
		EXIT WHEN Q = Z;
	END LOOP;

   END PreOrder;

   PROCEDURE ReverseInOrder(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN

		IF TreePoint /= R THEN

			IF TreePoint.RTag THEN
				ReverseInOrder(TreePoint.RLink);
			END IF;

			Phone := CustomerPhone(TreePoint);
			For IP IN 1..10 LOOP
				Put(Phone(IP));
			END LOOP;Put("/ ");
			NamesIO.Put(CustomerName(TreePoint));New_Line;

			IF TreePoint.LTag THEN
				ReverseInOrder(TreePoint.LLink);
			END IF;

		ELSE

			ReverseInOrder(TreePoint.LLink);

		END IF;

   END ReverseInOrder;
   
   PROCEDURE PostOrderIterative(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN
		IF TreePoint = R Then
			P := TreePoint.LLink;
		ELSE 
			P := TreePoint;
		END IF;
		T := P;
		
		LOOP
			Push(T);
			IF P.RTag THEN
				T := P.RLink;
			ELSE
				WHILE NOT T.LTag Loop
					T := T.LLink;
				END LOOP;
        T := T.LLink;
			END IF;
			P := T;
                  
			IF TreePoint = R Then
				EXIT WHEN P = TreePoint.LLink;
			ELSE 
				EXIT WHEN P = TreePoint;
			END IF;
         
		END LOOP;
		     put("---> Here");   
		WHILE NOT empty LOOP
			pop(P);
			Phone := CustomerPhone(P);
			For IP IN 1..10 LOOP
				Put(Phone(IP));
			END LOOP;Put("/ ");
			NamesIO.Put(CustomerName(P));New_Line;
		END LOOP;
		
   END PostOrderIterative;

  

   PROCEDURE PostOrderRecursive(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN

		IF TreePoint /= R THEN

			IF TreePoint.LTag THEN
				PostOrderRecursive(TreePoint.LLink);
			END IF;

			IF TreePoint.RTag THEN
				PostOrderRecursive(TreePoint.RLink);
			END IF;

			Phone := CustomerPhone(TreePoint);
			For IP IN 1..10 LOOP
				Put(Phone(IP));
			END LOOP;Put("/ ");
			NamesIO.Put(CustomerName(TreePoint));New_Line;

		ELSE
			PostOrderRecursive(TreePoint.LLink);
		END IF;

   END PostOrderRecursive;


   PROCEDURE InsertBinarySearchTree(Root: IN OUT BinarySearchTreePoint; Name: IN Names; Phone: String10) IS
   BEGIN

      Q := NEW Node;
      Q.LTag  := False;
      Q.LLink := NULL;
      Q.Info.Name  := Name;
      Q.Info.Phone := Phone;
      Q.RLink := NULL;
      Q.RTag  := False;

      IF R.LTag = False THEN
         Q.LTag  := R.Ltag;
         Q.LLink := R.LLink;
         Q.RLink := R;
         Q.RTag  := False;
         R.LTag  := True;
         R.LLink := Q;
      ELSE
         P := R.LLink;
         LOOP
            IF Name /= P.Info.Name THEN
               IF Name > P.Info.Name THEN
                  IF P.RTag THEN
                     P := P.RLink;
                  ELSE
                     Q.LTag  := False;
                     Q.LLink := P;
                     Q.RLink := P.RLink;
                     Q.RTag  := P.RTag;
                     P.RTag  := True;
                     P.RLink := Q;
                     EXIT;
                  END IF;

               ELSE
                  IF P.LTag THEN
                     P := P.LLink;
                  ELSE
                     Q.LTag  := P.LTag;
                     Q.LLink := P.LLink;
                     Q.RLink := P;
                     Q.RTag  := False;
                     P.LTag  := True;
                     P.LLink := Q;
                     EXIT;
                  END IF;

               END IF;

            ELSE
               IF P.RTag = False THEN
                  Q.LTag  := False;
                  Q.LLink := P;
                  Q.RLink := P.RLink;
                  Q.RTag  := P.RTag;
                  P.RTag  := True;
                  P.RLink := Q;
                  EXIT;
               ELSE
                  P := P.RLink;
                  WHILE P.LTag LOOP
                     P := P.LLink;
                  END LOOP;
                  Q.LTag  := P.LTag;
                  Q.LLink := P.LLink;
                  Q.RLink := P;
                  Q.RTag  := False;
                  P.LTag  := True;
                  P.LLink := Q;
                  EXIT;
               END IF;

            END IF;
         END LOOP;
      END IF;

   END InsertBinarySearchTree;

   PROCEDURE FindCustomerIterative(Name: IN Names; TreePoint: OUT BinarySearchTreePoint; Status: OUT Boolean) IS
   BEGIN

      P := R.LLink;
      Status := False;
      LOOP
         IF Name /= P.Info.Name THEN
            IF Name > P.Info.Name THEN
			   IF P.RTag THEN
			      P := P.RLink;
			   ELSE
			      EXIT;
			   END IF;
            ELSE
			   IF P.LTag THEN
                  P := P.LLink;
			   ELSE
			      EXIT;
			   END IF;
            END IF;
         ELSE
           TreePoint := P;
            Status := True;
            EXIT;
         END IF;
      END LOOP;

   END FindCustomerIterative;

   PROCEDURE FindCustomerRecursive(Root: IN BinarySearchTreePoint; Name: IN Names; TreePoint: OUT BinarySearchTreePoint; Status: OUT Boolean) IS
   BEGIN

      IF Root.RLink = Root THEN
         P := Root.LLink;
      ELSE
         P := Root;
      END IF;
      Status := False;

      IF Name /= P.Info.Name THEN
         IF Name < P.Info.Name THEN
            IF P.LTag THEN
               FindCustomerRecursive(P.LLink, Name, TreePoint, Status);
            END IF;
         ELSE
            IF P.RTag THEN
               FindCustomerRecursive(P.RLink, Name, TreePoint, Status);
            END IF;
         END IF;
      ELSE
         TreePoint := P;
         Status := True;
      END IF;

   END FindCustomerRecursive;

   PROCEDURE TraversePt(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN
	  IF TreePoint = R THEN
	     Put("Traversing tree starting from ROOT.");New_Line;
	  ELSE
         Put("Traversing tree starting from: ");NamesIO.Put(CustomerName(TreePoint));New_Line;
      END IF;
      Put("Phone     / Name");New_Line;

	  Q := TreePoint;
      WHILE Q.LTag LOOP
         Q := Q.LLink;
      END LOOP;
	  P := Q;

      LOOP

	     T := P;

         Phone := CustomerPhone(P);
         For IP IN 1..10 LOOP
            Put(Phone(IP));
         END LOOP;Put("/ ");
         NamesIO.Put(CustomerName(P));New_Line;

		 P := T.RLink;
		 IF T.RTag THEN
		    WHILE P.LTag LOOP
			   P := P.LLink;
			END LOOP;
		 END IF;

		 If P = R THEN
		    WHILE P.LTag LOOP
			   P := P.LLink;
		    END LOOP;
		 END IF;

         EXIT WHEN P = Q;
      END LOOP;

   END TraversePt;

   FUNCTION InOrderSuccessor(TreePoint: IN BinarySearchTreePoint) RETURN BinarySearchTreePoint IS
   BEGIN

      P := TreePoint.RLink;
      IF TreePoint.RTag THEN
         WHILE P.LTag LOOP
            P := P.LLink;
         END LOOP;
      END IF;
      RETURN P;

   END InOrderSuccessor;

   FUNCTION CustomerName(TreePoint: IN BinarySearchTreePoint) RETURN Names IS
   BEGIN

      RETURN TreePoint.Info.Name;

   END CustomerName;

   FUNCTION CustomerPhone(TreePoint: IN BinarySearchTreePoint) RETURN String10 IS
   BEGIN

      RETURN TreePoint.Info.Phone;

   END CustomerPhone;
    PROCEDURE DeleteRandomNode(TreePoint: IN BinarySearchTreePoint) IS
   BEGIN

	  T :=TreePoint;
	  Pa := T;

	  --Find Parent Of Node To Delete.
	  IF Pa.LTag = False AND Pa.RTag = False THEN
		IF Pa.LLink.RLink = T THEN
			Pa := Pa.LLink;
	    ELSE
			Pa := Pa.RLink;
		END IF;
	  ELSE
		IF Pa.LTag AND Pa.RTag THEN
			WHILE Pa.LTag /= FALSE LOOP
				Pa := Pa.LLink;
			END LOOP;
			IF Pa.LLink.RLink = T THEN
				Pa := Pa.LLink;
			ELSE
				Pa := T;
				WHILE Pa.RTag /= FALSE LOOP
					Pa := Pa.RLink;
				END LOOP;
				Pa := Pa.RLink;
			END IF;
		ELSE
			IF Pa.LTag = False AND Pa.RTag THEN
				IF Pa.LLink.RLink = T THEN
					Pa := Pa.LLink;
				ELSE
					Pa := Pa.RLink;
					WHILE Pa.RTag /= FALSE LOOP
						Pa := Pa.RLink;
					END LOOP;
					Pa := Pa.RLink;
				END IF;
			Else
				IF Pa.RLink.LLink = T THEN
					Pa := Pa.RLink;
				ELSE
					Pa := Pa.LLink;
					WHILE Pa.LTag /= FALSE LOOP
						Pa := Pa.LLink;
					END LOOP;
					Pa := Pa.LLink;
				END IF;
			END If;
		END IF;
	  END IF;

	  --Delete Node
	  If T.RTag = False THEN
	     IF Pa.RLink = T THEN
		    Pa.RTag := T.RTag;
			Pa.RLink := T.RLink;
		 ELSE
		    Pa.LTag := T.LTag;
			Pa.LLink := T.LLink;
		 End If;
		 Avail(T);
      Else
	     If T.LTag = False THEN
		    IF Pa.RLink = T THEN
		       Pa.RTag := T.RTag;
			   Pa.RLink := T.RLink;
		    ELSE
		       Pa.LTag := T.RTag;
			   Pa.LLink := T.RLink;
		    End If;
		    Avail(T);
         Else
		    P := T.RLink;
			If P.LTag = False THEN
			   IF Pa.RLink = T THEN
			      Pa.RLink := P;
			   ELSE
				  Pa.LLink := P;
			   End If;
			   P.LTag := TreePoint.LTag;
			   P.LLink := TreePoint.LLink;
			   Avail(T);
			ELSE
			   S := P.LLink; --look for inorder succ
			   Z := T.LLink; --look for inorder pred
			   WHILE S.LTag /= FALSE LOOP
			      P := S;
				  S := S.LLink;
			   END LOOP;
			   WHILE Z.RTag /= FALSE LOOP
				   Z := Z.RLink;
			   END LOOP;
			   If Pa.RLink = T THEN
			      Pa.RLink := S;
			   Else
			      Pa.LLink := S;
			   END IF;
			   P.LTag  := S.LTag;
			   Z.RLink := S;
			   S.LTag  := T.LTag;
			   S.LLink := T.LLink;
			   S.RLink := T.RLink;
			   S.RTag  := T.RTag;
			   Avail(T);
			END IF;
	     END IF;
	  END IF;

   END DeleteRandomNode;
    procedure push(TreePoint: in BinarySearchTreePoint) is
   begin
      if num < 10 then
         num := num + 1;
         stk(num) := TreePoint;
      end if;
   end push;

   procedure pop(TreePoint: out BinarySearchTreePoint) is
   begin
      if num /= 0 then
         TreePoint := stk(num);
         num := num - 1;
      end if;
   end pop;

   function empty return Boolean is
   begin
		if num = 0 then
			return true;
		END IF;
		return false;
   end empty;

   FUNCTION CreateTree RETURN BinarySearchTreePoint IS
   BEGIN
      R := NEW Node;
      R.LTag  := False;
      R.LLink := R;
      R.RLink := R;
      R.RTag  := True;
      RETURN R;
   END CreateTree;

END GBinarySearchTree;