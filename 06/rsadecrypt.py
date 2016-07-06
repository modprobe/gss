#!/usr/bin/env python3
import itertools

p = 271
q = 379
e = 47

data = [14979, 20999, ...]

n = p*q
p1q1 = (p-1)* (q-1)
for d in itertools.count():
    if (e*d) % p1q1 == 1:
        break

def decode(c):
    return chr((c ** d) % n)

print('d = {}'.format(d))
print("".join(map(decode, data)))
