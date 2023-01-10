---
theme: purplin
layout: cover
---

# Julia for HPC Workshop

European XFEL *10th January 2023*

---

# Aims for this Workshop/Course Thing

- This is designed for EuXFEL users/photon science community
- Offered to Data Department staff as a trial to work out kinks before offering to wider community

<br>

- Targeted towards both new and experienced users
- Aim to cover the basics of Julia and how it can be used for HPC

<br>

- Not comprehensive, but should give you a good idea of what Julia is and how it can be used
- Intended as a starting point for further learning
- Or as a 'taster' to see if Julia is something you want to learn more about

---

<img src="https://indico.desy.de/event/36933/attachments/78369/101679/julia-hpc-provisional-timetable.png">

<!--
- Three days of sessions
- One core two hour session, two one hour sessions
-->

---
layout: two-cols
---

# Participation

Optional but encouraged

Can be done from any device:

- Maxwell via Max-JHub
- Desktop/Laptop
- MyBinder (experimental)
- Static Website

::right::

Set up Julia on a computer where it is not available:

```sh
curl -fsSL https://install.julialang.org | sh
juliaup add 1.8
# this has been written and tested using 1.8.4
# but any version ~1.8 should work
```

Clone repository and setup:

```sh
git clone https://github.com/RobertRosca/julia-hpc-workshop.git
cd julia-hpc-workshop
# module load maxwell julia  # If you are on Maxwell
make setup  # will install required Julia dependencies
```

This will:

- Create the environment with all dependencies
- Install kernels for Jupyter

---

# "Why We Created Julia"

In short, because we are greedy.

For the work we do — **scientific computing, machine learning, data mining, large-scale linear algebra, distributed and parallel computing** — each *[common programming language, C, Python, Ruby, Mathematica]* is perfect for some aspects of the work and terrible for others. **Each one is a trade-off**.

We want **the speed of C** with the dynamism of Ruby. We want a language with true macros like Lisp, but with obvious, familiar **mathematical notation** like Matlab. We want something as usable for **general programming as Python**, as easy for **statistics** as R, as powerful for **linear algebra** as Matlab. Something that is **simple to learn**, yet powerful. We want it **interactive and we want it compiled**.

While we're being demanding, we want something that provides the **distributed power** of Hadoop[...]. We want to write simple scalar loops that compile down to tight machine code using just the registers on a single CPU. We want to **write A*B and launch a thousand computations on a thousand machines**, calculating a vast matrix product together.

https://julialang.org/blog/2012/02/why-we-created-julia/

<!--
- Why Julia? Why would you want to use it? Why does it even exist?
- Good starting point is announcement blog post
- Aim is to have it all, a high-level, high-performance dynamic programming language for numerical computing
- Julia is designed for scientific computing from the ground up
- The main appeal is that it aims to be both fast and easy to use
-->

---

# Did They Achieve It?

Case Studies

- Pharmaceuticals - Pfizer: pharmacology simulations up to 175x faster using Julia with GPUs
- Insurance - Aiva: 20x to 1000x faster [...] reduced code for compliance models from 14k LoC in a proprietary legacy system to just 1k in Julia
- Finance - BlackRock, the world’s largest asset manager, uses Julia to power their trading platform
- Forex - State Street uses Julia to identify best execution for foreign exchange trading
- Government - Federal Reserve: 6x-10x faster, 1/2 LoC, reduced complexity, improved readability
- Safety - FAA: Using Julia to Develop the Next Generation Airborne Collision Avoidance System, requires computation of over 650 billion decision points... reduced the time required to conduct these computations by several years
- Astronomy - Celeste: 1,000x faster single threaded execution (former) record holder for compute
- Energy - extremely long list ranging from ARPA/DoE and US National Labs to Chevron to grid providers using Julia to forecast energy demand

<!--
- Real-world use is more interesting than benchmarks
- Julia is used by a huge range of companies, not just a bit but for crucial workloads
-->

---
layout: iframe
url: https://julialang.org/benchmarks/
---

---

# Language Overview

<div grid="~ cols-2 gap-2" m="-t-2">

- Designed for scientific use
  - 'Python-like' syntax
  - Great for interactive use (REPL, Jupyter)
  - Powerful built-in linear algebra, distributed computing, statistics, etc...
  - Excellent package manager

- Focus on HPC use
  - Excellent compilation and optimisation
  - Parallelism and distributed computing built-in
  - Hardware-specific acceleration easy to use
  - Interactive HPC with Jupyter/REPL

<div>

<div grid="~ cols-2 gap-2" m="-t-2">
```julia
function sumup()
    x = 0
    for i in 1:100
        x += i
    end
    return x
end
```

```python
# Python:
def sumup():
    x = 0
    for i in range(100):
        x += i

    return x
```

</div>

Julia compiled to LLVM IR:

```julia
;  @ REPL[1]:1 within `sumup`
define i64 @julia_sumup_124() #0 {
top:
;  @ REPL[1]:6 within `sumup`
  ret i64 5050
}
```

Compiler optimises away all code - returns a constant integer!

</div>

</div>

---

# Julia 'Bridges Gaps'

- Gap between domain science and HPC
  - Researchers/scientists want to use high-level languages, e.g. Python, Matlab, R
  - Usually those languages are not really synonymous with 'high performance', that's more C, Fortran

- This leads to a "two language" problem:

  "Researchers often find themselves coding algorithms in one programming language, only to have to rewrite them in a faster one"

- Julia is a "one language" solution to this
  - High-level language that is also high performance -  [come for the syntax, stay for the speed](https://www.nature.com/articles/d41586-019-02310-3)!
  - Provides ways to **gradually increase performance** as needed

- Also bridges gap between expert researchers and expert developers
  - Performant Julia code is written in Julia, not C (numpy is 53% C, pyFAI ~12%)

---
layout: center
---

# Questions?
