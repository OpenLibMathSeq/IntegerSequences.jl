var documenterSearchIndex = {"docs": [

{
    "location": "about/#",
    "page": "About",
    "title": "About",
    "category": "page",
    "text": ""
},

{
    "location": "about/#About-1",
    "page": "About",
    "title": "About",
    "category": "section",
    "text": "(Image: Sequences)A Julia module implementing mathematical sequencesBuild a Julia library for studying mathematical integer sequences. To this goal the library should:Identify general methods used in generating integer sequences and provide reference  implementations for important classes.\nProvide a set of classical sequence-to-sequence, sequence-to-triangle and triangle-to-sequence transformations.\nProvide a low level infrastructure for efficient development and testing of integer series and sequences."
},

{
    "location": "#",
    "page": "Sequences",
    "title": "Sequences",
    "category": "page",
    "text": ""
},

{
    "location": "#Sequences.André",
    "page": "Sequences",
    "title": "Sequences.André",
    "category": "function",
    "text": "Return the generalized André numbers which are the m-alternating permutations of length n, cf. A181937.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BellNumber",
    "page": "Sequences",
    "title": "Sequences.BellNumber",
    "category": "function",
    "text": "Return the n-th Bell number. Bell numbers count the ways to partition a set of n labeled elements.\n\njulia> BellNumber(10)\n115975\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BellNumberList",
    "page": "Sequences",
    "title": "Sequences.BellNumberList",
    "category": "function",
    "text": "Return a list of the first m Bell numbers (a.k.a. exponential numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BellTrans",
    "page": "Sequences",
    "title": "Sequences.BellTrans",
    "category": "function",
    "text": "The Bell transform transforms an integer sequence into an integer triangle; also known as incomplete Bell polynomials. Let X be an integer sequence, then B_nk(X) = sum_m=1^n-k+1 binomn-1m-1 Xm B_n-mk-1(X) where B_00 = 1 B_n0 = 0 for n1 B_0k = 0 for k1.\n\n\n\n\n\nThe Bell transform transforms an integer sequence into an integer triangle; also known as incomplete Bell polynomials. Let F be an integer sequence generating function, then B_nk(F) = sum_m=1^n-k+1 binomn-1m-1 F(m) B_n-mk-1(F) where B_00 = 1 B_n0 = 0 for n1 B_0k = 0 for k1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BellTriangle",
    "page": "Sequences",
    "title": "Sequences.BellTriangle",
    "category": "function",
    "text": "The Bell triangle gathers the results of the Bell transform applied to the initial segments of the input sequence. Famously the sequence (1,1,1,...) is mapped to the triangle of the Stirling set numbers.\n\njulia> ShowAsΔ(BellTriangle(5, k -> 1))\n1\n0 1\n0 1 1\n0 1 3 1\n0 1 7 6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Bernoulli",
    "page": "Sequences",
    "title": "Sequences.Bernoulli",
    "category": "function",
    "text": "Return the rational Bernoulli number B_n  (cf. A027641/A027642).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BernoulliInt",
    "page": "Sequences",
    "title": "Sequences.BernoulliInt",
    "category": "function",
    "text": "Return the generalized integer Bernoulli numbers b_m(n) = n timesAndré(m n-1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BernoulliIntList",
    "page": "Sequences",
    "title": "Sequences.BernoulliIntList",
    "category": "function",
    "text": "Return a list of length len of the integer Bernoulli numbers b_m(n) using Seidel\'s boustrophedon algorithm.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BernoulliList",
    "page": "Sequences",
    "title": "Sequences.BernoulliList",
    "category": "function",
    "text": "Return a list of the first len Bernoulli numbers B_n (cf. A027641/A027642).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Bil",
    "page": "Sequences",
    "title": "Sequences.Bil",
    "category": "function",
    "text": "Alias for the function BinaryIntegerLength.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.BinaryIntegerLength",
    "page": "Sequences",
    "title": "Sequences.BinaryIntegerLength",
    "category": "function",
    "text": "Return the length of the binary extension of an integer n, which is defined as 0 if n = 0 and for n  0 as  log _2(n)  + 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Binomial",
    "page": "Sequences",
    "title": "Sequences.Binomial",
    "category": "function",
    "text": "Return the extended binomial coefficients defined for all n  Z and k  Z. Behaves like the binomial function in Maple and Mathematica. binomnk = lim limits_x rightarrow 1(Γ(n + x)  (Γ(k + x) Γ(n - k + x)))\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ClausenNumber",
    "page": "Sequences",
    "title": "Sequences.ClausenNumber",
    "category": "function",
    "text": "Return the Clausen number C_n which is the denominator of the Bernoulli number B_2n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ClausenNumberList",
    "page": "Sequences",
    "title": "Sequences.ClausenNumberList",
    "category": "function",
    "text": "Return the list of length len of Clausen numbers which are the denominators of the Bernoulli numbers B_2n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Coefficients",
    "page": "Sequences",
    "title": "Sequences.Coefficients",
    "category": "function",
    "text": "Return the list of coefficients of the power series s.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Combinations",
    "page": "Sequences",
    "title": "Sequences.Combinations",
    "category": "function",
    "text": "Generate all Combinations of n elements from an indexable object a. Because the number of Combinations can be very large, this function returns an iterator object. Use collect(Combinations(a, n)) to get an array of all Combinations.\n\n\n\n\n\nGenerate Combinations of the elements of a of all orders. Chaining of order iterators is eager, but the sequence at each order is lazy.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Count",
    "page": "Sequences",
    "title": "Sequences.Count",
    "category": "function",
    "text": "Return the numbers of integers ≤ n which are isA. Integers start at n=0.\n\njulia> Count(8, isPrime)\n4\n\n\n\n\n\n"
},

{
    "location": "#Sequences.DedekindEtaPowers",
    "page": "Sequences",
    "title": "Sequences.DedekindEtaPowers",
    "category": "function",
    "text": "Compute the q-expansion to length len of the Dedekind η function (without the leading factor q^124) raised to the power r, i.e. (q^-124 η(q))^r = _k  1 (1 - q^k)^r In particular, r = -1 returns the generating function of the Partition function p(k) and r = 24 gives the Ramanujan tau function τ(k).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.DeléhamΔ",
    "page": "Sequences",
    "title": "Sequences.DeléhamΔ",
    "category": "function",
    "text": "Return the product of two integer sequences introduced by Philippe Deléham in A084938.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Divides",
    "page": "Sequences",
    "title": "Sequences.Divides",
    "category": "function",
    "text": "Return true if b is divisible by a, otherwise return false.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Divisors",
    "page": "Sequences",
    "title": "Sequences.Divisors",
    "category": "function",
    "text": "Return the positive intgers dividing n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F!",
    "page": "Sequences",
    "title": "Sequences.F!",
    "category": "function",
    "text": "Return the number of permutations of n letters, n = (1 n), the factorial of n. (The notation is a shortcut breaking Julia conventions.)\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Factors",
    "page": "Sequences",
    "title": "Sequences.Factors",
    "category": "function",
    "text": "Return factors of n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.FallingFactorial",
    "page": "Sequences",
    "title": "Sequences.FallingFactorial",
    "category": "function",
    "text": "Return the falling factorial which is the product of i in (n - k + 1)n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.GammaHyp",
    "page": "Sequences",
    "title": "Sequences.GammaHyp",
    "category": "function",
    "text": "Return Γ(a) Hypergeometric1F1(b c d)\n\n\n\n\n\n"
},

{
    "location": "#Sequences.HilbertHotel",
    "page": "Sequences",
    "title": "Sequences.HilbertHotel",
    "category": "function",
    "text": "Trick described by David Hilbert in a 1924 lecture \"Über das Unendliche\".\n\n\n\n\n\n"
},

{
    "location": "#Sequences.InvOrthoPoly",
    "page": "Sequences",
    "title": "Sequences.InvOrthoPoly",
    "category": "function",
    "text": "Return the inverse of the coefficients of the orthogonal polynomials generated by s and t as a triangular array with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.JacobiTheta3Powers",
    "page": "Sequences",
    "title": "Sequences.JacobiTheta3Powers",
    "category": "function",
    "text": "The q-expansion to length len of the Jacobi theta function raised to the power r, i.e. ϑ(q)^r where ϑ(q) = 1 + _k  1 q^k^2. Number of ways of writing n as a sum of r squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.JacobiTheta4Powers",
    "page": "Sequences",
    "title": "Sequences.JacobiTheta4Powers",
    "category": "function",
    "text": "Return the q-expansion to length len of the Jacobi theta function raised to the power r, i.e. ϑ(-q)^r where ϑ(q) = 1 + _k  1 q^k^2 \n\n\n\n\n\n"
},

{
    "location": "#Sequences.KolakoskiList",
    "page": "Sequences",
    "title": "Sequences.KolakoskiList",
    "category": "function",
    "text": "Return the list of the first n terms of the Kolakoski sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.List",
    "page": "Sequences",
    "title": "Sequences.List",
    "category": "function",
    "text": "Return a list of length len of integers  0 which are isA.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.MultiFactorial",
    "page": "Sequences",
    "title": "Sequences.MultiFactorial",
    "category": "function",
    "text": "Return the multi-factorial which is the function n  (a + b a(n-1) + b)\n\n\n\n\n\n"
},

{
    "location": "#Sequences.NarayanasCows",
    "page": "Sequences",
    "title": "Sequences.NarayanasCows",
    "category": "type",
    "text": "The type object to construct a new instance of the modified Narayanas cows sequence with given length.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Nemofmpz",
    "page": "Sequences",
    "title": "Sequences.Nemofmpz",
    "category": "function",
    "text": "Think of a \'Nemo.fmpz\' as a \'BigInt\'. \'fmpz\' stands for \'fast multiple precision zahl (Zahl=integer)\'. Nemo is a library designed, developed and maintained by William Hart with the help of others. The mathematical symbol for the ring of integers is the blackbord (double-struck) Z, also written ZZ. In reference to this ZZ(n) defines the integer n as a fmpz.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.NextPrime",
    "page": "Sequences",
    "title": "Sequences.NextPrime",
    "category": "function",
    "text": "Return least prime  n. The next_prime function of Mathematica, Maple, Magma and SageMath (cf. A151800).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Nth",
    "page": "Sequences",
    "title": "Sequences.Nth",
    "category": "function",
    "text": "Return the Nth integer which is isA. (For N ≤ 0 return 0.)\n\njulia> Nth(7, isPrime)\n17\n\n\n\n\n\n"
},

{
    "location": "#Sequences.OrthoPoly",
    "page": "Sequences",
    "title": "Sequences.OrthoPoly",
    "category": "function",
    "text": "By the theorem of Favard an orthogonal polynomial systems  p_n(x) is a sequence of real polynomials with deg(p_n(x)) = n for all n if and only if p_n+1(x) = (x - s_n)p_n(x) - t_n p_n-1(x) with p_0(x)=1 for some pair of seq\'s s_k and t_k. Return the coefficients of the polynomials as a triangular array with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PSfactorial",
    "page": "Sequences",
    "title": "Sequences.PSfactorial",
    "category": "function",
    "text": "Return the factorial n = 12  n, which is the order of the symmetric group S_n or the number of permutations of n letters (cf. A000142).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Partition",
    "page": "Sequences",
    "title": "Sequences.Partition",
    "category": "function",
    "text": "Generates the integer partitions of n in graded reverse lexicographic order, the canonical ordering of partitions.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PartitionNumberList",
    "page": "Sequences",
    "title": "Sequences.PartitionNumberList",
    "category": "function",
    "text": "Return the first n numbers of integer partitions.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Pascal",
    "page": "Sequences",
    "title": "Sequences.Pascal",
    "category": "function",
    "text": "The classical binomial coefficients defined for n0 and 0kn (a.k.a. Pascal\'s triangle).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PolygonalNumber",
    "page": "Sequences",
    "title": "Sequences.PolygonalNumber",
    "category": "function",
    "text": "Return the polygonal number with shape k.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PreviousPrime",
    "page": "Sequences",
    "title": "Sequences.PreviousPrime",
    "category": "function",
    "text": "Return the largest prime in Z (the ring of all integers) less than n for n  0 (cf. A007917).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PrimeDivisors",
    "page": "Sequences",
    "title": "Sequences.PrimeDivisors",
    "category": "function",
    "text": "Return the prime numbers dividing n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PrimeList",
    "page": "Sequences",
    "title": "Sequences.PrimeList",
    "category": "function",
    "text": "Return a list of the first n primes.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PrimePi",
    "page": "Sequences",
    "title": "Sequences.PrimePi",
    "category": "function",
    "text": "Return the number of primes  n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PrimePiList",
    "page": "Sequences",
    "title": "Sequences.PrimePiList",
    "category": "function",
    "text": "Return the list of number of primes  n for n  0.\n\njulia> PrimePiList(8)\n[0, 0, 1, 2, 2, 3, 3, 4]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PrimeSieve",
    "page": "Sequences",
    "title": "Sequences.PrimeSieve",
    "category": "function",
    "text": "Return the prime sieve, as a BitArray, of the positive integers (from lo, if specified) up to hi. Useful when working with either primes or composite numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Primes",
    "page": "Sequences",
    "title": "Sequences.Primes",
    "category": "function",
    "text": "Return the collection of the prime numbers (from lo, if specified) up to hi.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Println",
    "page": "Sequences",
    "title": "Sequences.Println",
    "category": "function",
    "text": "Print the array without typeinfo.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Product",
    "page": "Sequences",
    "title": "Sequences.Product",
    "category": "function",
    "text": "If a  b then return the product of i in ab else return 1.\n\n\n\n\n\nReturn the accumulated product of an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.PyramidalNumber",
    "page": "Sequences",
    "title": "Sequences.PyramidalNumber",
    "category": "function",
    "text": "Return the pyramidal number with shape k.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.QTriangle",
    "page": "Sequences",
    "title": "Sequences.QTriangle",
    "category": "function",
    "text": "Return a trianguler array with n rows set to 0 (type QQ).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Queens",
    "page": "Sequences",
    "title": "Sequences.Queens",
    "category": "function",
    "text": "Returns the profile of the backtrack tree for the n queens problem (see [A319284]).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Radical",
    "page": "Sequences",
    "title": "Sequences.Radical",
    "category": "function",
    "text": "Return the radical of n which is the product of the prime numbers dividing n (also called the squarefree kernel of n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RamanujanTau",
    "page": "Sequences",
    "title": "Sequences.RamanujanTau",
    "category": "function",
    "text": "Return Ramanujan\'s tau(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RamanujanTauList",
    "page": "Sequences",
    "title": "Sequences.RamanujanTauList",
    "category": "function",
    "text": "List of the first values of the Ramanujan tau function, the Fourier coefficients of the Weierstrass Delta-function.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RecTriangle",
    "page": "Sequences",
    "title": "Sequences.RecTriangle",
    "category": "type",
    "text": "A recursive triangle RecTriangle is a subtype of AbstractTriangle. The rows of the triangle are generated by a function gen(n, k, prevrow) defined for n  0 and 0  k  n. The function returns value of type Nemo.fmpz. The parameter prevrow is a function which returns the values of row(n-1) of the triangle and 0 if k  0 or k  n. The function prevrow is provided by an instance of RecTriangle and must not be defined by the user.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Records",
    "page": "Sequences",
    "title": "Sequences.Records",
    "category": "type",
    "text": "The type object to construct an iterated search for records in sequences.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RiordanProduct",
    "page": "Sequences",
    "title": "Sequences.RiordanProduct",
    "category": "function",
    "text": "Return the Riordan array associated with the generating functions a and b.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RiordanSquare",
    "page": "Sequences",
    "title": "Sequences.RiordanSquare",
    "category": "function",
    "text": "Return the Riordan array (Riordan product) a 	imes a.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RisingFactorial",
    "page": "Sequences",
    "title": "Sequences.RisingFactorial",
    "category": "function",
    "text": "Return the rising factorial which is the product of i in n(n + k - 1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Row",
    "page": "Sequences",
    "title": "Sequences.Row",
    "category": "function",
    "text": "Return row n (0  n) of the lower triangular matrix T or the row n in reversed order if reversed is set true.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.RowSums",
    "page": "Sequences",
    "title": "Sequences.RowSums",
    "category": "function",
    "text": "Return the row sums of a triangle, if alternate=true then the alternating row sums.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.SelfConvRec",
    "page": "Sequences",
    "title": "Sequences.SelfConvRec",
    "category": "function",
    "text": "An exactly solvable self-convolutive recurrence studied by R. J. Martin and M. J. Kearney.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.SeqName",
    "page": "Sequences",
    "title": "Sequences.SeqName",
    "category": "function",
    "text": "Return the name of a OEIS sequence given a similar named function as a string.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.SeqNum",
    "page": "Sequences",
    "title": "Sequences.SeqNum",
    "category": "function",
    "text": "Return the A-number of a OEIS sequence given a similar named function as an integer.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.SeqPrint",
    "page": "Sequences",
    "title": "Sequences.SeqPrint",
    "category": "function",
    "text": "Print the array with or without typeinfo.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.SeqShow",
    "page": "Sequences",
    "title": "Sequences.SeqShow",
    "category": "function",
    "text": "Print the array A in the format n  An for n in the given range.\n\n\n\n\n\nPrint the array A in the format n  An for n in the range first:last.\n\n\n\n\n\nPrint the array A in the format n  An.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Sfactorial",
    "page": "Sequences",
    "title": "Sequences.Sfactorial",
    "category": "function",
    "text": "Return the factorial of n. Basic implementation of the swing algorithm using no primes. An advanced version based on prime-factorization is available as the prime-swing factorial factorialPS.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ShowAsMatrix",
    "page": "Sequences",
    "title": "Sequences.ShowAsMatrix",
    "category": "function",
    "text": "Print the triangle in matrix form.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ShowAsΔ",
    "page": "Sequences",
    "title": "Sequences.ShowAsΔ",
    "category": "function",
    "text": "Display a lower triangular matrix.\n\n\n\n\n\nDisplay an array as a lower triangular matrix.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Swing",
    "page": "Sequences",
    "title": "Sequences.Swing",
    "category": "function",
    "text": "Computes the swinging factorial (a.k.a. Swing numbers n≀) (cf. A056040).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Triangle",
    "page": "Sequences",
    "title": "Sequences.Triangle",
    "category": "type",
    "text": "A Triangle is a list of rows. The rows of the triangle are generated by a function (n::Int, k::Int) → gen::fmpz for 0  k  n and 0  n dim.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.TriangleToList",
    "page": "Sequences",
    "title": "Sequences.TriangleToList",
    "category": "function",
    "text": "Return the triangle as a list of integers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.TriangularNumber",
    "page": "Sequences",
    "title": "Sequences.TriangularNumber",
    "category": "function",
    "text": "Return then-th triangular number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.UlamList",
    "page": "Sequences",
    "title": "Sequences.UlamList",
    "category": "function",
    "text": "Return a list of Ulam numbers u(n), u(n) the least number > u(n-1) which is a unique sum of two distinct earlier terms, u(1) = 1 and u(2) = 2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ZArray",
    "page": "Sequences",
    "title": "Sequences.ZArray",
    "category": "function",
    "text": "Return an array of type fmpz of length n preset with 0.\n\n\n\n\n\nReturn an array of type fmpz and of size n filled by the values of the function f in the range offset:n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ZTriangle",
    "page": "Sequences",
    "title": "Sequences.ZTriangle",
    "category": "function",
    "text": "Return a trianguler array with n rows set to 0 (type ZZ).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.assertTriangular",
    "page": "Sequences",
    "title": "Sequences.assertTriangular",
    "category": "function",
    "text": "Return the square root of 2n or throw an ArgumentError if n is not a triangular number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.fromΔ",
    "page": "Sequences",
    "title": "Sequences.fromΔ",
    "category": "function",
    "text": "Convert a lower triangular array to a square matrix.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isAbundant",
    "page": "Sequences",
    "title": "Sequences.isAbundant",
    "category": "function",
    "text": "Is n an abundant number, i.e. is σ(n)  2n ?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isCarmichael",
    "page": "Sequences",
    "title": "Sequences.isCarmichael",
    "category": "function",
    "text": "Is n a Carmichael/Šimerka number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isComposite",
    "page": "Sequences",
    "title": "Sequences.isComposite",
    "category": "function",
    "text": "Is the integer n a composite number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isCyclic",
    "page": "Sequences",
    "title": "Sequences.isCyclic",
    "category": "function",
    "text": "Is n a cyclic number? n such that there is just one group of order n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isEven",
    "page": "Sequences",
    "title": "Sequences.isEven",
    "category": "function",
    "text": "Is n divisble by 2?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isNonnegative",
    "page": "Sequences",
    "title": "Sequences.isNonnegative",
    "category": "function",
    "text": "Is the integer n nonnegative?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isOdd",
    "page": "Sequences",
    "title": "Sequences.isOdd",
    "category": "function",
    "text": "Is n indivisble by 2?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPerfectPower",
    "page": "Sequences",
    "title": "Sequences.isPerfectPower",
    "category": "function",
    "text": "Is the integer n a perfect powers?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPositive",
    "page": "Sequences",
    "title": "Sequences.isPositive",
    "category": "function",
    "text": "Is the integer n positive?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPowerOfPrimes",
    "page": "Sequences",
    "title": "Sequences.isPowerOfPrimes",
    "category": "function",
    "text": "Is the integer n a power of primes?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPrime",
    "page": "Sequences",
    "title": "Sequences.isPrime",
    "category": "function",
    "text": "Return true if n is prime false otherwise.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPrimePower",
    "page": "Sequences",
    "title": "Sequences.isPrimePower",
    "category": "function",
    "text": "Is the integer n a prime power?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isPrimeTo",
    "page": "Sequences",
    "title": "Sequences.isPrimeTo",
    "category": "function",
    "text": "Query if m is prime to n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isSquare",
    "page": "Sequences",
    "title": "Sequences.isSquare",
    "category": "function",
    "text": "Is the integer n a square number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isSquareFree",
    "page": "Sequences",
    "title": "Sequences.isSquareFree",
    "category": "function",
    "text": "Is the integer n a squarefree number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isStrongCyclic",
    "page": "Sequences",
    "title": "Sequences.isStrongCyclic",
    "category": "function",
    "text": "Is n a strong cyclic number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isStrongPrimeTo",
    "page": "Sequences",
    "title": "Sequences.isStrongPrimeTo",
    "category": "function",
    "text": "Query if m is strong prime to n. m is strong prime to n iff m is prime to n and m does not divide n-1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isTriangular",
    "page": "Sequences",
    "title": "Sequences.isTriangular",
    "category": "function",
    "text": "Is n a triangular number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isUlam",
    "page": "Sequences",
    "title": "Sequences.isUlam",
    "category": "function",
    "text": "Is n an Ulam number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.isZumkeller",
    "page": "Sequences",
    "title": "Sequences.isZumkeller",
    "category": "function",
    "text": "Is n a Zumkeller number? A Zumkeller number n is an integer whose divisors can be partitioned into two disjoint sets whose sums are both σ(n)2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.mods",
    "page": "Sequences",
    "title": "Sequences.mods",
    "category": "function",
    "text": "Return the least absolute remainder. mods uses the symmetric representation for integers modulo m, i.e. remainders will be reduced to integers in the range -div(m - 1 2)div(m 2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_isinstalled",
    "page": "Sequences",
    "title": "Sequences.oeis_isinstalled",
    "category": "function",
    "text": "Indicates if the local copy of the OEIS data (the so-called \'stripped\' file) is installed (in ../data).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_local",
    "page": "Sequences",
    "title": "Sequences.oeis_local",
    "category": "function",
    "text": "Get the sequence with A-number \'anum\' from a local copy of the expanded \'stripped.gz\' file which can be downloaded from the OEIS. \'bound\' is an upper bound for the number of terms returned. The \'stripped\' file is assumed to be in the \'../data\' directory.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_notinstalled",
    "page": "Sequences",
    "title": "Sequences.oeis_notinstalled",
    "category": "function",
    "text": "Indicates if the local copy of the OEIS data (the so-called \'stripped\' file) is not installed and warns.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_path",
    "page": "Sequences",
    "title": "Sequences.oeis_path",
    "category": "function",
    "text": "Returns the path where the oeis data is expected.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_readbfile",
    "page": "Sequences",
    "title": "Sequences.oeis_readbfile",
    "category": "function",
    "text": "Read a file in the so-called b-file format of the OEIS.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_remote",
    "page": "Sequences",
    "title": "Sequences.oeis_remote",
    "category": "function",
    "text": "Download the sequence with A-number \'anum\' from the OEIS to a file in json format. The file is saved in the \'data\' directory.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_search",
    "page": "Sequences",
    "title": "Sequences.oeis_search",
    "category": "function",
    "text": "Search for a sequence in the local OEIS database (\'../data/stripped\'). Input the sequence as a comma separated string. If restart = true the search is redone in the case that no match was found with the first term removed from the search string. Prints the matches.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_trimdata",
    "page": "Sequences",
    "title": "Sequences.oeis_trimdata",
    "category": "function",
    "text": "Make sure that the length of the data section of an OEIS entry does not exceed 260 characters.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.oeis_writebfile",
    "page": "Sequences",
    "title": "Sequences.oeis_writebfile",
    "category": "function",
    "text": "Write a so-called b-file for submission to the OEIS. The file is saved in the \'data\' directory.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.takefirst",
    "page": "Sequences",
    "title": "Sequences.takefirst",
    "category": "function",
    "text": "Return the first n numbers satisfying the predicate isA.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.toΔ",
    "page": "Sequences",
    "title": "Sequences.toΔ",
    "category": "function",
    "text": "Convert a square matrix to a list using only the T(nk) with 0  k  n. Returns a ZArray.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.Ω",
    "page": "Sequences",
    "title": "Sequences.Ω",
    "category": "function",
    "text": "Return Ω(n), the number of prime divisors of n counted with multiplicity (cf. A001222).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.σ",
    "page": "Sequences",
    "title": "Sequences.σ",
    "category": "function",
    "text": "Return σ(n) (a.k.a. σ_1(n)), the sum of the divisors of n (cf. A000203).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.τ",
    "page": "Sequences",
    "title": "Sequences.τ",
    "category": "function",
    "text": "Return τ(n) (a.k.a. σ_0(n)), the number of divisors of n (cf A000005).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ω",
    "page": "Sequences",
    "title": "Sequences.ω",
    "category": "function",
    "text": "Return ω(n),  the number of distinct prime divisors of n (cf. A001221).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.ϕ",
    "page": "Sequences",
    "title": "Sequences.ϕ",
    "category": "function",
    "text": "Return the Euler totient ϕ(n), numbers which are  n and prime to n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.:↑",
    "page": "Sequences",
    "title": "Sequences.:↑",
    "category": "function",
    "text": "Return the rising factorial which is the product of i in n(n + k - 1). A convenient infix syntax for the rising factorial is n ↑ k.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.:↓",
    "page": "Sequences",
    "title": "Sequences.:↓",
    "category": "function",
    "text": "Return the falling factorial which is the product of i in (n - k + 1)n. A convenient infix syntax for the falling factorial is n ↓ k.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.∏",
    "page": "Sequences",
    "title": "Sequences.∏",
    "category": "function",
    "text": "If a  b then return the product of i in ab else return 1.\n\n\n\n\n\nReturn the accumulated product of an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.⊥",
    "page": "Sequences",
    "title": "Sequences.⊥",
    "category": "function",
    "text": "Query if m is prime to n. Knuth, Graham and Patashnik write in \"Concrete Mathematics\": \"Hear us, O mathematicians of the world! Let us not wait any longer! We can make many formulas clearer by defining a new notation now! Let us agree to write m ⊥ n, and to say \"m is prime to n\", if m and n are relatively prime.\"\n\n\n\n\n\n"
},

{
    "location": "#Sequences.⍊",
    "page": "Sequences",
    "title": "Sequences.⍊",
    "category": "function",
    "text": "Query if m is strong prime to n. m is strong prime to n iff m is prime to n and m does not divide n-1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.C000002",
    "page": "Sequences",
    "title": "Sequences.C000002",
    "category": "function",
    "text": "Generate the Kolakoski sequence which is the unique sequence over the alphabet 1 2 starting with 1 and having the sequence of run lengths identical with itself.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I000002",
    "page": "Sequences",
    "title": "Sequences.I000002",
    "category": "function",
    "text": "Iterate over the first n Kolakoski numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000002",
    "page": "Sequences",
    "title": "Sequences.L000002",
    "category": "function",
    "text": "Return the list of the first n terms of the Kolakoski sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000005",
    "page": "Sequences",
    "title": "Sequences.V000005",
    "category": "function",
    "text": "Return the number of divisors of n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000010",
    "page": "Sequences",
    "title": "Sequences.V000010",
    "category": "function",
    "text": "Return the number of integers  n and prime to n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000032",
    "page": "Sequences",
    "title": "Sequences.G000032",
    "category": "function",
    "text": "The generating function of the Lucas numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000032",
    "page": "Sequences",
    "title": "Sequences.L000032",
    "category": "function",
    "text": "Return a list of Lucas numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000041",
    "page": "Sequences",
    "title": "Sequences.L000041",
    "category": "function",
    "text": "Return the first n numbers of integer partitions.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F000045",
    "page": "Sequences",
    "title": "Sequences.F000045",
    "category": "function",
    "text": "Iterate over the Fibonacci numbers which do not exceed n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000045",
    "page": "Sequences",
    "title": "Sequences.G000045",
    "category": "function",
    "text": "The generating function of the Fibonacci numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I000045",
    "page": "Sequences",
    "title": "Sequences.I000045",
    "category": "function",
    "text": "Iterate over the first n Fibonacci numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000045",
    "page": "Sequences",
    "title": "Sequences.L000045",
    "category": "function",
    "text": "Return the first n Fibonacci numbers in an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.R000045",
    "page": "Sequences",
    "title": "Sequences.R000045",
    "category": "function",
    "text": "Fibonacci function for real values, returns a Float64.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000045",
    "page": "Sequences",
    "title": "Sequences.V000045",
    "category": "function",
    "text": "Return the n-th Fibonacci number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.is000045",
    "page": "Sequences",
    "title": "Sequences.is000045",
    "category": "function",
    "text": "Query if n is a Fibonacci number, returns a Bool.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000073",
    "page": "Sequences",
    "title": "Sequences.G000073",
    "category": "function",
    "text": "The generating function of the Tribonacci numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000073",
    "page": "Sequences",
    "title": "Sequences.L000073",
    "category": "function",
    "text": "Return a list of Tribonacci numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000085",
    "page": "Sequences",
    "title": "Sequences.L000085",
    "category": "function",
    "text": "Return the number of involutions.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000108",
    "page": "Sequences",
    "title": "Sequences.G000108",
    "category": "function",
    "text": "The generating function of the Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000108",
    "page": "Sequences",
    "title": "Sequences.L000108",
    "category": "function",
    "text": "Return a list of Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000110",
    "page": "Sequences",
    "title": "Sequences.L000110",
    "category": "function",
    "text": "Return a list of Bell numbers of length len.\n\njulia> L000110(10)\n[1, 1, 2, 5, 15, 52, 203, 877, 4140, 21147]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000110",
    "page": "Sequences",
    "title": "Sequences.V000110",
    "category": "function",
    "text": "Return the n-th Bell number B_n.\n\njulia> V000110(11)\n678570\n\n\n\n\n\n"
},

{
    "location": "#Sequences.C000111",
    "page": "Sequences",
    "title": "Sequences.C000111",
    "category": "function",
    "text": "Generate the André numbers (a.k.a. Euler-up-down numbers A000111). Don\'t confuse with the Euler numbers A122045.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000111",
    "page": "Sequences",
    "title": "Sequences.V000111",
    "category": "function",
    "text": "Return the up-down numbers (2-alternating permutations).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000118",
    "page": "Sequences",
    "title": "Sequences.L000118",
    "category": "function",
    "text": "Number of ways of writing a nonnegative integer n as a sum of 4 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000122",
    "page": "Sequences",
    "title": "Sequences.L000122",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a square.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000132",
    "page": "Sequences",
    "title": "Sequences.L000132",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 5 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000141",
    "page": "Sequences",
    "title": "Sequences.L000141",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 6 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000142",
    "page": "Sequences",
    "title": "Sequences.V000142",
    "category": "function",
    "text": "Return the factorial numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000143",
    "page": "Sequences",
    "title": "Sequences.L000143",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 8 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000144",
    "page": "Sequences",
    "title": "Sequences.L000144",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 10 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000145",
    "page": "Sequences",
    "title": "Sequences.L000145",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 12 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000165",
    "page": "Sequences",
    "title": "Sequences.V000165",
    "category": "function",
    "text": "Return the double factorial of even numbers: 2^n n = (2n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000203",
    "page": "Sequences",
    "title": "Sequences.V000203",
    "category": "function",
    "text": "Return the sum of the divisors of n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000217",
    "page": "Sequences",
    "title": "Sequences.V000217",
    "category": "function",
    "text": "Return the polygonal numbers of shape 3 (the triangular numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000255",
    "page": "Sequences",
    "title": "Sequences.V000255",
    "category": "function",
    "text": "Return (n+1) Hypergeometric1F1-n -n-1 -1. Number of fixedpoint-free permutations beginning with 2. (L. Euler).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000257",
    "page": "Sequences",
    "title": "Sequences.G000257",
    "category": "function",
    "text": "The generating function of the number of rooted bicubic maps.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000257",
    "page": "Sequences",
    "title": "Sequences.L000257",
    "category": "function",
    "text": "Return a list of the number of rooted bicubic maps.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000262",
    "page": "Sequences",
    "title": "Sequences.V000262",
    "category": "function",
    "text": "Return n Hypergeometric1F11-n 2 -1. Number of partitions of 1n into any number of ordered subsets.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000290",
    "page": "Sequences",
    "title": "Sequences.V000290",
    "category": "function",
    "text": "Return the polygonal numbers of shape 4 (the squares).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000292",
    "page": "Sequences",
    "title": "Sequences.V000292",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 3 (tetrahedral numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000326",
    "page": "Sequences",
    "title": "Sequences.V000326",
    "category": "function",
    "text": "Return the polygonal numbers of shape 5 (the pentagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000330",
    "page": "Sequences",
    "title": "Sequences.V000330",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 4 (square pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T000369",
    "page": "Sequences",
    "title": "Sequences.T000369",
    "category": "function",
    "text": "Return the Bell transform of the MultiFactorial numbers of type (4,3).\n\njulia> ShowAsΔ(T000369(5))\n1\n0 1\n0 3 1\n0 21 9 1\n0 231 111 18 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000384",
    "page": "Sequences",
    "title": "Sequences.V000384",
    "category": "function",
    "text": "Return the polygonal numbers of shape 6 (the hexagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000407",
    "page": "Sequences",
    "title": "Sequences.V000407",
    "category": "function",
    "text": "Return the central rising factorial (n+1)  (n+1) = (2n+1)  n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000566",
    "page": "Sequences",
    "title": "Sequences.V000566",
    "category": "function",
    "text": "Return the polygonal numbers of shape 7 (the heptagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V000567",
    "page": "Sequences",
    "title": "Sequences.V000567",
    "category": "function",
    "text": "Return the polygonal numbers of shape 8 (the octagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000594",
    "page": "Sequences",
    "title": "Sequences.L000594",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^24.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000698",
    "page": "Sequences",
    "title": "Sequences.L000698",
    "category": "function",
    "text": "Return the number of indecomposable perfect matchings on 2n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000712",
    "page": "Sequences",
    "title": "Sequences.L000712",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 2 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000716",
    "page": "Sequences",
    "title": "Sequences.L000716",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 3 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000720",
    "page": "Sequences",
    "title": "Sequences.L000720",
    "category": "function",
    "text": "Return the list of number of primes  n for n  0.\n\njulia> L000720(8)\n[0, 0, 1, 2, 2, 3, 3, 4]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000727",
    "page": "Sequences",
    "title": "Sequences.L000727",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^4.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000728",
    "page": "Sequences",
    "title": "Sequences.L000728",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^5.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000729",
    "page": "Sequences",
    "title": "Sequences.L000729",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^6.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000730",
    "page": "Sequences",
    "title": "Sequences.L000730",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^7.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000731",
    "page": "Sequences",
    "title": "Sequences.L000731",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^8.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000735",
    "page": "Sequences",
    "title": "Sequences.L000735",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^12.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000739",
    "page": "Sequences",
    "title": "Sequences.L000739",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^16.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G000957",
    "page": "Sequences",
    "title": "Sequences.G000957",
    "category": "function",
    "text": "The generating function of the Fine numbers (with a(0) = 1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000957",
    "page": "Sequences",
    "title": "Sequences.L000957",
    "category": "function",
    "text": "Return a list of Fine numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L000961",
    "page": "Sequences",
    "title": "Sequences.L000961",
    "category": "function",
    "text": "Return a list of powers of primes of length len. (Numbers of the form p^k where p is a prime and k  0.)\n\njulia> L000961(8)\n[1, 2, 3, 4, 5, 7, 8, 9]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G001003",
    "page": "Sequences",
    "title": "Sequences.G001003",
    "category": "function",
    "text": "The generating function of the little Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001003",
    "page": "Sequences",
    "title": "Sequences.L001003",
    "category": "function",
    "text": "Return a list of little Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G001006",
    "page": "Sequences",
    "title": "Sequences.G001006",
    "category": "function",
    "text": "The generating function of the Motzkin numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001006",
    "page": "Sequences",
    "title": "Sequences.L001006",
    "category": "function",
    "text": "Return a list of Motzkin numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G001045",
    "page": "Sequences",
    "title": "Sequences.G001045",
    "category": "function",
    "text": "The generating function of the Jacobsthal numbers (with a(0) = 1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001045",
    "page": "Sequences",
    "title": "Sequences.L001045",
    "category": "function",
    "text": "Return a list of Jacobsthal numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001106",
    "page": "Sequences",
    "title": "Sequences.V001106",
    "category": "function",
    "text": "Return the polygonal numbers of shape 9 (the nonagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001107",
    "page": "Sequences",
    "title": "Sequences.V001107",
    "category": "function",
    "text": "Return the polygonal numbers of shape 10 (decagonal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001147",
    "page": "Sequences",
    "title": "Sequences.V001147",
    "category": "function",
    "text": "Return the double factorial of odd numbers, 135(2n-1) = (2n-1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001221",
    "page": "Sequences",
    "title": "Sequences.V001221",
    "category": "function",
    "text": "Return the number of distinct prime divisors of n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001222",
    "page": "Sequences",
    "title": "Sequences.V001222",
    "category": "function",
    "text": "Return the number of prime divisors of n counted with multiplicity.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001339",
    "page": "Sequences",
    "title": "Sequences.V001339",
    "category": "function",
    "text": "Return (n+1) Hypergeometric1F1-n -n-1 1. Number of arrangements of 1 2  n+1 containing the element 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001464",
    "page": "Sequences",
    "title": "Sequences.L001464",
    "category": "function",
    "text": "Return the sequence defined by a(n) = n x^n exp(-x-(x^2)2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001477",
    "page": "Sequences",
    "title": "Sequences.V001477",
    "category": "function",
    "text": "Return the polygonal numbers of shape 2 (these are the natural numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T001497",
    "page": "Sequences",
    "title": "Sequences.T001497",
    "category": "function",
    "text": "Return a triangle of coefficients of Bessel polynomials (better use A132062).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001710",
    "page": "Sequences",
    "title": "Sequences.L001710",
    "category": "function",
    "text": "Return the order of alternating group A_n, or number of even permutations of n letters.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001813",
    "page": "Sequences",
    "title": "Sequences.V001813",
    "category": "function",
    "text": "Return the quadruple factorial numbers with shift 2, (2n)n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V001855",
    "page": "Sequences",
    "title": "Sequences.V001855",
    "category": "function",
    "text": "Maximal number of comparisons for sorting n elements by binary insertion.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L001934",
    "page": "Sequences",
    "title": "Sequences.L001934",
    "category": "function",
    "text": "Return the expansion of 1ϑ_4(q)^2 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F002093",
    "page": "Sequences",
    "title": "Sequences.F002093",
    "category": "function",
    "text": "Iterate over the highly abundant numbers which do not exceed n (1  i  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I002093",
    "page": "Sequences",
    "title": "Sequences.I002093",
    "category": "function",
    "text": "Iterate over the first n highly abundant numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002093",
    "page": "Sequences",
    "title": "Sequences.L002093",
    "category": "function",
    "text": "Return the first n highly abundant numbers as an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002093",
    "page": "Sequences",
    "title": "Sequences.V002093",
    "category": "function",
    "text": "Return the n-th highly abundant number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002107",
    "page": "Sequences",
    "title": "Sequences.L002107",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002110",
    "page": "Sequences",
    "title": "Sequences.V002110",
    "category": "function",
    "text": "Return the product of first n primes.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002411",
    "page": "Sequences",
    "title": "Sequences.V002411",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 5 (pentagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002412",
    "page": "Sequences",
    "title": "Sequences.V002412",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 6 (hexagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002413",
    "page": "Sequences",
    "title": "Sequences.V002413",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 7 (heptagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002414",
    "page": "Sequences",
    "title": "Sequences.V002414",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 8 (octagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G002426",
    "page": "Sequences",
    "title": "Sequences.G002426",
    "category": "function",
    "text": "The generating function of the central trinomial.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002426",
    "page": "Sequences",
    "title": "Sequences.L002426",
    "category": "function",
    "text": "Return a list of the central trinomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002445",
    "page": "Sequences",
    "title": "Sequences.L002445",
    "category": "function",
    "text": "Return the list of length len of Clausen numbers which are the denominators of the Bernoulli numbers B_2n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V002445",
    "page": "Sequences",
    "title": "Sequences.V002445",
    "category": "function",
    "text": "Return the Clausen number C(n) which is the denominator of the Bernoulli number B_2n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002448",
    "page": "Sequences",
    "title": "Sequences.L002448",
    "category": "function",
    "text": "Return the expansion of Jacobi theta function ϑ(-q).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002476",
    "page": "Sequences",
    "title": "Sequences.L002476",
    "category": "function",
    "text": "Return primes of the form 6m + 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002808",
    "page": "Sequences",
    "title": "Sequences.L002808",
    "category": "function",
    "text": "Return a list of composite numbers of length len. (Numbers which have more than one prime divisor.)\n\njulia> L002808(8)\n[4, 6, 8, 9, 10, 12, 14, 15]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002858",
    "page": "Sequences",
    "title": "Sequences.L002858",
    "category": "function",
    "text": "Return a list of Ulam numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F002997",
    "page": "Sequences",
    "title": "Sequences.F002997",
    "category": "function",
    "text": "Iterate over the Carmichael/Šimerka numbers which do not exceed n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I002997",
    "page": "Sequences",
    "title": "Sequences.I002997",
    "category": "function",
    "text": "Iterate over the first n Carmichael/Šimerka numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L002997",
    "page": "Sequences",
    "title": "Sequences.L002997",
    "category": "function",
    "text": "Return the first n Carmichael/Šimerka numbers in an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I003277",
    "page": "Sequences",
    "title": "Sequences.I003277",
    "category": "function",
    "text": "Iterate over the first n cyclic numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L003277",
    "page": "Sequences",
    "title": "Sequences.L003277",
    "category": "function",
    "text": "Return the first n cyclic numbers in an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V003314",
    "page": "Sequences",
    "title": "Sequences.V003314",
    "category": "function",
    "text": "Binary entropy function: a(n) = n + min ( a(k) + a(n-k)  1  k  n-1 ) for n  1 and a(1) = 0.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L003319",
    "page": "Sequences",
    "title": "Sequences.L003319",
    "category": "function",
    "text": "Return the number of connected permutations of 1n. Also called indecomposable permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L003723",
    "page": "Sequences",
    "title": "Sequences.L003723",
    "category": "function",
    "text": "Return the sequence defined by A(n) = n x^n exp tan(x) as an array of length len.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004018",
    "page": "Sequences",
    "title": "Sequences.L004018",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 2 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004402",
    "page": "Sequences",
    "title": "Sequences.L004402",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q) in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004403",
    "page": "Sequences",
    "title": "Sequences.L004403",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^2 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004404",
    "page": "Sequences",
    "title": "Sequences.L004404",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^3 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004405",
    "page": "Sequences",
    "title": "Sequences.L004405",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^4 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004406",
    "page": "Sequences",
    "title": "Sequences.L004406",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^5 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004407",
    "page": "Sequences",
    "title": "Sequences.L004407",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^6 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004408",
    "page": "Sequences",
    "title": "Sequences.L004408",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^7 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004409",
    "page": "Sequences",
    "title": "Sequences.L004409",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^8 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004410",
    "page": "Sequences",
    "title": "Sequences.L004410",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^9 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004411",
    "page": "Sequences",
    "title": "Sequences.L004411",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^10 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004412",
    "page": "Sequences",
    "title": "Sequences.L004412",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^11 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004413",
    "page": "Sequences",
    "title": "Sequences.L004413",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^12 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004414",
    "page": "Sequences",
    "title": "Sequences.L004414",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^13 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004415",
    "page": "Sequences",
    "title": "Sequences.L004415",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^14 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004416",
    "page": "Sequences",
    "title": "Sequences.L004416",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^15 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004417",
    "page": "Sequences",
    "title": "Sequences.L004417",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^16 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004418",
    "page": "Sequences",
    "title": "Sequences.L004418",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^17 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004419",
    "page": "Sequences",
    "title": "Sequences.L004419",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^18 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004420",
    "page": "Sequences",
    "title": "Sequences.L004420",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^19 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004421",
    "page": "Sequences",
    "title": "Sequences.L004421",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^20 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004422",
    "page": "Sequences",
    "title": "Sequences.L004422",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^21 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004423",
    "page": "Sequences",
    "title": "Sequences.L004423",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^22 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004424",
    "page": "Sequences",
    "title": "Sequences.L004424",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^23 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L004425",
    "page": "Sequences",
    "title": "Sequences.L004425",
    "category": "function",
    "text": "Return the expansion of 1ϑ_3(q)^24 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T004747",
    "page": "Sequences",
    "title": "Sequences.T004747",
    "category": "function",
    "text": "Return the Bell transform of the MultiFactorial numbers of type (3,2).\n\njulia> ShowAsΔ(T004747(5))\n1\n0 1\n0 2 1\n0 10 6 1\n0 80 52 12 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G005043",
    "page": "Sequences",
    "title": "Sequences.G005043",
    "category": "function",
    "text": "The generating function of the Riordan numbers with 1 prepended.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005043",
    "page": "Sequences",
    "title": "Sequences.L005043",
    "category": "function",
    "text": "Return a list of the Riordan numbers (1 prepended).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F005101",
    "page": "Sequences",
    "title": "Sequences.F005101",
    "category": "function",
    "text": "Iterate over the abundant numbers which do not exceed n (1  i  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I005101",
    "page": "Sequences",
    "title": "Sequences.I005101",
    "category": "function",
    "text": "Iterate over the first n abundant numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005101",
    "page": "Sequences",
    "title": "Sequences.L005101",
    "category": "function",
    "text": "Return a list of the  first n abundant numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V005101",
    "page": "Sequences",
    "title": "Sequences.V005101",
    "category": "function",
    "text": "Return the value of the n-th abundant number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.is005101",
    "page": "Sequences",
    "title": "Sequences.is005101",
    "category": "function",
    "text": "Is n a term of sequence A005101?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005117",
    "page": "Sequences",
    "title": "Sequences.L005117",
    "category": "function",
    "text": "Return a list of squarefree numbers of length len. (Numbers which are not divisible by a square greater than 1.)\n\njulia> L005117(8)\n[1, 2, 3, 5, 6, 7, 10, 11]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005411",
    "page": "Sequences",
    "title": "Sequences.L005411",
    "category": "function",
    "text": "Return the number of non-vanishing Feynman diagrams of order 2n for the electron or the photon propagators in quantum electrodynamics.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005412",
    "page": "Sequences",
    "title": "Sequences.L005412",
    "category": "function",
    "text": "Return the number of non-vanishing Feynman diagrams of order 2n for the vacuum polarization in quantum electrodynamics.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005425",
    "page": "Sequences",
    "title": "Sequences.L005425",
    "category": "function",
    "text": "Return the number of self-inverse partial permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V005564",
    "page": "Sequences",
    "title": "Sequences.V005564",
    "category": "function",
    "text": "Return the pyramidal numbers of shape -1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005758",
    "page": "Sequences",
    "title": "Sequences.L005758",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 12 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005773",
    "page": "Sequences",
    "title": "Sequences.L005773",
    "category": "function",
    "text": "Return the number of directed animals of size n as an array of length len.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L005875",
    "page": "Sequences",
    "title": "Sequences.L005875",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 3 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L006012",
    "page": "Sequences",
    "title": "Sequences.L006012",
    "category": "function",
    "text": "Counting some sets of permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L006229",
    "page": "Sequences",
    "title": "Sequences.L006229",
    "category": "function",
    "text": "Return the expansion of exp(tan(x)).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G006318",
    "page": "Sequences",
    "title": "Sequences.G006318",
    "category": "function",
    "text": "The generating function of the large Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L006318",
    "page": "Sequences",
    "title": "Sequences.L006318",
    "category": "function",
    "text": "Return the large Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L006922",
    "page": "Sequences",
    "title": "Sequences.L006922",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 24 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V007060",
    "page": "Sequences",
    "title": "Sequences.V007060",
    "category": "function",
    "text": "Return (2n) Hypergeometric1F1-n -2n -2. Number of ways n couples can sit in a row without any spouses next to each other.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T007318",
    "page": "Sequences",
    "title": "Sequences.T007318",
    "category": "function",
    "text": "Pascal\'s triangle.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L007522",
    "page": "Sequences",
    "title": "Sequences.L007522",
    "category": "function",
    "text": "Return primes of the form 8n+7, that is, primes congruent to -1 mod 8.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V007559",
    "page": "Sequences",
    "title": "Sequences.V007559",
    "category": "function",
    "text": "Return the triple factorial numbers with shift 1, 3^n n = (3n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V007584",
    "page": "Sequences",
    "title": "Sequences.V007584",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 9 (enneagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V007585",
    "page": "Sequences",
    "title": "Sequences.V007585",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 10 (decagonal pyramidal numbers).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V007696",
    "page": "Sequences",
    "title": "Sequences.V007696",
    "category": "function",
    "text": "Return the quadruple factorial numbers with shift 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.A007917",
    "page": "Sequences",
    "title": "Sequences.A007917",
    "category": "function",
    "text": "Return the largest prime in N (the semiring of natural numbers including zero) less than n for n  0. (The prev_prime function of Mathematica, Maple, Magma and SageMath.)\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I008279",
    "page": "Sequences",
    "title": "Sequences.I008279",
    "category": "function",
    "text": "Iterates over the first n rows of A008279.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L008279",
    "page": "Sequences",
    "title": "Sequences.L008279",
    "category": "function",
    "text": "Lists the first n rows of A008279 by concatenating.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M008279",
    "page": "Sequences",
    "title": "Sequences.M008279",
    "category": "function",
    "text": "Return the triangular array as a square matrix with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V008279",
    "page": "Sequences",
    "title": "Sequences.V008279",
    "category": "function",
    "text": "Return row n of A008279 based on the iteration I008279(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L008451",
    "page": "Sequences",
    "title": "Sequences.L008451",
    "category": "function",
    "text": "Return the nnumber of ways of writing a nonnegative integer n as a sum of 7 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L008452",
    "page": "Sequences",
    "title": "Sequences.L008452",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 9 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L008453",
    "page": "Sequences",
    "title": "Sequences.L008453",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 11 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V008544",
    "page": "Sequences",
    "title": "Sequences.V008544",
    "category": "function",
    "text": "Return the triple factorial numbers with shift 2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V008545",
    "page": "Sequences",
    "title": "Sequences.V008545",
    "category": "function",
    "text": "Return the quadruple factorial numbers with shift 3.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V008683",
    "page": "Sequences",
    "title": "Sequences.V008683",
    "category": "function",
    "text": "Return the value of the Möbius function μ(n) which is the sum of the primitive n-th roots of unity.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L008784",
    "page": "Sequences",
    "title": "Sequences.L008784",
    "category": "function",
    "text": "Return numbers n that are primitively represented by x^2 + y^2. Also numbers n such that (-1) mod n exists.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010815",
    "page": "Sequences",
    "title": "Sequences.L010815",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010816",
    "page": "Sequences",
    "title": "Sequences.L010816",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^3.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010817",
    "page": "Sequences",
    "title": "Sequences.L010817",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^9.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010819",
    "page": "Sequences",
    "title": "Sequences.L010819",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^11.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010820",
    "page": "Sequences",
    "title": "Sequences.L010820",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^13.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010821",
    "page": "Sequences",
    "title": "Sequences.L010821",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^14.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010822",
    "page": "Sequences",
    "title": "Sequences.L010822",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^15.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010823",
    "page": "Sequences",
    "title": "Sequences.L010823",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^17.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010824",
    "page": "Sequences",
    "title": "Sequences.L010824",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^18.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010825",
    "page": "Sequences",
    "title": "Sequences.L010825",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^19.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010826",
    "page": "Sequences",
    "title": "Sequences.L010826",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^20.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010827",
    "page": "Sequences",
    "title": "Sequences.L010827",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^21.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010828",
    "page": "Sequences",
    "title": "Sequences.L010828",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^22.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010829",
    "page": "Sequences",
    "title": "Sequences.L010829",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^23.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010830",
    "page": "Sequences",
    "title": "Sequences.L010830",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^25.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010831",
    "page": "Sequences",
    "title": "Sequences.L010831",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^26.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010832",
    "page": "Sequences",
    "title": "Sequences.L010832",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^27.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010833",
    "page": "Sequences",
    "title": "Sequences.L010833",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^28.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010834",
    "page": "Sequences",
    "title": "Sequences.L010834",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^29.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010835",
    "page": "Sequences",
    "title": "Sequences.L010835",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^30.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010836",
    "page": "Sequences",
    "title": "Sequences.L010836",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^31.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010837",
    "page": "Sequences",
    "title": "Sequences.L010837",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^32.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010838",
    "page": "Sequences",
    "title": "Sequences.L010838",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^44.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010839",
    "page": "Sequences",
    "title": "Sequences.L010839",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^48.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010840",
    "page": "Sequences",
    "title": "Sequences.L010840",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^40.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L010841",
    "page": "Sequences",
    "title": "Sequences.L010841",
    "category": "function",
    "text": "Compute the expansion of _m1 (1 - q^m)^64.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T011117",
    "page": "Sequences",
    "title": "Sequences.T011117",
    "category": "function",
    "text": "Return the number of lattice paths from (00) to (xy) that never pass below y = x and use step set (01) (10) (20) (30) .\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L013928",
    "page": "Sequences",
    "title": "Sequences.L013928",
    "category": "function",
    "text": "Return a list of the number of squarefree numbers  n.\n\njulia> L013928(8)\n[0, 1, 2, 3, 3, 4, 5, 6]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V014107",
    "page": "Sequences",
    "title": "Sequences.V014107",
    "category": "function",
    "text": "Return the polygonal numbers of shape -2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L015128",
    "page": "Sequences",
    "title": "Sequences.L015128",
    "category": "function",
    "text": "Return the expansion of 1ϑ_4(q) in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023003",
    "page": "Sequences",
    "title": "Sequences.L023003",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 4 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023004",
    "page": "Sequences",
    "title": "Sequences.L023004",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 5 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023005",
    "page": "Sequences",
    "title": "Sequences.L023005",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 6 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023006",
    "page": "Sequences",
    "title": "Sequences.L023006",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 7 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023007",
    "page": "Sequences",
    "title": "Sequences.L023007",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 8 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023008",
    "page": "Sequences",
    "title": "Sequences.L023008",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 9 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023009",
    "page": "Sequences",
    "title": "Sequences.L023009",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 10 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023010",
    "page": "Sequences",
    "title": "Sequences.L023010",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 11 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023011",
    "page": "Sequences",
    "title": "Sequences.L023011",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 13 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023012",
    "page": "Sequences",
    "title": "Sequences.L023012",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 14 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023013",
    "page": "Sequences",
    "title": "Sequences.L023013",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 15 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023014",
    "page": "Sequences",
    "title": "Sequences.L023014",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 16 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023015",
    "page": "Sequences",
    "title": "Sequences.L023015",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 17 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023016",
    "page": "Sequences",
    "title": "Sequences.L023016",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 18 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023017",
    "page": "Sequences",
    "title": "Sequences.L023017",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 19 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023018",
    "page": "Sequences",
    "title": "Sequences.L023018",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 20 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023019",
    "page": "Sequences",
    "title": "Sequences.L023019",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 21 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023020",
    "page": "Sequences",
    "title": "Sequences.L023020",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 22 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L023021",
    "page": "Sequences",
    "title": "Sequences.L023021",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 23 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L025528",
    "page": "Sequences",
    "title": "Sequences.L025528",
    "category": "function",
    "text": "Return a list of the number of prime powers  n with exponents k  1.\n\njulia> L025528(8)\n[0, 0, 1, 2, 3, 4, 4, 5]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V027641",
    "page": "Sequences",
    "title": "Sequences.V027641",
    "category": "function",
    "text": "Return the numerator of the Bernoulli number B_n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V027642",
    "page": "Sequences",
    "title": "Sequences.V027642",
    "category": "function",
    "text": "Return the denominator of Bernoulli number B_n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L031363",
    "page": "Sequences",
    "title": "Sequences.L031363",
    "category": "function",
    "text": "Return positive numbers of the form x^2+xy-y^2; or, of the form 5x^2-y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V032031",
    "page": "Sequences",
    "title": "Sequences.V032031",
    "category": "function",
    "text": "Return the triple factorial numbers with shift 3.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V033156",
    "page": "Sequences",
    "title": "Sequences.V033156",
    "category": "function",
    "text": "Recurrence a(n) = a(n-1) +  a(n-1)(n-1)  + 2 for m  2 and a(1) = 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L033200",
    "page": "Sequences",
    "title": "Sequences.L033200",
    "category": "function",
    "text": "Return odd primes of form x^2+2y^2. Primes congruent to 1 3 mod 8.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V033815",
    "page": "Sequences",
    "title": "Sequences.V033815",
    "category": "function",
    "text": "Return (2n) Hypergeometric1F1-n -2n -1. Number of acyclic orientations of the Turán graph T(2nn).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L034017",
    "page": "Sequences",
    "title": "Sequences.L034017",
    "category": "function",
    "text": "Return positive integers that are primitively represented by x^2 + xy + y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V034386",
    "page": "Sequences",
    "title": "Sequences.V034386",
    "category": "function",
    "text": "Return the primorial of n, the product of the primes  n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V034444",
    "page": "Sequences",
    "title": "Sequences.V034444",
    "category": "function",
    "text": "Return the number of unitary divisors of n, d such that d divides n and d  nd.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F034885",
    "page": "Sequences",
    "title": "Sequences.F034885",
    "category": "function",
    "text": "Iterate over the record values of sigma the indices of which do not exceed n (1  r  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I034885",
    "page": "Sequences",
    "title": "Sequences.I034885",
    "category": "function",
    "text": "Iterate over the first n record values of sigma.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L034885",
    "page": "Sequences",
    "title": "Sequences.L034885",
    "category": "function",
    "text": "Return the first n record values of sigma as an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V034885",
    "page": "Sequences",
    "title": "Sequences.V034885",
    "category": "function",
    "text": "Return the n-th record of sigma.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L035016",
    "page": "Sequences",
    "title": "Sequences.L035016",
    "category": "function",
    "text": "Return the expansion of ϑ_4(q)^8 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L035251",
    "page": "Sequences",
    "title": "Sequences.L035251",
    "category": "function",
    "text": "Return positive numbers of the form x^2 - 2y^2 with integers x y (discriminant is 8).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T037027",
    "page": "Sequences",
    "title": "Sequences.T037027",
    "category": "function",
    "text": "Return the skew Fibonacci-Pascal triangle with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L038872",
    "page": "Sequences",
    "title": "Sequences.L038872",
    "category": "function",
    "text": "Return primes congruent to 0 1 4 mod 5 (cf. also [A141158]).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L038873",
    "page": "Sequences",
    "title": "Sequences.L038873",
    "category": "function",
    "text": "Return primes p such that 2 is a square mod p; or, primes congruent to 1 2 7 mod 8.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T039599",
    "page": "Sequences",
    "title": "Sequences.T039599",
    "category": "function",
    "text": "The Riordan square of the Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T039683",
    "page": "Sequences",
    "title": "Sequences.T039683",
    "category": "function",
    "text": "Return the signed double Pochhammer triangle: expansion of x(x-2)(x-4)(x-2n+2).\n\njulia> ShowAsΔ(T039683(5))\n1\n0 1\n0 2 1\n0 8 6 1\n0 48 44 12 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L042965",
    "page": "Sequences",
    "title": "Sequences.L042965",
    "category": "function",
    "text": "Return positive integers not congruent to 2 mod 4; regular numbers modulo 4.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V047053",
    "page": "Sequences",
    "title": "Sequences.V047053",
    "category": "function",
    "text": "Return the quadruple factorial numbers 4^n n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L047891",
    "page": "Sequences",
    "title": "Sequences.L047891",
    "category": "function",
    "text": "Return the number of planar rooted trees with n nodes and tricolored end nodes.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I048993",
    "page": "Sequences",
    "title": "Sequences.I048993",
    "category": "function",
    "text": "Iterates over the first n rows of A048993.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L048993",
    "page": "Sequences",
    "title": "Sequences.L048993",
    "category": "function",
    "text": "Lists the first n rows of A048993 by concatenating.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M048993",
    "page": "Sequences",
    "title": "Sequences.M048993",
    "category": "function",
    "text": "Return the triangular array as a square matrix with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V048993",
    "page": "Sequences",
    "title": "Sequences.V048993",
    "category": "function",
    "text": "Return row n of A048993 based on the iteration I048993(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T049218",
    "page": "Sequences",
    "title": "Sequences.T049218",
    "category": "function",
    "text": "Return the arctangent numbers (expansion of arctan(x)^nn).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T049310",
    "page": "Sequences",
    "title": "Sequences.T049310",
    "category": "function",
    "text": "Return the coefficients of Chebyshev\'s U(n x2) polynomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I050384",
    "page": "Sequences",
    "title": "Sequences.I050384",
    "category": "function",
    "text": "Iterate over the first n strong cyclic numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L050384",
    "page": "Sequences",
    "title": "Sequences.L050384",
    "category": "function",
    "text": "Return the first n strong cyclic numbers in an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T051141",
    "page": "Sequences",
    "title": "Sequences.T051141",
    "category": "function",
    "text": "Return the triangle 3^n-mS1(n m) where S1 are the signed Stirling numbers of first kind.\n\njulia> ShowAsΔ(T051141(5))\n1\n0 1\n0 3 1\n0 18 9 1\n0 162 99 18 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T051142",
    "page": "Sequences",
    "title": "Sequences.T051142",
    "category": "function",
    "text": "Return the Bell transform of the MultiFactorial numbers of type (4,4).\n\njulia> ShowAsΔ(T051142(5))\n1\n0 1\n0 4 1\n0 32 12 1\n0 384 176 24 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T053117",
    "page": "Sequences",
    "title": "Sequences.T053117",
    "category": "function",
    "text": "Return the coefficients of the Chebyshev-U polynomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T053120",
    "page": "Sequences",
    "title": "Sequences.T053120",
    "category": "function",
    "text": "Return the coefficients of the Chebyshev-T polynomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T053121",
    "page": "Sequences",
    "title": "Sequences.T053121",
    "category": "function",
    "text": "Return the Catalan triangle (with 0\'s) read by rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V054248",
    "page": "Sequences",
    "title": "Sequences.V054248",
    "category": "function",
    "text": "Binary entropy: a(n) = n + min  a(k) + a(n-k)  1  k  n-1 \n\n\n\n\n\n"
},

{
    "location": "#Sequences.T055883",
    "page": "Sequences",
    "title": "Sequences.T055883",
    "category": "function",
    "text": "Return the exponential transform of Pascal\'s triangle.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L057126",
    "page": "Sequences",
    "title": "Sequences.L057126",
    "category": "function",
    "text": "Return mumbers n such that 2 is a square mod n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L057127",
    "page": "Sequences",
    "title": "Sequences.L057127",
    "category": "function",
    "text": "Return positive integers primitively represented by x^2 + 2y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V058373",
    "page": "Sequences",
    "title": "Sequences.V058373",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 0.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T059419",
    "page": "Sequences",
    "title": "Sequences.T059419",
    "category": "function",
    "text": "Return the triangle T(nk) of tangent numbers, coefficient of x^nn in the expansion of (tan x)^kk.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T060693",
    "page": "Sequences",
    "title": "Sequences.T060693",
    "category": "function",
    "text": "Return the number of Schroeder paths (i.e., consisting of steps U=(11) D=(1-1) H=(20) and never going below the x-axis) from (00) to (2n0), having k peaks.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V061142",
    "page": "Sequences",
    "title": "Sequences.V061142",
    "category": "function",
    "text": "Return the result of replacing each prime factor of n with 2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V061168",
    "page": "Sequences",
    "title": "Sequences.V061168",
    "category": "function",
    "text": "Partial sums of the sequence  log_2(n) .\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L062980",
    "page": "Sequences",
    "title": "Sequences.L062980",
    "category": "function",
    "text": "Return the number of rooted unlabeled connected triangular maps on a compact closed oriented surface with 2n faces.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T064189",
    "page": "Sequences",
    "title": "Sequences.T064189",
    "category": "function",
    "text": "Return the (reflected) Motzkin triangle.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L065515",
    "page": "Sequences",
    "title": "Sequences.L065515",
    "category": "function",
    "text": "Return the number of powers of primes  n. (Powers of primes are numbers of the form p^k where p is a prime and k  0.)\n\njulia> L065515(8)\n[0, 1, 2, 3, 4, 5, 5, 6]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L065619",
    "page": "Sequences",
    "title": "Sequences.L065619",
    "category": "function",
    "text": "Computes a list of length len of the integer Bernoulli numbers b_2(n) using Seidel\'s boustrophedon algorithm.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V065619",
    "page": "Sequences",
    "title": "Sequences.V065619",
    "category": "function",
    "text": "Return the number of down-up permutations w on n+1 such that w_2 = 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L065855",
    "page": "Sequences",
    "title": "Sequences.L065855",
    "category": "function",
    "text": "Return a list of the number of composite numbers  n.\n\njulia> L065855(8)\n[0, 0, 0, 0, 1, 1, 2, 2]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T066325",
    "page": "Sequences",
    "title": "Sequences.T066325",
    "category": "function",
    "text": "Return the coefficients of unitary Hermite polynomials He_n(x).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V067998",
    "page": "Sequences",
    "title": "Sequences.V067998",
    "category": "function",
    "text": "Return the polygonal numbers of shape 0.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L068228",
    "page": "Sequences",
    "title": "Sequences.L068228",
    "category": "function",
    "text": "Return primes congruent to 1 (mod 12).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.G068875",
    "page": "Sequences",
    "title": "Sequences.G068875",
    "category": "function",
    "text": "The generating function of twice the Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L068875",
    "page": "Sequences",
    "title": "Sequences.L068875",
    "category": "function",
    "text": "Return a list of twice the Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L069637",
    "page": "Sequences",
    "title": "Sequences.L069637",
    "category": "function",
    "text": "Return a list of the number of prime powers  n with exponents k  2.\n\njulia> L069637(8)\n[0, 0, 0, 0, 1, 1, 1, 1]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V080577",
    "page": "Sequences",
    "title": "Sequences.V080577",
    "category": "function",
    "text": "Generates the integer partitions of n in graded reverse lexicographic order, the canonical ordering of partitions.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V080956",
    "page": "Sequences",
    "title": "Sequences.V080956",
    "category": "function",
    "text": "Return the polygonal numbers of shape 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V081125",
    "page": "Sequences",
    "title": "Sequences.V081125",
    "category": "function",
    "text": "Return fracn n2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082298",
    "page": "Sequences",
    "title": "Sequences.L082298",
    "category": "function",
    "text": "Return the number of lattice paths from (00) to (n+1n+1) that consist of steps (i0) and (0j) with ij1 and stay strictly below the diagonal line y=x except at the endpoints.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082301",
    "page": "Sequences",
    "title": "Sequences.L082301",
    "category": "function",
    "text": "Return the number of Schröder paths of semilength n in which the (2,0)-steps come in 4 colors.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082302",
    "page": "Sequences",
    "title": "Sequences.L082302",
    "category": "function",
    "text": "Return the coefficients in the expansion of (1-5x-(25x^2-14x+1))(2x).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082556",
    "page": "Sequences",
    "title": "Sequences.L082556",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 30 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082557",
    "page": "Sequences",
    "title": "Sequences.L082557",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 32 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082558",
    "page": "Sequences",
    "title": "Sequences.L082558",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 48 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L082559",
    "page": "Sequences",
    "title": "Sequences.L082559",
    "category": "function",
    "text": "Return the number of partitions of n into parts of 64 kinds.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F083207",
    "page": "Sequences",
    "title": "Sequences.F083207",
    "category": "function",
    "text": "Iterate over the Zumkeller numbers z which are below n (1  z  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I083207",
    "page": "Sequences",
    "title": "Sequences.I083207",
    "category": "function",
    "text": "Iterate over the first n Zumkeller numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L083207",
    "page": "Sequences",
    "title": "Sequences.L083207",
    "category": "function",
    "text": "List the first n Zumkeller numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V083207",
    "page": "Sequences",
    "title": "Sequences.V083207",
    "category": "function",
    "text": "Return the n-th Zumkeller number.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.is083207",
    "page": "Sequences",
    "title": "Sequences.is083207",
    "category": "function",
    "text": "Is n a Zumkeller number?\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V083652",
    "page": "Sequences",
    "title": "Sequences.V083652",
    "category": "function",
    "text": "Return the sum of lengths of binary expansions of 0 through n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L084916",
    "page": "Sequences",
    "title": "Sequences.L084916",
    "category": "function",
    "text": "Return positive numbers of the form n = x^2-3y^2 of discriminant 12.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T084938",
    "page": "Sequences",
    "title": "Sequences.T084938",
    "category": "function",
    "text": "Return the number of permutations of 12n having k cycles such that the elements of each cycle of the permutation form an interval. (Ran Pan)\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T088969",
    "page": "Sequences",
    "title": "Sequences.T088969",
    "category": "function",
    "text": "Return a triangle related to the median Euler numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L089270",
    "page": "Sequences",
    "title": "Sequences.L089270",
    "category": "function",
    "text": "Return positive numbers represented by the integer binary quadratic form x^2+xy-y^2 with x and y relatively prime.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T090238",
    "page": "Sequences",
    "title": "Sequences.T090238",
    "category": "function",
    "text": "Return the number of lists of k unlabeled permutations whose total length is n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T090981",
    "page": "Sequences",
    "title": "Sequences.T090981",
    "category": "function",
    "text": "Return the number of Schroeder paths of length 2n and having k ascents.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I094587",
    "page": "Sequences",
    "title": "Sequences.I094587",
    "category": "function",
    "text": "Iterates over the first n rows of A094587.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L094587",
    "page": "Sequences",
    "title": "Sequences.L094587",
    "category": "function",
    "text": "Lists the first n rows of A094587 by concatenating.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M094587",
    "page": "Sequences",
    "title": "Sequences.M094587",
    "category": "function",
    "text": "Return the triangular array as a square matrix with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V094587",
    "page": "Sequences",
    "title": "Sequences.V094587",
    "category": "function",
    "text": "Return row n of A094587 based on the iteration I094587(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T094665",
    "page": "Sequences",
    "title": "Sequences.T094665",
    "category": "function",
    "text": "Return the number of increasing 0-2 trees (A002105) on 2n edges in which the minimal path from the root has length k.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V095794",
    "page": "Sequences",
    "title": "Sequences.V095794",
    "category": "function",
    "text": "Return the polygonal numbers of shape -1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L096727",
    "page": "Sequences",
    "title": "Sequences.L096727",
    "category": "function",
    "text": "Return the expansion of ϑ_4(q)^4 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V097383",
    "page": "Sequences",
    "title": "Sequences.V097383",
    "category": "function",
    "text": "Minimum total number of comparisons to find each of the values 1 through n using a binary search with 3-way comparisons.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I097805",
    "page": "Sequences",
    "title": "Sequences.I097805",
    "category": "function",
    "text": "Iterates over the first n rows of A097805.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L097805",
    "page": "Sequences",
    "title": "Sequences.L097805",
    "category": "function",
    "text": "Lists the first n rows of A097805 by concatinating. This is the format for submissions to the OEIS.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M097805",
    "page": "Sequences",
    "title": "Sequences.M097805",
    "category": "function",
    "text": "Return the triangular array as a square matrix.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V097805",
    "page": "Sequences",
    "title": "Sequences.V097805",
    "category": "function",
    "text": "Return row n of A097805 based on the iteration I097805(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V099022",
    "page": "Sequences",
    "title": "Sequences.V099022",
    "category": "function",
    "text": "Return (2n) Hypergeometric1F1-n -2n 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T099174",
    "page": "Sequences",
    "title": "Sequences.T099174",
    "category": "function",
    "text": "Return the coefficients of the modified Hermite polynomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T104556",
    "page": "Sequences",
    "title": "Sequences.T104556",
    "category": "function",
    "text": "Return the matrix inverse of coefficients of Bessel polynomials; essentially the same as coefficients of modified Hermite polynomials T096713.\n\njulia> ShowAsΔ(T104556(5))\n1\n0 1\n0 -1 1\n0 0 -3 1\n0 0 3 -6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T104562",
    "page": "Sequences",
    "title": "Sequences.T104562",
    "category": "function",
    "text": "Return the inverse of the Motzkin triangle (cf. A064189).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L104794",
    "page": "Sequences",
    "title": "Sequences.L104794",
    "category": "function",
    "text": "Return the expansion of ϑ_4(q)^2 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L105523",
    "page": "Sequences",
    "title": "Sequences.L105523",
    "category": "function",
    "text": "Return the coefficients in the expansion of (1+2x-(1+4x^2))(2x).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T106566",
    "page": "Sequences",
    "title": "Sequences.T106566",
    "category": "function",
    "text": "Return the the Catalan convolution triangle.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L107716",
    "page": "Sequences",
    "title": "Sequences.L107716",
    "category": "function",
    "text": "A transform the of triple factorial numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L108624",
    "page": "Sequences",
    "title": "Sequences.L108624",
    "category": "function",
    "text": "Return the sequence with generating function satisfying x = (A(x)+(A(x))^2)(1-A(x)-(A(x))^2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T111062",
    "page": "Sequences",
    "title": "Sequences.T111062",
    "category": "function",
    "text": "Return the triangle T(n k) = binomnk times involutions(n - k).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L111529",
    "page": "Sequences",
    "title": "Sequences.L111529",
    "category": "function",
    "text": "A convolutory inverse of the factorial sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L111530",
    "page": "Sequences",
    "title": "Sequences.L111530",
    "category": "function",
    "text": "A convolutory inverse of the factorial sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L111531",
    "page": "Sequences",
    "title": "Sequences.L111531",
    "category": "function",
    "text": "A convolutory inverse of the factorial sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L111532",
    "page": "Sequences",
    "title": "Sequences.L111532",
    "category": "function",
    "text": "A convolutory inverse of the factorial sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L111533",
    "page": "Sequences",
    "title": "Sequences.L111533",
    "category": "function",
    "text": "A convolutory inverse of the factorial sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T111593",
    "page": "Sequences",
    "title": "Sequences.T111593",
    "category": "function",
    "text": "Return the triangle of tanh numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T116392",
    "page": "Sequences",
    "title": "Sequences.T116392",
    "category": "function",
    "text": "The Riordan square of the central trinomial.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T119274",
    "page": "Sequences",
    "title": "Sequences.T119274",
    "category": "function",
    "text": "Return the triangle of coefficients of numerators in Pade approximation to e^x.\n\njulia> ShowAsΔ(T119274(5))\n1\n0 1\n0 2 1\n0 12 6 1\n0 120 60 12 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V123753",
    "page": "Sequences",
    "title": "Sequences.V123753",
    "category": "function",
    "text": "Partial sums of the sequence of length of the binary expansion of 2n+1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V124320",
    "page": "Sequences",
    "title": "Sequences.V124320",
    "category": "function",
    "text": "Return the restricted rising factorial which is zero for n  0 or k  n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T132062",
    "page": "Sequences",
    "title": "Sequences.T132062",
    "category": "function",
    "text": "Return the triangle of coefficients of Bessel polynomials, also the Sheffer triangle (1 1 - (1 - 2x)) (Cf. A001497).\n\njulia> ShowAsΔ(T132062(5))\n1\n0 1\n0 1 1\n0 3 3 1\n0 15 15 6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I132393",
    "page": "Sequences",
    "title": "Sequences.I132393",
    "category": "function",
    "text": "Iterates over the first n rows of A132393.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L132393",
    "page": "Sequences",
    "title": "Sequences.L132393",
    "category": "function",
    "text": "Lists the first n rows of A132393 by concatenating.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M132393",
    "page": "Sequences",
    "title": "Sequences.M132393",
    "category": "function",
    "text": "Return the triangular array as a square matrix with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V132393",
    "page": "Sequences",
    "title": "Sequences.V132393",
    "category": "function",
    "text": "Return row n of A132393 based on the iteration I132393(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T137286",
    "page": "Sequences",
    "title": "Sequences.T137286",
    "category": "function",
    "text": "Return the coefficients of a variant of the Hermite polynomials.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T137338",
    "page": "Sequences",
    "title": "Sequences.T137338",
    "category": "function",
    "text": "Return the coefficients of the Charlier polynomials with parameter a = 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T137452",
    "page": "Sequences",
    "title": "Sequences.T137452",
    "category": "function",
    "text": "Return the coefficients of the first n Abel polynomials.\n\njulia> ShowAsΔ(T137452(5))\n1\n0 1\n0 -2 1\n0 9 -6 1\n0 -64 48 -12 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T137513",
    "page": "Sequences",
    "title": "Sequences.T137513",
    "category": "function",
    "text": "Return the triangle of the coefficients of the Mittag-Leffler polynomials.\n\njulia> ShowAsΔ(T137513(5))\n1\n0 2\n0 0 4\n0 4 0 8\n0 0 32 0 16\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L141158",
    "page": "Sequences",
    "title": "Sequences.L141158",
    "category": "function",
    "text": "Return primes represented by the integer binary quadratic form x^2+xy-y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L146559",
    "page": "Sequences",
    "title": "Sequences.L146559",
    "category": "function",
    "text": "Return the expansion of (1-x)(1 - 2x + 2x^2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.A151800",
    "page": "Sequences",
    "title": "Sequences.A151800",
    "category": "function",
    "text": "Return least prime  n. The next_prime function of Mathematica, Maple, Magma and SageMath.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T159834",
    "page": "Sequences",
    "title": "Sequences.T159834",
    "category": "function",
    "text": "Return the coefficients of Hermite polynomials H(n (x-1)(2))((2))^n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L167872",
    "page": "Sequences",
    "title": "Sequences.L167872",
    "category": "function",
    "text": "Return half the number of Feynman diagrams of order 2(n+1), for the electron self-energy in quantum electrodynamics.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T172094",
    "page": "Sequences",
    "title": "Sequences.T172094",
    "category": "function",
    "text": "The Riordan square of the little Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V178963",
    "page": "Sequences",
    "title": "Sequences.V178963",
    "category": "function",
    "text": "Return the number of 3-alternating permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V178964",
    "page": "Sequences",
    "title": "Sequences.V178964",
    "category": "function",
    "text": "Return the number of 4-alternating permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V181830",
    "page": "Sequences",
    "title": "Sequences.V181830",
    "category": "function",
    "text": "Return the number of integers  n which are strong prime to n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V181936",
    "page": "Sequences",
    "title": "Sequences.V181936",
    "category": "function",
    "text": "Return the number of 5-alternating permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T184962",
    "page": "Sequences",
    "title": "Sequences.T184962",
    "category": "function",
    "text": "Return the Bell transform of the Fubini numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F193338",
    "page": "Sequences",
    "title": "Sequences.F193338",
    "category": "function",
    "text": "Iterate over the record values of the Gauß factorial which do not exceed n (1  i  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I193338",
    "page": "Sequences",
    "title": "Sequences.I193338",
    "category": "function",
    "text": "Iterate over the first n record values of the Gauß factorial (1  r).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L193338",
    "page": "Sequences",
    "title": "Sequences.L193338",
    "category": "function",
    "text": "Return the first n record values of the Gauß factorial as an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V193338",
    "page": "Sequences",
    "title": "Sequences.V193338",
    "category": "function",
    "text": "Return the (value of the) n-th record of the Gauß factorial.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.F193339",
    "page": "Sequences",
    "title": "Sequences.F193339",
    "category": "function",
    "text": "Iterate over indices of the record values of the Gauß factorial which do not exceed n (1  i  n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I193339",
    "page": "Sequences",
    "title": "Sequences.I193339",
    "category": "function",
    "text": "Iterate over the indices of the first n record values of the Gauß factorial.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L193339",
    "page": "Sequences",
    "title": "Sequences.L193339",
    "category": "function",
    "text": "Return the indices of the first n record values of the Gauß factorial as an array.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V193339",
    "page": "Sequences",
    "title": "Sequences.V193339",
    "category": "function",
    "text": "Return the index of the n-th record value of the Gauß factorial.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V195441",
    "page": "Sequences",
    "title": "Sequences.V195441",
    "category": "function",
    "text": "Return denominator(Bernoulli _n+1(x) - Bernoulli _n+1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T202327",
    "page": "Sequences",
    "title": "Sequences.T202327",
    "category": "function",
    "text": "Return the coefficients of x^n in the expansion of ((-1-x+(1+2x+5x^2))2)^k as a triangle with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T203412",
    "page": "Sequences",
    "title": "Sequences.T203412",
    "category": "function",
    "text": "Return the Bell transform of the MultiFactorial numbers of type (3,1).\n\njulia> ShowAsΔ(T203412(5))\n1\n0 1\n0 1 1\n0 4 3 1\n0 28 19 6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L213384",
    "page": "Sequences",
    "title": "Sequences.L213384",
    "category": "function",
    "text": "Return the expansion of ϑ_4(q)^3 in powers of q.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L214551",
    "page": "Sequences",
    "title": "Sequences.L214551",
    "category": "function",
    "text": "Return a list of the first n terms of the modified Narayanas cows sequence.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T216916",
    "page": "Sequences",
    "title": "Sequences.T216916",
    "category": "function",
    "text": "Return the coefficients of some orthogonal polynomials related to set partitions without singletons (cf. A000296).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T217537",
    "page": "Sequences",
    "title": "Sequences.T217537",
    "category": "function",
    "text": "Return the coefficients of some orthogonal polynomials related to indecomposable set partitions without singletons (cf. A098742).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L217924",
    "page": "Sequences",
    "title": "Sequences.L217924",
    "category": "function",
    "text": "Return the first len integers defined as a(n) = n x^n exp(2 exp (x) - x - 2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T225478",
    "page": "Sequences",
    "title": "Sequences.T225478",
    "category": "function",
    "text": "Return the triangle 4^k S_4(n k) where S_m(n k) are the Stirling-Frobenius cycle numbers of order m.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L242660",
    "page": "Sequences",
    "title": "Sequences.L242660",
    "category": "function",
    "text": "Return positive numbers of the form x^2+xy-2y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L243168",
    "page": "Sequences",
    "title": "Sequences.L243168",
    "category": "function",
    "text": "Return positive integers of the form x^2+6xy-3y^2.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L243655",
    "page": "Sequences",
    "title": "Sequences.L243655",
    "category": "function",
    "text": "Return positive numbers that are primitively represented by the indefinite quadratic form x^2 - 3y^2 of discriminant 12.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L244291",
    "page": "Sequences",
    "title": "Sequences.L244291",
    "category": "function",
    "text": "Return positive numbers primitively represented by the binary quadratic form (1, 6, -3).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L244779",
    "page": "Sequences",
    "title": "Sequences.L244779",
    "category": "function",
    "text": "Return positive numbers primitively represented by the binary quadratic form (1, 1, 2).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L244780",
    "page": "Sequences",
    "title": "Sequences.L244780",
    "category": "function",
    "text": "Return positive numbers primitively represented by the binary quadratic form (1, 1, 3).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L244819",
    "page": "Sequences",
    "title": "Sequences.L244819",
    "category": "function",
    "text": "Return positive numbers primitively represented by the binary quadratic form (1, 0, 3).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L246547",
    "page": "Sequences",
    "title": "Sequences.L246547",
    "category": "function",
    "text": "Return a list of perfect powers of length len. (Numbers of the form p^k where p is a prime and k  2.\n\njulia> L246547(8)\n[4, 8, 9, 16, 25, 27, 32, 49]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L246655",
    "page": "Sequences",
    "title": "Sequences.L246655",
    "category": "function",
    "text": "Return a list of prime powers of length len. (Numbers of the form p^k where p is a prime and k  1.)\n\njulia> L246655(8)\n[2, 3, 4, 5, 7, 8, 9, 11]\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V250283",
    "page": "Sequences",
    "title": "Sequences.V250283",
    "category": "function",
    "text": "Return the number of 6-alternating permutations.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V251568",
    "page": "Sequences",
    "title": "Sequences.V251568",
    "category": "function",
    "text": "Return ((2n)(n+1)) Hypergeometric1F11-n n+2 -1. Egf. exp (x C(x)^2) where C(x) = 1 + xC(x)^2 is the generating function of the Catalan numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V254749",
    "page": "Sequences",
    "title": "Sequences.V254749",
    "category": "function",
    "text": "Return the pyramidal numbers of shape 1.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.A257993",
    "page": "Sequences",
    "title": "Sequences.A257993",
    "category": "function",
    "text": "Return the index of the least prime not dividing n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T264428",
    "page": "Sequences",
    "title": "Sequences.T264428",
    "category": "function",
    "text": "Return the Bell transform of the Bell numbers.\n\njulia> ShowAsΔ(T264428(5))\n1\n0 1\n0 1 1\n0 2 3 1\n0 5 11 6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T265606",
    "page": "Sequences",
    "title": "Sequences.T265606",
    "category": "function",
    "text": "Return the Bell transform of the quartic factorial numbers.\n\njulia> ShowAsΔ(T265606(5))\n1\n0 1\n0 1 1\n0 5 3 1\n0 45 23 6 1\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V265609",
    "page": "Sequences",
    "title": "Sequences.V265609",
    "category": "function",
    "text": "Return the rising factorial i.e. the product of i in n(n + k - 1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.I271703",
    "page": "Sequences",
    "title": "Sequences.I271703",
    "category": "function",
    "text": "Iterates over the first n rows of A271703.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L271703",
    "page": "Sequences",
    "title": "Sequences.L271703",
    "category": "function",
    "text": "Lists the first n rows of A271703 by concatenating.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.M271703",
    "page": "Sequences",
    "title": "Sequences.M271703",
    "category": "function",
    "text": "Return the triangular array as a square matrix with dim rows.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V271703",
    "page": "Sequences",
    "title": "Sequences.V271703",
    "category": "function",
    "text": "Return row n of A271703 based on the iteration I271703(n).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L276285",
    "page": "Sequences",
    "title": "Sequences.L276285",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 13 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L276286",
    "page": "Sequences",
    "title": "Sequences.L276286",
    "category": "function",
    "text": "Return the number of ways of writing a nonnegative integer n as a sum of 14 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L276287",
    "page": "Sequences",
    "title": "Sequences.L276287",
    "category": "function",
    "text": "Return the nnumber of ways of writing a nonnegative integer n as a sum of 15 squares.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V281586",
    "page": "Sequences",
    "title": "Sequences.V281586",
    "category": "function",
    "text": "Return the generalized integer Bernoulli numbers b_3(n) = n timesAndré_3(n-1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V281588",
    "page": "Sequences",
    "title": "Sequences.V281588",
    "category": "function",
    "text": "Return the generalized integer Bernoulli numbers b_4(n) = n times André_4(n-1).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.V295513",
    "page": "Sequences",
    "title": "Sequences.V295513",
    "category": "function",
    "text": "Return n Bil(n) - 2^Bil(n) where Bil(n) is the binary integer length of n.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.L319284",
    "page": "Sequences",
    "title": "Sequences.L319284",
    "category": "function",
    "text": "Returns the profile of the backtrack tree for the n queens problem.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T321620",
    "page": "Sequences",
    "title": "Sequences.T321620",
    "category": "function",
    "text": "The Riordan square of the Riordan numbers (with 1 prepended).\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T321621",
    "page": "Sequences",
    "title": "Sequences.T321621",
    "category": "function",
    "text": "The Riordan square of the Motzkin numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T321623",
    "page": "Sequences",
    "title": "Sequences.T321623",
    "category": "function",
    "text": "The Riordan square of the large Schröder numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T321624",
    "page": "Sequences",
    "title": "Sequences.T321624",
    "category": "function",
    "text": "The Riordan square of the Lucas numbers.\n\n\n\n\n\n"
},

{
    "location": "#Sequences.T322942",
    "page": "Sequences",
    "title": "Sequences.T322942",
    "category": "function",
    "text": "The Riordan square of the Jacobsthal numbers.\n\n\n\n\n\n"
},

{
    "location": "#Library-1",
    "page": "Sequences",
    "title": "Library",
    "category": "section",
    "text": "AndréBellNumberBellNumberListBellTransBellTriangleBernoulliBernoulliIntBernoulliIntListBernoulliListBilBinaryIntegerLengthBinomialClausenNumberClausenNumberListCoefficientsCombinationsCountDedekindEtaPowersDeléhamΔDividesDivisorsF!FactorsFallingFactorialGammaHypHilbertHotelInvOrthoPolyJacobiTheta3PowersJacobiTheta4PowersKolakoskiListListMultiFactorialNarayanasCowsNemofmpzNextPrimeNthOrthoPolyPSfactorialPartitionPartitionNumberListPascalPolygonalNumberPreviousPrimePrimeDivisorsPrimeListPrimePiPrimePiListPrimeSievePrimesPrintlnProductPyramidalNumberQTriangleQueensRadicalRamanujanTauRamanujanTauListRecTriangleRecordsRiordanProductRiordanSquareRisingFactorialRowRowSumsSelfConvRecSeqNameSeqNumSeqPrintSeqShowSfactorialShowAsMatrixShowAsΔSwingTriangleTriangleToListTriangularNumberUlamListZArrayZTriangleassertTriangularfromΔisAbundantisCarmichaelisCompositeisCyclicisEvenisNonnegativeisOddisPerfectPowerisPositiveisPowerOfPrimesisPrimeisPrimePowerisPrimeToisSquareisSquareFreeisStrongCyclicisStrongPrimeToisTriangularisUlamisZumkellermodsoeis_isinstalledoeis_localoeis_notinstalledoeis_pathoeis_readbfileoeis_remoteoeis_searchoeis_trimdataoeis_writebfiletakefirsttoΔΩστωϕ↑↓∏⊥⍊C000002I000002L000002V000005V000010G000032L000032L000041F000045G000045I000045L000045R000045V000045is000045G000073L000073L000085G000108L000108L000110V000110C000111V000111L000118L000122L000132L000141V000142L000143L000144L000145V000165V000203V000217V000255G000257L000257V000262V000290V000292V000326V000330T000369V000384V000407V000566V000567L000594L000698L000712L000716L000720L000727L000728L000729L000730L000731L000735L000739G000957L000957L000961G001003L001003G001006L001006G001045L001045V001106V001107V001147V001221V001222V001339L001464V001477T001497L001710V001813V001855L001934F002093I002093L002093V002093L002107V002110V002411V002412V002413V002414G002426L002426L002445V002445L002448L002476L002808L002858F002997I002997L002997I003277L003277V003314L003319L003723L004018L004402L004403L004404L004405L004406L004407L004408L004409L004410L004411L004412L004413L004414L004415L004416L004417L004418L004419L004420L004421L004422L004423L004424L004425T004747G005043L005043F005101I005101L005101V005101is005101L005117L005411L005412L005425V005564L005758L005773L005875L006012L006229G006318L006318L006922V007060T007318L007522V007559V007584V007585V007696A007917I008279L008279M008279V008279L008451L008452L008453V008544V008545V008683L008784L010815L010816L010817L010819L010820L010821L010822L010823L010824L010825L010826L010827L010828L010829L010830L010831L010832L010833L010834L010835L010836L010837L010838L010839L010840L010841T011117L013928V014107L015128L023003L023004L023005L023006L023007L023008L023009L023010L023011L023012L023013L023014L023015L023016L023017L023018L023019L023020L023021L025528V027641V027642L031363V032031V033156L033200V033815L034017V034386V034444F034885I034885L034885V034885L035016L035251T037027L038872L038873T039599T039683L042965V047053L047891I048993L048993M048993V048993T049218T049310I050384L050384T051141T051142T053117T053120T053121V054248T055883L057126L057127V058373T059419T060693V061142V061168L062980T064189L065515L065619V065619L065855T066325V067998L068228G068875L068875L069637V080577V080956V081125L082298L082301L082302L082556L082557L082558L082559F083207I083207L083207V083207is083207V083652L084916T084938T088969L089270T090238T090981I094587L094587M094587V094587T094665V095794L096727V097383I097805L097805M097805V097805V099022T099174T104556T104562L104794L105523T106566L107716L108624T111062L111529L111530L111531L111532L111533T111593T116392T119274V123753V124320T132062I132393L132393M132393V132393T137286T137338T137452T137513L141158L146559A151800T159834L167872T172094V178963V178964V181830V181936T184962F193338I193338L193338V193338F193339I193339L193339V193339V195441T202327T203412L213384L214551T216916T217537L217924T225478L242660L243168L243655L244291L244779L244780L244819L246547L246655V250283V251568V254749A257993T264428T265606V265609I271703L271703M271703V271703L276285L276286L276287V281586V281588V295513L319284T321620T321621T321623T321624T322942"
},

{
    "location": "modules/#",
    "page": "Modules",
    "title": "Modules",
    "category": "page",
    "text": ""
},

{
    "location": "modules/#Modules-1",
    "page": "Modules",
    "title": "Modules",
    "category": "section",
    "text": "Abundant   🔶  AndreNumbers   🔶  BellNumbers   🔶  BernoulliNumbers   🔶  BinaryInteger   🔶  BinaryQF   🔶  CarmichaelNumbers   🔶  ClausenNumbers   🔶  CombinationsIterator   🔶  Compositions   🔶  Counts   🔶  DedekindEta   🔶  Deleham   🔶  Fibonacci   🔶  FigurativeNumbers   🔶  GaussFactorialRecords   🔶  GeneralizedBinomial   🔶  HighlyAbundant   🔶  Hyper1F1   🔶  JacobiTheta   🔶  Kolakoski   🔶  NarayanaCows   🔶  NumberTheory   🔶  OEISUtils   🔶  OrthoPolynomials   🔶  Partitions   🔶  PrimesIterator   🔶  PrimeSwingFactorial   🔶  Products   🔶  QueensProblems   🔶  RecordSearch   🔶  RiordanSquares   🔶  SelfConvolutive   🔶  SeqUtils   🔶  SeriesExpansion   🔶  StirlingLahNumbers   🔶  SwingFactorial   🔶  Triangles   🔶  UlamNumbers   🔶  ZumkellerNumbers   🔶  "
},

{
    "location": "notebooks/#",
    "page": "Notebooks and demos",
    "title": "Notebooks and demos",
    "category": "page",
    "text": ""
},

{
    "location": "notebooks/#Notebooks-and-demos-1",
    "page": "Notebooks and demos",
    "title": "Notebooks and demos",
    "category": "section",
    "text": "A Jupyter notebook illustrating the use of Sequences.IntroductionAn implementation of the generalized queens problem illustrating distributed computing.DistributedQueensAn utility for writing b-files for the OEIS.bfile-writer"
},

{
    "location": "userguide/#",
    "page": "User guide",
    "title": "User guide",
    "category": "page",
    "text": ""
},

{
    "location": "userguide/#User-Guide-1",
    "page": "User guide",
    "title": "User Guide",
    "category": "section",
    "text": ""
},

{
    "location": "userguide/#Naming-conventions-1",
    "page": "User guide",
    "title": "Naming conventions",
    "category": "section",
    "text": "The function names follow the registration numbers of the OEIS. We use the following prefixes to indicate the type of the function.Prefix Function Type\nC Coroutine (channel)\nF Filter (not exceeding n)\nG Generating function\nI Iteration (over n terms)\nL List (array based)\nM Matrix (2-dim square)\nR Real function (Float64)\nS Staircase (list iteration)\nT Triangle (list iteration)\nTA Triangle (triangular array)\nTL Triangle (flat-list array)\nV Value (single term)\nis is a member (predicate query)These conventions can be seen as an application programming interface which we explain by three examples."
},

{
    "location": "userguide/#Example-1:-Fibonacci-numbers-1",
    "page": "User guide",
    "title": "Example 1: Fibonacci numbers",
    "category": "section",
    "text": "For the Fibonacci numbers we offer 7 functions:I000045, F000045, G000045, L000045, V000045, R000045, is000045.Four of those are based on the iteration protocol FiboIterate which is kept intern. The implementations are:Iterate over the first n Fibonacci numbers.I000045(n) = FiboIterate(n)Iterate over the Fibonacci numbers which do not exceed n.F000045(n) = takewhile(k -> k <= n, FiboIterate(n+1))Return the first n Fibonacci numbers in an array.L000045(n) = collect(FiboIterate(n))Alternatively one can use a generating function if available:L000045(n) = coefficients(G000045, n)Return the n-th Fibonacci number.function V000045(n)\n   F = ZZ[1 1; 1 0]\n   Fn = F^n\n   Fn[2, 1]\nendFibonacci function for real values, returns a Float64.function R000045(x::Float64)\n    (Base.MathConstants.golden^x - cos(x Base.MathConstants.pi)\n        Base.MathConstants.golden^(-x)) / sqrt(5)\nendQuery if n is a Fibonacci number, returns a Bool.function is000045(n)\n    d = 0\n    for f in FiboIterate(n+2)\n        d = n - f\n        d <= 0 && break\n    end\n    d == 0\nend"
},

{
    "location": "userguide/#Example-2:-Abundant-numbers-1",
    "page": "User guide",
    "title": "Example 2: Abundant numbers",
    "category": "section",
    "text": "For the abundant numbers (i.e. numbers n where the sum of divisors exceeds 2n) we offer 5 functions:is005101, I005101, F005101, L005101, V005101Is n an abundant number, i.e. is σ(n)  2 n ?is005101(n) = σ(n) > 2 nIterate over the first n abundant numbers.I005101(n) = takefirst(isAbundant, n)Iterate over the abundant numbers which do not exceed n.F005101(n) = filter(isAbundant, 1:n)Return the first n abundant numbers in an array.L005101(n) = collect(I005101(n))Return the value of the n-th abundant number.V005101(n) = nth(I005101(n), n)"
},

{
    "location": "userguide/#Number-triangles-1",
    "page": "User guide",
    "title": "Number triangles",
    "category": "section",
    "text": ""
},

{
    "location": "userguide/#Definition-1",
    "page": "User guide",
    "title": "Definition",
    "category": "section",
    "text": "To construct a number triangle one has to provide a function t(n, k) defined for all integers n and k with n >= 0 and 0 <= k <= n. Note that this corresponds to an infinite lower triangular matrix which is (0, 0)-based. This deviates from the usual indexing of Julia matrices which are (1, 1)-based, but the mother of all number triangles is Pascal\'s triangle which is (0, 0)-based and in our application it is more convenient to follow the lead of Blaise than that of Julia.The matrix view of a number triangle of dimension dim has dim rows and the n-th row has length n. Note that the rows are enumerated like the terms 0, 1, 2, ...    T(0,0)                          row 0\n    T(1,0) T(1,1)                   row 1\n    T(2,0) T(2,1) T(2,2)            row 2\n    T(3,0) T(3,1) T(3,2) T(3,3)     row 3However, our model is not that of a matrix, rather that of an iteration, actually an iteration over lists. In this abstract view a triangle T is a chain of lists. On the first level a triangle iterates over the rows of the triangle and on the secondary level over the terms of the rows, which are given by the user-supplied function t(n, k).    T = (row(0), row(1), ..., row(dim-1))\n    Row(T, n) = [t(n, 0), t(n, 1), ..., t(n, n)]"
},

{
    "location": "userguide/#Constructing-1",
    "page": "User guide",
    "title": "Constructing",
    "category": "section",
    "text": "Sequence A097805 gives the number of ordered partitions of n into k parts. The corresponding triangle can be constructed like this:Triangle T097805 based of explicite value.V097805(n, k) = k == 0 ? k^n : binomial(n-1, k-1)\nT097805(dim) = Triangle(dim, V097805)Many number triangles can be efficiently implemented by recurrence. To support this the type RecTriangle has a buffer which saves the previously computed row. This buffer can be accessed through a function \'prevrow\'.  Triangle T097805 based on recurrence.R097805(n, k, prevrow) = k == 0 ? k^n : prevrow(k-1) + prevrow(k)\nT097805(dim) = RecTriangle(dim, R097805)This function is much more efficient than the version above. Note that you do not have to provide the function prevrow as long as you use the function R097805 in the definition of a triangle. The name \'prevrow\' is not fixed but recommended as a convention. A nice alternative for \'prevrow\' is \'Tn1\' because Tn1(k) = T(n-1, k) in matrix notation."
},

{
    "location": "userguide/#Triangle-tools-1",
    "page": "User guide",
    "title": "Triangle tools",
    "category": "section",
    "text": "The following functions are supplied:Return the row n (0 <= n < dim) of a triangle.Row(T::Triangle, n::Int, rev=true) = rev ? reversed(T(n)) : T(n)If in the call the third – optional – parameter rev is true the row is returned in reversed order.Return the triangle as a list of rows.TriangularArray(T::Triangle) = [row for row in T]Return the triangle as a list of integers.TriangleToList(T::Triangle) = [k for row in T for k in row]Thus applying TriangleToList to a triangle of dimension dim returns a list of integers of length dim(dim + 1)/2. Conversely, given an integer list of length n(n + 1)/2 the function ListToTriangle returns a triangle as a chain of iterators.ListToTriangle(A::Array{})"
},

{
    "location": "userguide/#Notebook-1",
    "page": "User guide",
    "title": "Notebook",
    "category": "section",
    "text": "More examples can be found in this Jupyter notebook."
},

{
    "location": "userguide/#Contribute!-1",
    "page": "User guide",
    "title": "Contribute!",
    "category": "section",
    "text": "Sequences are fun!  Start with cloning the module NarayanaCowsas a blueprint. Replace what is to be replaced.Execute the module \'BuildSequences\' which will integrate your module into \'Sequences\'.\nSend us a pull request.We want to include only sequences which are of mathematical interest. Please make sure that they are already documented in the Online Encyclopedia of Integer Sequences, otherwise please submit them first to the OEIS.We prefer parametrized sequences (family of sequences) over single ones and triangles (family of polynomials) over straight sequences. Implementations of sequence-to-sequence transformations are always welcome."
},

{
    "location": "developerguide/#",
    "page": "Developer guide",
    "title": "Developer guide",
    "category": "page",
    "text": ""
},

{
    "location": "developerguide/#Developer-Guide-1",
    "page": "Developer guide",
    "title": "Developer Guide",
    "category": "section",
    "text": ""
},

{
    "location": "developerguide/#Workflow-1",
    "page": "Developer guide",
    "title": "Workflow",
    "category": "section",
    "text": "The workflow is characterized by the decision to keep functions and the corresponding test functions in the same file. This enables easier and faster development in separate modules and is also suggested by the relative independence of many individual modules implementing different sequences.The modules are combined to a package in a separate step. The prerequisite for this is an internal file format whose (simple) conventions must be adhered to."
},

{
    "location": "developerguide/#Module-format-1",
    "page": "Developer guide",
    "title": "Module format",
    "category": "section",
    "text": "    # This file is part of Sequences.\n    # Copyright Name. License is MIT.\n\n    (@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))\n\n    module ModuleName\n    using  ...\n    export f\n\n    function f()\n    end\n\n    #START-TEST-###########################\n\n    using Test\n\n    function test()\n    end\n\n    function demo()\n    end\n\n    function perf()\n    end\n\n    function main()\n        test()\n        demo()\n        perf()\n    end\n\n    main()\n\n    end # module"
},

{
    "location": "developerguide/#Package-build-1",
    "page": "Developer guide",
    "title": "Package build",
    "category": "section",
    "text": "The package is build by executing BuildSequences.jl. This will pars the individual module files and recombine and distribute their content into three new files:Sequences.jl\nruntests.jl\nperftests.jlThe functions in the module which come before the line starting with \"#START-TEST\" will be copied to Sequences.jl, the function test() will be copied to runtests.jl, and the function perf() will be copied to perftests.jl. Everything else will be discarded.In particular: Do not edit Sequences.jl, it is generated from the modules and will be overwritten! Instead edit the modules in the \'src\' directory. These modules can and should be tested standalone. Only construct Sequences.jl with BuildSequences.jl in a final step."
},

{
    "location": "developerguide/#Integer-type-and-unicode-use-1",
    "page": "Developer guide",
    "title": "Integer type and unicode use",
    "category": "section",
    "text": "All terms of all sequences have the same type. Currently this is the type fmpz as provided by the Nemo library.Sequences supports the use of notation using unicode characters, especially the traditional notation used in number theory. For example we define    τ(n) = Nemo.sigma(n, 0)\n    μ(n) = Nemo.moebiusmu(n)We also support new notations like the proposal from Knuth, Graham and Patashnik in Concrete Mathematics: \"Let us agree to write m  n, and to say m is prime to n, if m and n are relatively prime.\"    ⊥(m, n) = isPrimeTo(m, n)where isPrimeTo is defined as:    isPrimeTo(n, k) = Nemo.gcd(fmpz(n), fmpz(k)) == fmpz(1)For example (n ϕ(n)) indicates if there is just one group of order n. But this is not only a concise mathematical formula, this is also valid Julia code (defined in Sequences). The predicate gives rise to the sequence of cyclic numbers, A003277 in the OEIS.Similarly possible definitions of some sequences (not necessarily efficient ones in the computational sense) are    isA008578(n) = all(⊥(k, n)     for k in 1:n-1)\n    isA002182(n) = all(τ(k) < τ(n) for k in 1:n-1)\n    isA002110(n) = all(ω(k) < ω(n) for k in 1:n-1)\n    isA131577(n) = all(Ω(k) < Ω(n) for k in 1:n-1)Other examples for the use of unicode are products. (a b) is defined as the product of i in ab if a  b and otherwise 1. Building on this short notations for the rising and the falling factorial powers are supported:    ↑(n, k) = RisingFactorial(n, k)\n    RisingFactorial(n::Int, k::Int) = ∏(n, n + k - 1)\n    ↓(n, k) = FallingFactorial(n, k)\n    FallingFactorial(n::Int, k::Int) = ∏(n - k + 1, n)"
},

{
    "location": "developerguide/#Muliti-dimensional-sequences-1",
    "page": "Developer guide",
    "title": "Muliti-dimensional sequences",
    "category": "section",
    "text": ""
},

{
    "location": "developerguide/#The-concept-of-a-sequence-1",
    "page": "Developer guide",
    "title": "The concept of a sequence",
    "category": "section",
    "text": "Sequences as considered here are weakly ordered sets and in fact we consider only infinite ordered sets. Thus something likea ≺ b ≺ c ≺ d ≺ ...is an adequate picture of our concept. (Note that ≺ means \'precedes\', not \'is less\'.) The dynamic counterpart to this static view is the iteration, in which the individual terms of the sequence are successively returned in the given order by a generating function.a, b, c, d, ...In the OEIS, on the other hand, a sequence is an enumeration, a set with an index function where the first index (called offset o) is specified. With this we arrive at this picture:``a_o, b_{o+1}, c_{o+2}, d_{o+3}, ...``In this view a list (representing the initial segment of the sequence) takes the place of the iteration.``[ a_{o}, b_{o+1}, c_{o+2}, ..., z_{o+n-1} ]``In contrast in our setup the concept of offset and indexing does not occur at all but is transferred to the interpretation: only the application decides about indexing and offset. In practice our setup avoiding the use of an offset turns out to be more flexible.Another difference serves to be highlighted: In an iteration the length does not have to be determined beforehand, an iteration can be terminated at any time. In the case of a list, however, the length must be specified beforehand."
},

{
    "location": "developerguide/#dim-sequences-1",
    "page": "Developer guide",
    "title": "1-dim sequences",
    "category": "section",
    "text": "All this does not exclude that while describing a sequence informally it is often useful to assume an enumeration. If not explicitly stated otherwise we assume a sequence to be based in the origin 0 in the one dimensional case and in (0, 0) in the case of triangles; similar with higher order sequences.The main reason for these conventions is the representation of sequences by formal power series, i.e.``g(x) = a_{0}x^0 + a_{1}x^1 + a_{2}x^2 + ...``The function coefficients(g) maps the series to the sequence``a_{0}, a_{1}, a_{2}, ...``."
},

{
    "location": "developerguide/#dim-sequences-2",
    "page": "Developer guide",
    "title": "2-dim sequences",
    "category": "section",
    "text": "2-dimensional arrays come in two flavors: as parametrized sequences (family of sequences) and as triangles (family of polynomials). In this view the setup is according to our conventions:"
},

{
    "location": "developerguide/#T-enumerated-as-a-triangle-(or-coefficients-of-a-family-of-polynomials)-1",
    "page": "Developer guide",
    "title": "T enumerated as a triangle (or coefficients of a family of polynomials)",
    "category": "section",
    "text": "n\\k 0 1 2 3 4 5\n0 T(0,0)     \n1 T(1,0) T(1,1)    \n2 T(2,0) T(2,1) T(2,2)   \n3 T(3,0) T(3,1) T(3,2) T(3,3)  \n4 T(4,0) T(4,1) T(4,2) T(4,3) T(4,4) \n5 T(5,0) T(5,1) T(5,2) T(5,3) T(5,4) T(5,5)"
},

{
    "location": "developerguide/#T-enumerated-as-a-rectangle-(or-parametrized-family-of-sequences)-1",
    "page": "Developer guide",
    "title": "T enumerated as a rectangle (or parametrized family of sequences)",
    "category": "section",
    "text": "n\\k 0 1 2 3 4 ...\n0 T(0,0) T(1,1) T(2,2) T(3,3) T(4,4) ...\n1 T(1,0) T(2,1) T(3,2) T(4,3) T(5,4) ...\n2 T(2,0) T(3,1) T(4,2) T(5,3) T(6,4) ...\n3 T(3,0) T(4,1) T(5,2) T(6,3) T(7,4) ...\n4 T(4,0) T(5,1) T(6,2) T(7,3) T(8,4) ...Informally we can say that pushing the k-th column of a triangle up k cells transforms the triangle into the rectangle. Formally the indices are transformed (n k)  (n+k k) when proceeding from the triangle form to the rectangular form."
},

{
    "location": "developerguide/#dim-sequences-3",
    "page": "Developer guide",
    "title": "3-dim sequences",
    "category": "section",
    "text": "3-dimensional arrays are implemented here only as parametrized triangles (family of triangles). For example consider:``T(n,k,m) = [t^n] Γ(n+k+m+t)/Γ(k+m+t) for n,m ≥ 0 and 0 ≤ k ≤ n.``\n\nA307419(n, k) = T(n, k, 0)\nA325137(n, k) = T(n, k, 1)\nA325139(n, k) = T(n, k, 2)\n\nA000254(n) = T(n+1, 1, 0) = A307419(n+1, 1)\nA001706(n) = T(n+2, 2, 0) = A307419(n+2, 2)\nA001713(n) = T(n+3, 3, 0) = A307419(n+3, 3)\nA001719(n) = T(n+4, 4, 0) = A307419(n+4, 4)\n\nA001705(n) = T(n+1, 1, 1) = A325137(n+1, 1)\nA001712(n) = T(n+2, 2, 1) = A325137(n+2, 2)\nA001718(n) = T(n+3, 3, 1) = A325137(n+3, 3)\nA001724(n) = T(n+4, 4, 1) = A325137(n+4, 4)\n\nA001711(n) = T(n+1, 1, 2) = A325139(n+1, 1)\nA001717(n) = T(n+2, 2, 2) = A325139(n+2, 2)\nA001723(n) = T(n+3, 3, 2) = A325139(n+3, 3)"
},

{
    "location": "developerguide/#Preferred-contributions-1",
    "page": "Developer guide",
    "title": "Preferred contributions",
    "category": "section",
    "text": "We prefer parametrized sequences (family of sequences) over single ones and triangles (family of polynomials) over straight sequences. In other words, we strongly encourage an top-down approach of the presentation. An example of this style can be seen above in the 3-dim section.Implementations of sequence-to-sequence transformations are always welcome."
},

{
    "location": "useofoeis/#",
    "page": "Use of the OEIS",
    "title": "Use of the OEIS",
    "category": "page",
    "text": ""
},

{
    "location": "useofoeis/#Use-of-the-OEIS-1",
    "page": "Use of the OEIS",
    "title": "Use of the OEIS",
    "category": "section",
    "text": "We emphasize that references to the Online Encyclopedia of Integer Sequences always mean only that information about the sequence can be found in this database, never that we necessarily implement the definition used there.There is a variety of reasons to deviate occasionally from the definitions used in the OEIS.Many sequences there are frozen by the editor in chief for so-called \'historical reasons\' (for example because they were published in this form in printed versions of the encyclopedia).\nConventions in the OEIS are used that made more sense in times of punch cards than today, for example the suppression of 0\'s in many series expansions.\nIf there exists a natural generalization with which the given sequence can be expressed more systematically then we will use it. In particular we give preference to the formal definition over an interpretation of a sequence.\nWe always try to specify the full extension of a sequence to the domain ℕ = {0, 1, 2, 3, ...} or to ℕ X ℕ. In practice this often means that we use a different offset than the one in the OEIS, for example by prepending s(0) to a sequence or a first column on the left hand side of a triangle which is (1, 1)-based in the OEIS."
},

{
    "location": "useofoeis/#Example:-an-arithmetic-function-1",
    "page": "Use of the OEIS",
    "title": "Example: an arithmetic function",
    "category": "section",
    "text": "For instance the Möbius function has the simple definition μ(1) = 1 and for all other n ∈ ℕ isμ(n) = − ∑ d ∈ δ(n) : μ(d)  where  δ(n) = {1 < d < n: d|n}are the proper divisors of n. We see that the special case n = 0 is covered by the formula: since δ(0) is empty the sum is zero and thus μ(0) = 0. (As a side note: Mathematica\'s Möbius function behaves exactly this way.)So we do not take the (meta-) point of view: \"This is an arithmetical function and thus not defined for n = 0.\", rather we say: \"This is the nice definition of a nice sequence and if someone wants to use only parts of this sequence for whatever reason we leave that restriction to him or her.\".We always defend the sequence against the interpretation."
},

{
    "location": "useofoeis/#Example:-a-triangle-with-left-column-cut-off-1",
    "page": "Use of the OEIS",
    "title": "Example: a triangle with left column cut off",
    "category": "section",
    "text": "There are many such examples in the OEIS, for instance the nice triangle of tangent numbers (A059419). However the author chose to define it only for (1 ≤ k ≤ n). Thus the natural representation of the triangle by Bell polynomials was prevented and in innumerable small formulas, which refer to these numbers, special cases or restrictions had to be added. Not even the sequence of the row sums (A006229) matches the offset. Such unfortunate inconsistencies must always be taken into account (but not reproduced) when checking the correctness of our implementations."
},

{
    "location": "license/#",
    "page": "License",
    "title": "License",
    "category": "page",
    "text": ""
},

{
    "location": "license/#License-1",
    "page": "License",
    "title": "License",
    "category": "section",
    "text": "Sequences is a Julia package implementing mathematical integer sequences.Copyright (c) 2019 Peter Luschny / OpenLibMathSeqMIT LicensePermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
},

]}
