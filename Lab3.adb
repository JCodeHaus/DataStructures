With Ada.Text_IO; Use Ada.Text_IO;
With GenericTopologicalSort;  

Procedure Lab3 Is
   

Package iio Is New Ada.Text_IO.Integer_IO(integer); Use iio;


numItems : integer;   
   
   procedure intGet(x: out Integer) is
   begin
     Get(x, 0);
   end intGet;

 
   procedure intPut(x : in Integer) is
   begin
      Put(x, 0);
      
   end intPut;
   
    Begin
	put("Enter the number of items: ");
   get(numItems);
	Declare
		Package Topo Is New GenericTopologicalSort(integer, numItems, intGet, intPut); Use Topo;
	Begin
		topo.TopologicalSort;
	End;


    End Lab3;
