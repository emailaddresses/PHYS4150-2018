import unittest
import numpy as np
from scipy.integrate import quad

'''
hf1(lambda)
a(float)
b(float)
(ret)(float)
'''

def rectangular_integral(hf1, a, b, num_point=1000):
    '''reference: https://en.wikipedia.org/wiki/Riemann_sum'''
    tmp1 = np.linspace(a, b, num_point+1)
    x = (tmp1[1:] + tmp1[:-1])/2
    return hf1(x).sum() * (b-a) / num_point


def trapezoidal_integral(hf1, a, b, num_point=1000):
    '''reference: https://en.wikipedia.org/wiki/Trapezoidal_rule'''
    x = np.linspace(a, b, num_point)
    return (hf1(a)/2 + hf1(b)/2 + hf1(x[1:-1]).sum())*(b-a)/(num_point-1)


def adaptive_trapezoidal_integral(hf1, a, b, num_iter=10):
    sum_d = hf1(a) + hf1(b)
    sum_o = hf1((a+b)/2)
    sum_e = 0
    for ind1 in range(1,num_iter+1):
        sum_e = sum_o + sum_e
        tmp1 = (b-a)/2**ind1
        sum_o = hf1(a + tmp1/2 + tmp1*np.arange(2**ind1)).sum()
    return (b-a)/2**(num_iter+1)/2*(sum_d + 2*sum_e + 2*sum_o)


def simpson_integral(hf1, a, b, num_point=257):
    '''reference: https://en.wikipedia.org/wiki/Simpson%27s_rule'''
    assert num_point%2==1, 'simpsom rule require odd points'
    x = np.linspace(a, b, num_point)
    w = np.ones(num_point)
    w[1:-1:2] = 4
    w[2:-1:2] = 2
    return (hf1(x) * w).sum()*(b-a)/(num_point-1)/3


def adaptive_simpson_integral(hf1, a, b, num_iter=7):
    '''reference: https://en.wikipedia.org/wiki/Adaptive_Simpson%27s_method'''
    sum_d = hf1(a) + hf1(b)
    sum_o = hf1((a+b)/2)
    sum_e = 0
    for ind1 in range(1,num_iter+1):
        sum_e = sum_o + sum_e
        tmp1 = (b-a)/2**ind1
        sum_o = hf1(a + tmp1/2 + tmp1*np.arange(2**ind1)).sum()
    return (b-a)/2**(num_iter+1)/3*(sum_d + 2*sum_e + 4*sum_o)


def monte_carlo_integral(hf1, a, b, num_point=50000):
    '''reference: https://en.wikipedia.org/wiki/Monte_Carlo_integration'''
    x = np.random.rand(num_point)*(b-a) + a
    return hf1(x).sum()/num_point*(b-a)


class TestStringMethods(unittest.TestCase):
    num_repeat = 10
    def _random_function(self):
        p = np.random.randn(5)*np.pi
        q = np.random.randint(1,7,2)
        a,b = np.sort(np.random.randn(2))
        hf1 = lambda x,_p=p,_q=q: _p[0] * np.sin(_p[1]*x+_p[2])**_q[0] * np.cos(_p[3]*x+_p[4])**_q[1]
        return hf1, a, b, {'p':p, 'q':q}
    
    def test_rectangular_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = rectangular_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 4, msg=str(dict(a=a,b=b,**para)))

    def test_trapezoidal_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = trapezoidal_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 4, msg=str(dict(a=a,b=b,**para)))

    def test_adaptive_trapezoidal_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = adaptive_trapezoidal_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 4, msg=str(dict(a=a,b=b,**para)))
        hf1, a, b, para = self._random_function()
        for ind1 in range(10):
            ret1 = trapezoidal_integral(hf1, a, b, 2**(ind1+1)+1)
            ret2 = adaptive_trapezoidal_integral(hf1, a, b, ind1)
            self.assertAlmostEqual(ret1, ret2, 10)

    def test_simpson_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = simpson_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 4, msg=str(dict(a=a,b=b,**para)))

    def test_adaptive_simpson_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = adaptive_simpson_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 4, msg=str(dict(a=a,b=b,**para)))
        hf1, a, b, para = self._random_function()
        for ind1 in range(10):
            ret1 = simpson_integral(hf1, a, b, 2**(ind1+1)+1)
            ret2 = adaptive_simpson_integral(hf1, a, b, ind1)
            self.assertAlmostEqual(ret1, ret2, 10)

    def test_monte_carlo_integral(self):
        for _ in range(self.num_repeat):
            hf1, a, b, para = self._random_function()
            ret1 = quad(hf1, a, b)
            ret2 = monte_carlo_integral(hf1, a, b)
            self.assertAlmostEqual(ret1[0], ret2, 1, msg=str(dict(a=a,b=b,**para))) #terrible precision


if __name__ == "__main__":
    unittest.main()
