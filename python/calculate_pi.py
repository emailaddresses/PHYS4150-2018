import unittest
import numpy as np

def Liu_Hui_method(max_iter=12):
    '''
    wiki: https://en.wikipedia.org/wiki/Liu_Hui%27s_%CF%80_algorithm
    max_iter(int)
    (ret)(float)
    '''
    x = 1
    n = 6
    for _ in range(max_iter):
        n = n * 2
        x = np.sqrt(x + 2)
        pi_n = n/4*np.sqrt(4-x**2) #h=sqrt(1-L^2/4)
        # pi_n = n/2*sqrt(2-x) #h=1
        # print('n, my_pi = {:10.0f},  {:.15f}'.format(n, pi_n))
    return pi_n

def Buffon_needle_method(num1=10000000):
    '''
    wiki: https://en.wikipedia.org/wiki/Buffon%27s_needle
    num1(int): optional
    (ret)(float)
    '''
    x = np.random.rand(num1)/2
    theta = np.random.rand(num1)*np.pi
    return 2*num1/np.sum(np.sin(theta)/2>x)

def series_expansion_method(num1=10000):
    tmp1 = (2*np.mod(np.arange(1,num1+1),2)-1)
    tmp2 = np.arange(1, 2*num1, 2)
    return (tmp1/tmp2).sum()*4

def monte_carlo_pi(num1=100000):
    def _my_monte_carlo_integration(hf1, a, b, num_point=10000):
        # reference: https://en.wikipedia.org/wiki/Monte_Carlo_integration
        x = np.random.uniform(a, b, size=[num_point])
        return hf1(x).mean()*(b-a)
    # return _my_monte_carlo_integration(lambda x: np.sqrt(1-x**2), -1, 1)*2
    return _my_monte_carlo_integration(lambda x: 1/(1+x**2), 0, 1)*4

class TestStringMethods(unittest.TestCase):
    def test_Liu_Hui_method(self):
        self.assertAlmostEqual(Liu_Hui_method(), np.pi, places=6)
    
    def test_Buffon_needle_method(self):
        self.assertAlmostEqual(Buffon_needle_method(), np.pi, places=1) #terrible precision

    def test_series_expansion_method(self):
        self.assertAlmostEqual(series_expansion_method(), np.pi, places=3)

    def test_monte_carlo_pi(self):
        self.assertAlmostEqual(monte_carlo_pi(), np.pi, places=1) #terrible precision

if __name__=='__main__':
    unittest.main()
