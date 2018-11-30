import random
import unittest
import numpy as np

def my_isprime(x):
    '''reference: https://stackoverflow.com/questions/18833759/python-prime-number-checker'''
    if x!=2 and x%2==0: return False
    return all(x%y for y in range(3,int(np.sqrt(x))+1,2))

def my_generate_k_prime(k):
    '''
    k(int)
    (ret)(list,int,(k,))
    '''
    if k==0: return []
    known_prime = [2]
    num1 = 1
    current_x = 3
    while num1<k:
        for x in known_prime:
            if x**2>current_x:
                is_divisible = False
                break
            if current_x%x==0:
                is_divisible = True
                break
        if not is_divisible:
            num1 += 1
            known_prime.append(current_x)
        current_x += 2
    return known_prime

class TestStringMethods(unittest.TestCase):
    prime100 = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]

    def test_isprime(self):
        for x in set(self.prime100):
            self.assertTrue(my_isprime(x))
        for x in set(range(2,101))-set(self.prime100):
            self.assertFalse(my_isprime(x))

    def test_generate_k_prime(self):
        tmp1 = my_generate_k_prime(len(self.prime100))
        self.assertEqual(tmp1, self.prime100)

if __name__=='__main__':
    unittest.main()
