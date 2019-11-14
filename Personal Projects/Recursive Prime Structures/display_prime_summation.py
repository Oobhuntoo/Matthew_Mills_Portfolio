"""
@Author: Matthew
@Title: Display Prime Summation
@Purpose: For each prime integer in the list of the first 20 primes, shows all possible ways that it may be written as a sum of previous primes
@Date: 08/05/2019
"""

import math

def drive_combos(end, sub_end):

    repository = []
    index_list = []
    
    for i in range(0,end):
    
        new_index_list = index_list.copy()
        new_index_list.append(i)
        
        find_combos(new_index_list, end, sub_end, repository)
        
    return repository


def find_combos(index_list, end, sub_end, repository):


    if len(index_list) == sub_end:
    
        repository.append(index_list)
        
    else:
    
        intermediate_term = index_list[-1]
        
        for i in range(intermediate_term + 1, end):
        
            new_index_list = index_list.copy()
            
            new_index_list.append(i)
            
            find_combos(new_index_list, end, sub_end, repository)
            
            
def compute_primes(prime_list):

    master_list = []
    
    index = 0
    for prime in prime_list:
        print("Prime: " + str(prime))
        print(index)
    
        ind_prime_list = []
        
        for i in range(2, math.ceil(prime ** 0.5) + 1):
		
            print(i)
        
            sublist = drive_combos(index, i)
            
            for combo in sublist:
                print("Combo:")
                print(combo)
            
                sum = 0
                
                for el in combo:
                
                    sum += prime_list[el]
                    
                if sum == prime:
                    print("Passed")
                    ind_prime_list.append(combo)
            
                
        master_list.append(ind_prime_list)          
            
        index += 1
        
    prime_file = open("prime_file.txt", "a")
    prime_label_file = open("prime_labels_file.txt", "a")
    
    fresh_index = 0
    for itm in master_list:
        print(itm)
        
        if fresh_index > 1:
            
            for combo in itm:
                
                sum_string = ""
                label_string = ""
                
                for num in combo:
                    sum_string += (str(prime_list[num]) + " + ")
                    label_string += ("p" + str(num + 1) + " + ")
                sum_string = sum_string[:-2]
                label_string = label_string[:-2]
                
                prime_file.write(str(prime_list[fresh_index]) + " = " + sum_string + "\n")
                prime_label_file.write("p" + str(fresh_index + 1) + " = " + label_string + "\n")
                
        prime_file.write("\n")
        prime_label_file.write("\n")
                
        fresh_index += 1
            
    prime_file.close()
    prime_label_file.close()
                
                
prime_list = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227]

#prime_list = [1,2,3,5,7,11]

compute_primes(prime_list)


            
        