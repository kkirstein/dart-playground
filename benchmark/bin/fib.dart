// fib.dart
// Calculate Fibonacci series
//
library fib;

// naive implementation
int fib_naive(int n) {
  if (n <2)
    return n;
  else
    return fib_naive(n-2) + fib_naive(n-1);
}

// tail-recursive implementation
int _fib_aux(int n, int a, int b) {
  if (n==0)
    return a;
  else
    return _fib_aux(n-1, b, a+b);  
}
int fib_tr(int n) {
  return _fib_aux(n, 0, 1);
}