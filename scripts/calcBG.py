import math
import numpy as np

N = 8
Itot = 10e-6

k = 1.38064852e-23
q = 1.60217662e-19

# Vbe values are found through simulation with a bias current of 3.5uA and 7uA
VbeBDm16i5 = 0.654
VbeBDm8i5 = 0.658
VbeBDm8i10 = 0.6895
VbeBDm16i10 = 0.6718
VbeSD = 0.713

if N == 8 and Itot == 5e-6:
    VbeBD = VbeBDm8i5
elif N == 8 and Itot == 10e-6:
    VbeBD = VbeBDm8i10
elif N == 16 and Itot == 5e-6:
    VbeBD = VbeBDm16i5
elif N == 16 and Itot == 10e-6:
    VbeBD = VbeBDm16i10


ResRatio = round((2e-3 * q) / (k * math.log(N)), 2)

print("ResRatio = ", ResRatio)


R1 = round((VbeSD/ResRatio + (VbeSD - VbeBD)) / Itot, 0)
R2 = round(ResRatio * R1, 0)

print("R1 = ", R1)
print("R2 = ", R2)