% CSU33061 Assignment 01 - Ryan Askin.

% From Notes/Assignment
arc([H|T],Node,Cost,KB) :- member([H|B],KB), append(B,T,Node), length(B,L), Cost is 1+ L/(L+1).
heuristic(Node,H) :- length(Node,H).
goal([]).

add2frontier(Children,[],Children).
add2frontier(Children,[H|T],[H|More]) :- add2frontier(Children,T,More).

% Modified search & less-than
less-than([Node1,_,Cost1|_],[Node2,_,Cost2|_]) :- heuristic(Node1,Hvalue1), 
                                                  heuristic(Node2,Hvalue2),
                                                  F1 is Cost1+Hvalue1, 
                                                  F2 is Cost2+Hvalue2,
                                                  F1 =< F2.

search([[Node,Path,Cost]|_],FinalPath,Cost,_) :- append(Path,[Node],FinalPath), goal(Node).
search([[Node,NodePath,NodeCost]|More],Path,Cost,KB) :- 
    append(NodePath,[Node],FullPath),
    findall([X,FullPath,TotalCost], (arc(Node,X,FoundCost,KB), TotalCost is FoundCost+NodeCost),Children),
    add2frontier(Children,More,TmpFrontier),
    frontierSort(TmpFrontier,SortedFrontier),
    search(SortedFrontier,Path,Cost,KB).


frontierSort([H|T],SortedList) :- recursiveSort(H,[],T,SortedList).

recursiveSort(H,Sorted,[],[H|Sorted]).

recursiveSort(X,Sorted,[H|T],SortedList) :- less-than(X,H), !,
	                                        recursiveSort(X,[H|Sorted],T,SortedList) ; 
                                            recursiveSort(H,[X|Sorted],T,SortedList).

% AStar
astar(Node,Path,Cost,KB) :- search([[Node,[],0]],Path, Cost, KB).
