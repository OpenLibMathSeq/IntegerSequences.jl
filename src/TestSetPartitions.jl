# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

#=
---------------------------------------------------------------
versioninfo()
Julia Version 1.3.1
Commit 2d5741174c (2019-12-30 21:36 UTC)
Platform Info:
  OS: Windows (x86_64-w64-mingw32)
  CPU: AMD Athlon(tm) II X4 640 Processor
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.1 (ORCJIT, amdfam10)
Environment:
  JULIA_EDITOR = "atom.exe"  -a   
  JULIA_NUM_THREADS = 4
---------------------------------------------------------------

The execution of this file leads to the following error message:

Please submit a bug report with steps to reproduce this fault, and any error messages that follow (in their entirety). Thanks.
Exception: EXCEPTION_ACCESS_VIOLATION at 0x2b33f08d -- fmpz_set at /workspace/srcdir/flint2/fmpz\set.c:23
in expression starting at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\SetPartitionsTypeM.jl:539
fmpz_set at /workspace/srcdir/flint2/fmpz\set.c:20
coeff at C:\Users\Home\.julia\packages\Nemo\LBWHq\src\flint\fmpz_poly.jl:38
unknown function (ip: 0000000018263017)
#7 at .\none:0 [inlined]
iterate at .\generator.jl:47 [inlined]
collect at .\array.jl:622
SetPartitionsOfTypeM at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\Polynomials.jl:56
L036040 at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\SetPartitionsTypeM.jl:394 [inlined]
macro expansion at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\SetPartitionsTypeM.jl:456 [inlined]
macro expansion at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.3\Test\src\Test.jl:1107 [inlined]
test at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\SetPartitionsTypeM.jl:455
main at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\SetPartitionsTypeM.jl:534
unknown function (ip: 0000000018233FA0)
_jl_invoke at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2141 [inlined]
jl_apply_generic at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2305
jl_apply at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\julia.h:1631 [inlined]
do_call at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:328
eval_value at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:417
eval_stmt_value at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:368 [inlined]
eval_body at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:764
jl_interpret_toplevel_thunk_callback at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:888
unknown function (ip: FFFFFFFFFFFFFFFE)
unknown function (ip: 000000002934610F)
unknown function (ip: FFFFFFFFFFFFFFFF)
jl_toplevel_eval_flex at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:814
jl_eval_module_expr at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:181
jl_toplevel_eval_flex at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:640
jl_parse_eval_all at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\ast.c:873
jl_load at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:878 [inlined]
jl_load_ at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:885
include at .\boot.jl:328 [inlined]
include_relative at .\loading.jl:1105
include at .\Base.jl:31
_jl_invoke at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2135 [inlined]
jl_apply_generic at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2305
jl_apply at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\julia.h:1631 [inlined]
do_call at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:328
eval_value at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:417
eval_stmt_value at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:368 [inlined]
eval_body at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:764
eval_body at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:705
jl_interpret_toplevel_thunk_callback at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\interpreter.c:888
unknown function (ip: FFFFFFFFFFFFFFFE)
unknown function (ip: 0000000010DE970F)
unknown function (ip: 0000000000000002)
jl_toplevel_eval_flex at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:814
jl_toplevel_eval at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:823 [inlined]
jl_toplevel_eval_in at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:843
eval at .\boot.jl:330 [inlined]
eval at .\client.jl:425
_jl_invoke at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2135 [inlined]
jl_apply_generic at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2305
top-level scope at .\none:3
jl_toplevel_eval_flex at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:808
jl_toplevel_eval_flex at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:764
jl_toplevel_eval at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:823 [inlined]
jl_toplevel_eval_in at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\toplevel.c:843
eval at .\boot.jl:330
_jl_invoke at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2135 [inlined]
jl_apply_generic at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2305
exec_options at .\client.jl:263
_start at .\client.jl:460
jfptr__start_2086 at C:\Users\Home\AppData\Local\Julia-1.3.1\lib\julia\sys.dll (unknown line)
_jl_invoke at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2135 [inlined]
jl_apply_generic at /cygdrive/d/buildbot/worker/package_win64/build/src/cygdrive/d/buildbot/worker/package_win64/build/src\gf.c:2305
unknown function (ip: 00000000004017DD)
unknown function (ip: 0000000000401BC5)
unknown function (ip: 00000000004013DE)
unknown function (ip: 000000000040151A)
BaseThreadInitThunk at C:\WINDOWS\System32\KERNEL32.DLL (unknown line)
RtlUserThreadStart at C:\WINDOWS\SYSTEM32\ntdll.dll (unknown line)
Allocations: 10894447 (Pool: 10893053; Big: 1394); GC: 12
ERROR: LoadError: Failed to precompile SetPartitionsTypeM [top-level] to C:\Users\Home\.julia\compiled\v1.3\SetPartitionsTypeM.ji.
Stacktrace:
 [1] compilecache(::Base.PkgId, ::String) at .\loading.jl:1283
 [2] _require(::Base.PkgId) at .\loading.jl:1024
 [3] require(::Base.PkgId) at .\loading.jl:922
 [4] require(::Module, ::Symbol) at .\loading.jl:917
in expression starting at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\TestSetPartitions.jl:8
=#

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module TestSetPartitions

using Nemo, SetPartitionsTypeM, OrderedSetPartitionsTypeM, SeqUtils, OEISUtils

function Test()

    rowsum(f, m, len) = [sum(f(m, k)) for k ∈ 0:len-1]
    altrowsum(f, m, len) = [sum([(iseven(j) ? -c : c) for (j, c) in enumerate(f(m, k))]) for k ∈ 0:len-1]

    for m ∈ 0:4
        println("\n++++++++++++++++++++++++++\n")
        println("\nShapePartitions m = $m")
        for n ∈ 0:6
            ShapePartitionsOfTypeM(m, n) |> Println
        end
        println()
        seq = ShapePartitionsOfTypeM(m, 5)
        oeis_search(seq, 2)
        println()
        println("Row sums:")
        rsum = rowsum(ShapePartitionsOfTypeM, m, 6)
        oeis_search(rsum, 2)
        println()
        println("Alternating row sums:")
        asum = altrowsum(ShapePartitionsOfTypeM, m, 6)
        oeis_search(asum, 2)
        println()

        println()
        println("\nSetPartitions m = $m")
        for n ∈ 0:6
            SetPartitionsOfTypeM(m, n) |> Println
        end
        println()
        seq = SetPartitionsOfTypeM(m, 5)
        oeis_search(seq, 2)
        println()
        println("Row sums:")
        rsum = rowsum(SetPartitionsOfTypeM, m, 6)
        oeis_search(rsum, 2)
        println()
        println("Alternating row sums:")
        asum = altrowsum(SetPartitionsOfTypeM, m, 6)
        oeis_search(asum, 2)
        println()
    end

    for m ∈ 0:4
        println("\n++++++++++++++++++++++++++\n")
        println("\nO-ShapePartitions m = $m")
        for n ∈ 0:6
            #OrderedShapePartitionsOfTypeM(m, n) |> Println
            OrderedShapePartitions(m, n) |> Println
        end
        println()
        seq = OrderedShapePartitions(m, 5)
        oeis_search(seq, 2)
        println()
        println("Row sums:")
        rsum = rowsum(OrderedShapePartitions, m, 6)
        oeis_search(rsum, 2)
        println()
        println("Alternating row sums:")
        asum = altrowsum(OrderedShapePartitions, m, 6)
        oeis_search(asum, 2)
        println()

        println("\nO-SetPartitions m = $m")
        for n ∈ 0:6
            #OrderedSetPartitionsOfTypeM(m, n) |> Println
            OrderedSetPartitions(m, n) |> Println
        end
        println()
        seq = OrderedSetPartitions(m, 5)
        oeis_search(seq, 2)
        println()
        println("Row sums:")
        rsum = rowsum(OrderedSetPartitions, m, 6)
        oeis_search(rsum, 2)
        println()
        println("Alternating row sums:")
        asum = altrowsum(OrderedSetPartitions, m, 6)
        oeis_search(asum, 2)
        println()
    end

end

Test()

end # module

#=

('--', 0, '---------------------')

by Shape    A000012
[0] [1]
[1] [1]
[2] [1, 1]
[3] [1, 1, 1]
[4] [1, 1, 1, 1, 1]
[5] [1, 1, 1, 1, 1, 1, 1]
[6] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

by Length   A008284
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 1, 1]
[4] [0, 1, 2, 1, 1]
[5] [0, 1, 2, 2, 1, 1]
[6] [0, 1, 3, 3, 2, 1, 1]

[1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 2, 1, 1, 0, 1, 2, 2, 1, 1]

RowSum      A000041 [1, 1, 2, 3, 5, 7, 11]
AlterRowSum A081362 [1, -1, 0, -1, 1, -1, 1]
Diagonal    A000012 [1, 1, 1, 1, 1, 1, 1]
Central     A000041 [1, 1, 2, 3, 5, 7]


('--', 1, '---------------------')

by Shape    A036040
[0] [1]
[1] [1]
[2] [1, 1]
[3] [1, 3, 1]
[4] [1, 4, 3, 6, 1]
[5] [1, 5, 10, 10, 15, 10, 1]
[6] [1, 6, 15, 10, 15, 60, 15, 20, 45, 15, 1]

[1, 1, 1, 1, 1, 3, 1, 1, 4, 3, 6, 1]

by Length   A048993
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 3, 1]
[4] [0, 1, 7, 6, 1]
[5] [0, 1, 15, 25, 10, 1]
[6] [0, 1, 31, 90, 65, 15, 1]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 3, 1]
[4] [0, 1, 7, 6, 1]
[5] [0, 1, 15, 25, 10, 1]
[6] [0, 1, 31, 90, 65, 15, 1]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 2]
[3] [0, 1, 6, 6]
[4] [0, 1, 14, 36, 24]
[5] [0, 1, 30, 150, 240, 120]
[6] [0, 1, 62, 540, 1560, 1800, 720]

[1, 0, 1, 0, 1, 1, 0, 1, 3, 1, 0, 1, 7, 6, 1, 0, 1, 15, 25, 10, 1]

RowSum      A000110 [1, 1, 2, 5, 15, 52, 203]
AlterRowSum A000587 [1, -1, 0, 1, 1, -2, -9]
Diagonal    A000012 [1, 1, 1, 1, 1, 1, 1]
Central     A007820 [1, 1, 7, 90, 1701, 42525]


('--', 2, '---------------------')

by Shape    A257490
[0] [1]
[1] [1]
[2] [1, 3]
[3] [1, 15, 15]
[4] [1, 28, 35, 210, 105]
[5] [1, 45, 210, 630, 1575, 3150, 945]
[6] [1, 66, 495, 462, 1485, 13860, 5775, 13860, 51975, 51975, 10395]

[1, 1, 1, 3, 1, 15, 15, 1, 28, 35, 210, 105]

by Length   A156289
[0] [1]
[1] [0, 1]
[2] [0, 1, 3]
[3] [0, 1, 15, 15]
[4] [0, 1, 63, 210, 105]
[5] [0, 1, 255, 2205, 3150, 945]
[6] [0, 1, 1023, 21120, 65835, 51975, 10395]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 3]
[3] [0, 1, 15, 15]
[4] [0, 1, 63, 210, 105]
[5] [0, 1, 255, 2205, 3150, 945]
[6] [0, 1, 1023, 21120, 65835, 51975, 10395]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 6]
[3] [0, 1, 30, 90]
[4] [0, 1, 126, 1260, 2520]
[5] [0, 1, 510, 13230, 75600, 113400]
[6] [0, 1, 2046, 126720, 1580040, 6237000, 7484400]

[1, 0, 1, 0, 1, 3, 0, 1, 15, 15, 0, 1, 63, 210, 105, 0, 1, 255, 2205, 3150, 945]

RowSum      A005046 [1, 1, 4, 31, 379, 6556, 150349]
AlterRowSum A260884 [1, -1, 2, -1, -43, 254, 4157]
Diagonal    A001147 [1, 1, 3, 15, 105, 945, 10395]
Central     A327416 [1, 1, 63, 21120, 20585565, 44025570225]


('--', 3, '---------------------')

by Shape    A327003
[0] [1]
[1] [1]
[2] [1, 10]
[3] [1, 84, 280]
[4] [1, 220, 462, 9240, 15400]
[5] [1, 455, 5005, 50050, 210210, 1401400, 1401400]
[6] [1, 816, 18564, 24310, 185640, 4084080, 2858856, 13613600, 85765680, 285885600, 190590400]

[1, 1, 1, 10, 1, 84, 280, 1, 220, 462, 9240, 15400]

by Length   A291451
[0] [1]
[1] [0, 1]
[2] [0, 1, 10]
[3] [0, 1, 84, 280]
[4] [0, 1, 682, 9240, 15400]
[5] [0, 1, 5460, 260260, 1401400, 1401400]
[6] [0, 1, 43690, 7128576, 99379280, 285885600, 190590400]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 10]
[3] [0, 1, 84, 280]
[4] [0, 1, 682, 9240, 15400]
[5] [0, 1, 5460, 260260, 1401400, 1401400]
[6] [0, 1, 43690, 7128576, 99379280, 285885600, 190590400]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 20]
[3] [0, 1, 168, 1680]
[4] [0, 1, 1364, 55440, 369600]
[5] [0, 1, 10920, 1561560, 33633600, 168168000]
[6] [0, 1, 87380, 42771456, 2385102720, 34306272000, 137225088000]

[1, 0, 1, 0, 1, 10, 0, 1, 84, 280, 0, 1, 682, 9240, 15400, 0, 1, 5460, 260260, 1401400, 1401400]

RowSum      A291973 [1, 1, 11, 365, 25323, 3068521, 583027547]
AlterRowSum A291974 [1, -1, 9, -197, 6841, -254801, -3000807]
Diagonal    A025035 [1, 1, 10, 280, 15400, 1401400, 190590400]
Central     A327417 [1, 1, 682, 7128576, 429120851544, 94066556834970720]


('--', 4, '---------------------')

by Shape    A327004
[0] [1]
[1] [1]
[2] [1, 35]
[3] [1, 495, 5775]
[4] [1, 1820, 6435, 450450, 2627625]
[5] [1, 4845, 125970, 4408950, 31177575, 727476750, 2546168625]
[6] [1, 10626, 735471, 1352078, 25741485, 1338557220, 1577585295, 15616500900, 165646455975, 1932541986375, 4509264634875]

[1, 1, 1, 35, 1, 495, 5775, 1, 1820, 6435, 450450, 2627625]

by Length   A291452
[0] [1]
[1] [0, 1]
[2] [0, 1, 35]
[3] [0, 1, 495, 5775]
[4] [0, 1, 8255, 450450, 2627625]
[5] [0, 1, 130815, 35586525, 727476750, 2546168625]
[6] [0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 35]
[3] [0, 1, 495, 5775]
[4] [0, 1, 8255, 450450, 2627625]
[5] [0, 1, 130815, 35586525, 727476750, 2546168625]
[6] [0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 70]
[3] [0, 1, 990, 34650]
[4] [0, 1, 16510, 2702700, 63063000]
[5] [0, 1, 261630, 213519150, 17459442000, 305540235000]
[6] [0, 1, 4196350, 17651304000, 4350310965000, 231905038365000, 3246670537110000]

[1, 0, 1, 0, 1, 35, 0, 1, 495, 5775, 0, 1, 8255, 450450, 2627625, 0, 1, 130815, 35586525, 727476750, 2546168625]

RowSum      A291975 [1, 1, 36, 6271, 3086331, 3309362716, 6626013560301]
AlterRowSum A291976 [1, -1, 34, -5281, 2185429, -1854147586, 2755045819549]
Diagonal    A025036 [1, 1, 35, 5775, 2627625, 2546168625, 4509264634875]
Central     A327418 [1, 1, 8255, 2941884000, 11957867341948125, 294040106448733743008625]

=#
