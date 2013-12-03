// perfectnumbers.dart
// Calculate perfect numbers
//
library perfectnumbers;

bool isPerfect(int n) {
  var sum = 0;
  for (var i=1; i<n; i++) {
    if (n % i == 0) sum += i;
  }
  
  return (sum == n);
}

List<int> perfectnumbers(int n) {
  var pn = [];
  
  for (var i=1; i<n; i++) {
    if (isPerfect(i)) pn.add(i);
  }
  
  return pn;
}
