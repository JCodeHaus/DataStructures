Generic

  Type SortElement is  Private;
  -- Limited came from lab 5
   NA : integer; -- NA is the number of items
 
    With procedure get(Action: out SortElement);
    With procedure put(Action: in SortElement);
    

Package GenericTopologicalSort Is


	Procedure TopologicalSort;

End GenericTopologicalSort;

