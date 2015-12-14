// complex.dart
// complex numbers class
//
library complex;

import 'dart:math';

class Complex {
  // properties
  num r, i;

  // constructor
  Complex(this.r, this.i);

  // public methods
  String toString() => "($r,$i)";

  Complex operator +(Complex other) => new Complex(r + other.r, i + other.i);
  Complex operator *(Complex other) =>
      new Complex(r * other.r - i * other.i, r * other.i + i * other.r);

  double abs() => sqrt(r * r + i * i);
}
