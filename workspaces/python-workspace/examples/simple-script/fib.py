#!/usr/bin/env python


def fibonacci(x):
	sequence_list = []

	current = 0
	next = 1
	
	for i in range (x):
	
		sequence_list.append(current)
		current = next
		if i > 0:
			next = sequence_list[i] + current
		else:
			next = 1
	return sequence_list	
	

#produces a sum for the kth fibonacci number
def print_fibonacci(x):
	print( str(fibonacci(x)) )
	

def main():
    print( print_fibonacci(1797) )


if __name__ == "__main__":
    """ This is executed when run from the command line """
    main()
