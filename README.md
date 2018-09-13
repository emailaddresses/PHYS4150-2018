**claims: anything in this code repo not consistent with lecture content, plaese follow lecture content as standard**


# PHYS4150-2018
This is the website for course PHYS4150 Computational Physics, including course materials and some code snippet. 
I hope it will be helpful for course learning.


# Usage
1. check course website frequently, especially course notification section.
2. follow the Instruction section to view / download the course materials.
3. follow the Instruction section to setup Octave / MATLAB on PC.
4. go through *1 - programming get-started* to get familar with Octave / MATLAB
5. focus on the course algorithms, try to understand, implement, and apply them to real physics problem


# Course Notification
1. [homework list](https://github.com/husisy/PHYS4150-2018/tree/master/homework) (2018xxxx xx:xx is due time)
   * [0-square-root-of-complex-number](https://github.com/husisy/PHYS4150-2018/tree/master/homework#0-square-root-of-complex-number) (for demo only)
   * [1-programming-get-started](https://github.com/husisy/PHYS4150-2018/tree/master/homework#1-programming-get-started) (ungraded and nothing need to submit)
   * [2-optimization-generate-K-prime-number](https://github.com/husisy/PHYS4150-2018/tree/master/homework#2-optimization-generate-K-prime-number) 20180927 23:59
   * [3-calculate-pi-Liu-Hui](https://github.com/husisy/PHYS4150-2018/tree/master/homework#3-calculate-pi-Liu-Hui) 20180927 23:59
   * [4-calculate-pi-Buffon-Needle](https://github.com/husisy/PHYS4150-2018/tree/master/homework#4-calculate-pi-Buffon-Needle) 20180927 23:59
   * [5-calculate-pi-series-expansion](https://github.com/husisy/PHYS4150-2018/tree/master/homework#5-calculate-pi-series-expansion) 20180927 23:59 (optional)
2. tutorials session (**including additional tutorials session**)
   - [ ] (every week) Thursday 11:30-12:20 (10:30-11:20 for lecture)
   - [ ] 20180926 (Wed) 11:30-12:20 MBG07, Main Building
   - [ ] 20181010 (Wed) 11:30-12:20 MBG07, Main Building
   - [ ] 20181031 (Wed) 11:30-12:20 MBG07, Main Building
   - [ ] 20181121 (Wed) 11:30-13:20 MBG07, Main Building
   - [x] 20180912 (Wed) 11:30-12:20 MBG07, Main Building, [tutorial session materials](https://github.com/husisy/PHYS4150-2018/tree/master/tutorial_material/TS20180912)
3. [last updated 20180913](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/update_note.md)

# Course Information
1. notice: course information is copied from [Online Syllabuses and Regulations](https://webapp.science.hku.hk/sr4/servlet/enquiry?Type=Course&course_code=PHYS4150)
2. PHYS4150: Computational Physics
3. Course Co-ordinator: Prof J. Wang
4. Course Contents and Topics
   * Introductory computational physics and computer algebra
   * integration and differentiation, interpolation and extrapolation
   * ordinary differential equation (ODE): classical mechanics problems
   * partial differential equations (PDE): the Maxwell's equation, the diffusion equation, and the Schrodinger equation
   * matrix methods: systems of equations and eigenvalue problems applied to Poisson's equation and electronic structure calculations
   * Monte Carlo (Metropolis algorithm)
   * molecular dynamics
   * etc.
5. course teaching and learning activities
   * lectures (36 hours)
   * laboratory (12 hours)
   * tutorials (8 hours)
6. assessment methods and weighting
   * assignments (20%)
   * examination (40%)
   * presentation (15%)
   * project report (25%)
7. recommended reading materials
   * lecture notes
   * Samuel S.M. Wong: Computational Methods in Physics and Engineering
   * N.J. Giordano and N. Nakanishi: Computational physics
8. points not listed here but still important (see origin website)
   * Course Objectives
   * Course Learning Outcomes
   * pre-requisites
   * grade descriptors


# Folder organization
1. ```lecture_note```: the official course lecture notes distributed by Prof. Wang. Most in ```.pdf``` format
2. ```lecture_PPT```: the official course PPT, usally updated after every course. Most in ```.ppt``` format
3. ```tutorial_material```: the tutorials session present content
   * ```.mlx```: MATLAB live scripts file, could only open in MATLAB, which combines both formatted explanatory text and code
   * ```.pdf```: every ```.mlx``` file will be converted to ```.pdf``` file for easy-view purpose
   * ```.txt```: tutorial session draft
4. ```homework```: *still under construction, TODO*
5. ```MD_lecture_note```: rewrite lecture note according to personal understanding. All in ```.md``` format
6. ```code_draft```: *deleted. I find all code snippets have been included in requred or optional homework.*
7. ```project```: *still under construction*
8. ```misc/*```: *still under construction*
   * ```misc/markdown```: write kinds of instructions markdown files
   * ```misc/axmath```: *deleted, no enough time to maintain*


# Instruction
1. [how to view / download file from this repo](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/view_and_download_file.md)
2. [Octave Installation](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/Octave_installation.md)
3. [MATLAB Installation](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/MATLAB_installation.md)
4. [how to view / edit markdown](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/view_and_edit_markdown.md)
5. [submit and collect homework](https://github.com/husisy/PHYS4150-2018/tree/master/misc/markdown/submit_and_collect_homework.md)


# TO-DO-LIST
1. homework folder structure
2. Chapter draft
2. mathjax support
3. Simplified / Traditional Chinese version


# FAQ
*still under construction*
1. what is MATLAB live scripts ```.mlx```
 > see [official documentation](https://www.mathworks.com/help/matlab/matlab_prog/what-is-a-live-script-or-function.html;jsessionid=9a500aa277e7aa38ca708835117a). It's a good tool for demostration, but personally I do not recommand to use it
 for other use as currently ```.mlx``` is a little bit slower than that in ```.m``` or in command window.


# Welcome for contribution
you could find a lot of *TODO* tags in this code repo, and those tags are all waiting for your contributions to complete.

Also, if you
* have some interesting idea
* write some related codes worthy sharing
* find some language error. (...my English is poor)
* find some code hard to understand
* find any broken links
* etc. bulabula

you could
* create a issue. (at issues page, click new issue)
* make a pull requests. (no idea how to use)
* contact me. (zhangchk [aaaatttt] hku.hk)


# About LICENSE
This code repo will borrow a lot of code from other source most of which will use a different LICENSE from current code repo. I am not sure whether the current repo LICENSE is compatible with that in the original source. If any incompitiblity, PLAESE give me advice on how to deal with that, many thanks.

# Contributors
*TODO*
