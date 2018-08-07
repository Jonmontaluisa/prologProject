% Author:   Jonathan Montaluisa <jmontaluisa@student.unimelb.edu.au>
% Purpose:  Solve Math Puzzle

% Given a matrix n x n in the form of a list of list fill the blanks to
% solve the matrix.
% Rules:
% 1)For each row: the sum or product of all elements of that row except the
% first has to be equal to the first element
% 2)For each column: the sum or product of all elements of that column except the
% first has to be equal to the first element
% 3) Only digits can be used, meaning number from [1..9]
% Test:
% Puzzle=[[0,14,10,35],[14,_,_,_],[15,_,_,_],[28,_,1,_]], puzzle_solution(Puzzle).

% libraries imported
:-  use_module(library(clpfd)).


puzzle_solution(Puzzle):-
  %check the diagonal has the same elements
  diagonal(0,Puzzle,L),
  all_same_puzzle(L),
  %verify that every row comply with Rules described above
  check_rows(Puzzle),
  % make a transpose to later check colums
  transpose(Puzzle,Ts),
  % check the columns
  check_rows(Ts).

%obtain the diagonal of the puzzle
diagonal(Index,[],[]).
diagonal(Index,[H|T],[Head|Tail]):-
  nth0(Index,H,Head),
  Index1 is Index +1,
  diagonal(Index1,T,Tail).

%helper functions
listof(_, []).
listof(Elt, [Elt|List]) :-
  listof(Elt, List).

all_same(List) :-
	listof(_, List).
% after obtaining the diagonal check all elements are the same and disregard
% the first one
all_same_puzzle([H|T]):-
  all_same(T).

% enclose the rows function and  leaves outside the top row
check_rows([H|T]):-
  rows(T).
% apply sum or multiplication of the elements in a row in all rows
rows([]).
rows([H|T]):-
  (sum_row(H) ;
  mul_row(H) ),
  rows(T).

%first check that elements in T are digits,
%thenapply multiplication all of them except the first one
mul_row([H|T]):-
  is_member(T),
  prod_list(T,H).
%list multiplication of its elemets
prod_list([],0).
prod_list([H],H).
prod_list([H|T], Product) :-
  prod_list(T, Rest),
  Product is H * Rest.
%first check that elements in T are digits,
%the sum all elements of the list except the first one
sum_row([H|T]):-
  is_member(T),
  sum_list(T,H).

is_member([]).
is_member([H|T]):-
  member(H,[1,2,3,4,5,6,7,8,9]),
  is_member(T).
