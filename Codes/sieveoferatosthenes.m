clc
clear all

%Find all the twin Primes for any given Number N less than that number

a = primes(30);
a = a(a>10);
n = find(diff([a(1:end-1);a(2:end)])==2);
out = a([n;n+1]).'