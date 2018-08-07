# COMP30020 project2
Project 2 for COMP30020 from the University of Melbourne. A math puzzle

## Overview
Fill the squares in the puzzle with numbers. The sum of numbers should be equal to the target in the top and left side

## Testing
Make sure prolog has been installed

You can run the program by typing:
>Puzzle=[[0,14,10,35],[14,_,_,_],[15,_,_,_],[28,_,1,_]], puzzle_solution(Puzzle).

The answer will be
>Puzzle = [[0, 14, 10, 35], [14, 7, 2, 1], [15, 3, 7, 5], [28, 4, 1, 7]] ;
false.

## Full Description
A maths puzzle is a square grid of squares, each to belled in with a single digit 1{9 (zero is
not permitted) satisfying these constraints:
  -each row and each column contains no repeated digits;
  -all squares on the diagonal line from upper left to lower right contain the same value;
and
  -the heading of reach row and column (leftmost square in a row and topmost square in
a column) holds either the sum or the product of all the digits in that row or column

Note that the row and column headings are not considered to be part of the row or column,
and so may belled with a number larger than a single digit. The upper left corner of the
puzzle is not meaningful.
When the puzzle is originally posed, most or all of the squares will be empty, with the
headingslled in. The goal of the puzzle is to ll in all the squares according to the rules. A
proper maths puzzle will have at most one solution.
Here is an example puzzle as posed (left) and solved (right) :

|      |  14  |   10  |  35  |
| ---- | ---- |  ---- | ---- |
|  14  |      |       |      |
|  15  |      |       |      |
|  28  |      |       |      |

#### Solution

|      |  14  |   10  |  35  |
| ---- | ---- |  ---- | ---- |
|  14  |  7   |   2   |   1  |
|  15  |  3   |   7   |   5  |
|  28  |  4   |   1   |   7  |
