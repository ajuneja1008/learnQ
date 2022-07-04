/ Overload Glyphs of @ ( ... at)


/ 1. Index at

/ 1.1 Get the item at an index (atom) from a container
@[container;index]
container @ index

/ 1.2 Where index is a vector (equivalent to container . index)
container @/ i






/ 2. Apply at

/ 2.1 Evaluate a monoadic function at an argument (index)
@[function; argument]
function @ index







/ 3. Amend at

 Amends certain indices of a container through a monoadic or a dyadic function
/ Can have 3 or 4 arguments, first argument is a container which can be passed by name or value
/ Returns the updated container of the same type when passed by value or name of th container updated in-place when passed by name. 


/ 3.1 For monoadic functions
@[container; indices; function]
@[1 2 3 4; 0 1; {x div 2}]
@[1 2 3 4; 0 1; {x%2}] / gives a 'type error as % division returns a float to an int list


/ 3.2 For dyadic functions 
@[container; indices; function; second_args]

@[1 2 3 4; 0 1; +; 10 20] 
@[1 2 3 4; (0 2; 1 3); *; 2 -2] 


/ 3.3 Replace: For the special case of "amend at" use function as : and argument as value/s
@[1 2 3 4; 0 1; :; 10 20]
@[list; 0 1; :; 10 20] / does not update list when passed by value(: does not update left argument with an adverb in this case each-both)
@[`list; 0 1; :; 10] / updates list when passed by name







/ 4. Trap at: 

/ Protected Evaluation of a monoadic function against an argument
/ Has 3 arguments - First is a (monoadic) function and last an expression
/ Last argument (expression) is evaluated if the function gives an error for the passed argument. 
/ If an expression is a function using default arguments, it's last argument will be the error message as a string

@[function;argument;expressionIfError]

@[{x+2}; `a; `error]
@[{x+2}; `a;{"Error: ",x}] / Expression is a function whose last argument (x in this case) is the error message as a string
{@[{x+2}; x;{"Error for ",x, "is", y} x]} `a / Protected Evaluation; expression has y (last default arg) as the error message as a string







