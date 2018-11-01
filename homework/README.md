# homework

NOTICE: *here list all the problems that waiting for your contribution whether they are GRADED or NOT*

If you find some problems worth sharing (should be related to the course), you could tell me (by email / PR / issue), and I will add it to this list if suitable; It will be better to come up with new problems along with solutions.

## homework requirements

1. this is the draft of first version, if find any unsuitable requirements, welcome to discuss
2. some homeworks are optional. If you submit the answer to optional homeworks, maybe you will earn extra grades or may not. Personally, I recommand to finish these optional ones since they should be of some help for later homeworks.
3. you should submit homework before the due time, and you could collect you homework after the due date. detail see [submit and collect homework](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/submit_and_collect_homework.md)

## 0-square-root-of-complex-number

1. **this is a fake homework for demo only**
2. due time: 20180901 00:00
3. calculate the square root of a complex number using a function that can only take the square root of real numbers
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/0_square_root_of_complex_number/code_template.m)
5. [```submit_example.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/0_square_root_of_complex_number/submit_example.m): this is an example file what you should submit. In this file you should keep those basic info (name, uid, right reserved info).
6. [```demo_on_course_website.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/0_square_root_of_complex_number/demo_on_course_website.m): this is what others will see on the course website; name and uid info will be removed but right reserved info will still be there. If you select yes to put on the course website, I will upload your coding after the assignment due time.
7. [```solution.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/0_square_root_of_complex_number/solution.m): This is the reference solution which will be uploaded after due time.

## 1-programming-get-started

1. due time: None
2. go through Octave or MATLAB get-started tutorials
   * [MATLAB Desktop Basics](https://www.mathworks.com/help/matlab/learn_matlab/desktop.html)
   * [Using Octave](https://wiki.octave.org/Using_Octave)
   * [Octave Programming Tutorials / Getting started](https://en.wikibooks.org/wiki/Octave_Programming_Tutorial/Getting_started)
3. Type the code yourself and see the results. If not understand the code, use ```doc(bulabula)``` to get help
4. several check lists
   * ```clc```
   * ```create matrix use []```
   * ```;```
   * ```plot```
   * *TODO*

## 2-optimization-generate-K-prime-number

1. due time: 20180927 23:59
2. based on the ```my_isprime()``` implemented on the course, we could easily write down the program the generate the first K prime number start from 2. Moreover in the lecture note mentioned two improvements (lecture note page 41/61)
   * ....increase N by 2 each time.....
   * ....do not need to go through the entire list of the existing prime numbers....
3. you need to
   * understand the code in ```code_template.m```
   * implement these two improvements
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/2_optimization_generate_K_prime_number/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/2_optimization_generate_K_prime_number/unittest.m)

## 3-calculate-pi-Liu-Hui

1. due time: 20180927 23:59
2. calculate pi value using Liu-Hui's method (the ancient Chinese method)
   * you are required to print out ```n,  pi_n``` every recursive step
   * paste yoru print out to the comment blocks in the ```code_template.m``` as part of your homework
3. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/3_calculate_pi_Liu_Hui/code_template.m)
4. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/3_calculate_pi_Liu_Hui/unittest.m)

## 4-calculate-pi-Buffon-Needle

1. due time: 20180927 23:59
2. calculate pi value using Buffon's Needle method, you need to
   * implement the Buffon's Needle method to calculate pi
   * add your report (e.g. try different number of drops) to the comment blocks in the ```code_template.m``` (several sentences are enough)
3. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/3_calculate_pi_Liu_Hui/code_template.m)
4. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/3_calculate_pi_Liu_Hui/unittest.m)

## 5-calculate-pi-series-expansion

1. due time: 20180927 23:59
2. **OPTIONAL**
3. calculate pi value using series expansion
4. no ```code_template.m``` available
5. no ```unittest.m``` available

## 6-evaluate-pi-squared

1. **this is a fake homework for demo only**
2. due time: 20180920 23:59
3. calculate ```pi^2``` (use built-in ```pi```, no need to calculate pi yourself)
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/6_evaluate_pi_squared/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/6_evaluate_pi_squared/unittest.m)

## 7-rectangular-rule

1. due time: 20181011 23:59
2. **OPTIONAL**
3. implement rectangular rule integration method. You can see ```rectangular_rule``` code in TS20180920 for reference (they are quite similar).
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/7_rectangular_rule/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/7_rectangular_rule/unittest.m)

## 8-Simpsom-rule

1. due time: 20181011 23:59
2. implement adaptive Simpsom integral rule. Your adaptive version should give exactly same results as naive one given the suitable ```num_points``` and ```num_iter```
3. useful materials:
   * [```my_naive_simpsom_integral.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/my_naive_simpsom_integral.m)
   * [```my_naive_trapezoidal_integral.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/my_naive_trapezoidal_integral.m)
   * [```my_adaptive_trapezoidal_integral.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/my_adaptive_trapezoidal_integral.m)
   * [```unittest_trapezoidal_integral.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/unittest_trapezoidal_integral.m)
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/8_Simpsom_rule/unittest.m)

## 9-calculate-pi-Monte-Carlo-Integral

1. due time: 20181011 23:59
2. calculate pi using Monte Carlo Integration method. The one-dimensional Monte Carlo Integration method has been provided in ```code_template.m```
3. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/9_calculate_pi_Monte_Carlo_Integral/code_template.m)
4. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/9_calculate_pi_Monte_Carlo_Integral/unittest.m)

## 10-gaussian-quadrature

1. due time: 20181011 23:59
2. implement Gaussian Quadrature integral method. The root the n-th order Legendre polynomial has been provided.
3. you need
    1. calculate the first-order derivative of n-th order Legendre polynomial with either numerical differentiation method or recursion relations (see ```TS20180927/legendre_notebook```)
    2. calculate the weight and then integration following the Gaussian Quadrature formula
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/10_Gaussian_Quadrature/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/10_Gaussian_Quadrature/unittest.m)
6. [```my_legendre.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/10_Gaussian_Quadrature/my_legendre.m)
7. [```my_legendre_root.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/10_Gaussian_Quadrature/my_legendre_root.m)

## 11-neville-interpolation

1. due time: 20181025 23:59
2. implement Neville interpolation method
3. useful material
    * ```TS20181010.pptx``` page ```6-7``` shows algorithm steps
    * ```lectucture03.pdf``` give detail explaination about this algorithm
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/11_neville_interpolation/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/11_neville_interpolation/unittest.m)
6. [```my_lagrangian_interpolation```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/11_neville_interpolation/my_lagrangian_interpolation.m)

## 12-pade-approximation

1. due time: 20181025 23:59
2. Implement Pade approximation
3. useful materials
   * ```unittest.m``` will plot the target function and your approximated function to help you debug
   * ```TS20181011.pptx``` page ```6-7``` shows algorithm steps
   * ```lecture03.pdf``` and wiki gives detailed algorithm explanation
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/12_pade_approximation/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/12_pade_approximation/unittest.m)

## 13-ifft

1. due time: 20181025 23:59
2. Implement Inverse Fast Fourier Transformation (IFFT)
3. useful materials
   * ```my_fft.m``` uses almost same steps. you could see use code snippet for reference
   * ```TS20181011.pptx``` page ```12``` shows detailed FFT algorithm steps
   * ```lecture03.pdf``` and wiki give algorithm explanation
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/13_ifft/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/13_ifft/unittest.m)
6. [```my_fft.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/13_ifft/my_fft.m)


## 14-legendre-root

1. due time: 20181025 23:59
2. In hwk10, Gauss Quadrature integral, you have implemented part of the whole algorithm (calculate first order derivative). In this hwk, you are required to find N roots of N-order Legendre polynomial using bisection or Newton-Raphson method, instead of using my_legedre_root.m as in hwk10.
3. useful materials
   * root finding methods ```my_bisection.m``` and ```my_newton_raphson.m``` are provided
4. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/code_template.m)
5. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/unittest.m)
6. [```my_legendre.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/my_legendre.m)
7. [```my_legendre_root.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/my_legendre_root.m)
8. [```my_bisection.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/my_bisection.m)
9. [```my_newton_raphson.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/14_legendre_root/my_newton_raphson.m)

## 15-lu-linear-equation

1. due time: 20181115 23:59
2. Given matrix A and vector b, solve the linear equations ```𝐴𝑥=𝑏``` using lu decomposition. You are required to do: 
   * first: decompose matrix A into lower triangular matrix L and upper triangular matrix U, ```A=LU```
   * second: solve triangular linear equations ```Ly=b```
   * third: solve triangular linear equations ```Ux=y```
3. [```code_template.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/15_lu_linear_equation/code_template.m)
4. [```unittest.m```](https://github.com/husisy/PHYS4150-2018/tree/master/homework/15_lu_linear_equation/unittest.m)
