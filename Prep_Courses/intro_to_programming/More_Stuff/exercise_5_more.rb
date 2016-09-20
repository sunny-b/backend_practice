It gives an error because there is not a "&" before the parameter
"block" so the method does not know there is a block being passed it.
So when the code calls the method and passes in a block,
the method does not recognize the block being passed in as the argument.