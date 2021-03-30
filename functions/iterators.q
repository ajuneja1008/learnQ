/ Atomic functions can be applied to each element individually. For the rest we have the map iterators
/ Iterators are higher-order functions: take functions as arguments



/ 1 Map Iterators

/ 1.1 Each('): 

/ 1.1.1 Unary Functions: Apply non-atomic unary functions denesting 1 level
(count') (1 2 3;3 4)     // with the ' operator
count' [(1 2 3;3 4)]     // with the ' operator
count each (1 2 3;3 4)   // less branckets, betterv style

/1.1.2 Binary Functions: Apply a non-atomic binary function pair-wise (behave atomically)
("abc";"def") ,' ("pqr";"stw")
/ As with the case of atomic fucntions: 'length error if the arg lists are of different sizes
1 2 + 1 2 3
("abc";"def") ,' ("pqr";"stu";"vwx")
/ Extends atoms to conform with lists
1 ,' 1 2 3
/ When making a list of pairs from pairs of lists its better to use the idiom:
flip (l;l2)
/ ,' can be used to join two tables of same length sideways
if[count [t1] ~ count t2;t1 ,' t2]



/1.2 Each Left(\:)

/ 1.2.1 Binary Functions: Apply a not-atomic binary function with the second argument applied to each first argument
/ Prefix Notation: f[;y] each x


/1.3 Each Right(/:)

/ 1.3.1 Binary Functions: Apply a not-atomic binary function with the first argument applied to each second argument
/ Prefix Notation: f[x;] each y



/ 2 Accumulators

/ 2.1 Over (/)
/ Note: No white-space allowed between the function and the accumulator (/)

/ 2.1.1 Binary Function: Modifies a binary function to produce another unary/binary function with the (optional) first argument as the initial value of the accumulator and the right arg as the list to be accumulated 
/ Needs parenthesis (+/) to modify to a unary funtion
(+/) 1 2 3 4 5          / No starting value
10 +/ 1 2 3 4           / 10 is the starting value for the accumulaion
/ Prefix forms doesn't need parenthesis
+/[1 2 3 4 5]
+/[10;1 2 34 5]
/ A lot of accumulators are buil-in functions for instance (,/) is raze

/ 2.1.2 Modifies a function to produce a binary function that iterates (x) times starting with the initial value (y)
/ fibonacci series
f: {x, sum -2#x}
fib: f/[10;1 1]

/ 2.1.3 Modifies a function to produe a unary function that starts with an initial value (x) until convergence is achieved

/ 2.1.4 While Loop: Modifies a function into a binary that takes a condition(f[x]) as input (x) and executes until x results in 1b with the starting value of the accumulator as (y)
f: {x, sum -2#x}
f/[{1000>last x}; 1 1]

/ 2.2 Scan (\): Does everything from 2.1.1 - 2.1.4 

