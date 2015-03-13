with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

PACKAGE GBinarySearchTree IS

   TYPE String10 IS NEW String(1..10);
   TYPE BinarySearchTreePoint IS PRIVATE;

   TYPE Names IS (McDonald, Gurung, Zhang, Midcap, Chavez, Kabbaj, Ballard, Ryba, Sparks, Ballard, Daniels, Vieira, Montes, Burris,Sewell);
   PACKAGE NamesIO IS NEW Ada.Text_IO.Enumeration_IO(Names); USE NamesIO;
  
  PROCEDURE InsertBinarySearchTree(Root: IN OUT BinarySearchTreePoint; Name: IN Names; Phone: IN String10);
   PROCEDURE FindCustomerIterative(Name: IN Names; TreePoint: out BinarySearchTreePoint; Status: OUT Boolean);
   PROCEDURE FindCustomerRecursive(Root: IN BinarySearchTreePoint; Name: IN Names; TreePoint: out BinarySearchTreePoint; Status: OUT Boolean);
   PROCEDURE PreOrder(TreePoint: IN BinarySearchTreePoint);
   PROCEDURE PostOrderIterative(TreePoint: IN BinarySearchTreePoint);
   PROCEDURE PostOrderRecursive(TreePoint: IN BinarySearchTreePoint);
   PROCEDURE ReverseInOrder(TreePoint: IN BinarySearchTreePoint);
   PROCEDURE TraversePt(TreePoint: IN BinarySearchTreePoint);

   FUNCTION InOrderSuccessor(TreePoint: IN BinarySearchTreePoint) RETURN BinarySearchTreePoint;
   FUNCTION CustomerName(TreePoint: IN BinarySearchTreePoint) RETURN Names;
   FUNCTION CustomerPhone(TreePoint: IN BinarySearchTreePoint) RETURN String10;
   PROCEDURE DeleteRandomNode(TreePoint: IN BinarySearchTreePoint);
   FUNCTION CreateTree RETURN BinarySearchTreePoint;

   procedure push(TreePoint: in BinarySearchTreePoint);
   procedure pop(TreePoint: out BinarySearchTreePoint);
   function empty return Boolean;

   PRIVATE TYPE Customer IS RECORD
      Name: Names;
      Phone: String10;
   END RECORD;

   TYPE Node;
   TYPE BinarySearchTreePoint IS ACCESS Node;

   TYPE Node IS RECORD
      Llink, Rlink: BinarySearchTreePoint;
      Ltag, Rtag: Boolean;
      Info: Customer;
   END RECORD;

   type stack is array(Integer range<>) of BinarySearchTreePoint;

   PROCEDURE Avail IS NEW Ada.Unchecked_Deallocation(Node, BinarySearchTreePoint);

END GBinarySearchTree;