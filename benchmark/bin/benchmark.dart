// benchmark.dart
// Benchmarks to compare Dart with other programming language implementations
// e.g. Perl , Ruby, Scheme, Lua
//
library benchmark;

//import 'dart:async';

import 'fib.dart';
import 'perfectnumbers.dart';
import 'mandelbrot.dart';
import 'imageio.dart';

void main() {
  
  // setup stopwatch
  var sw1 = new Stopwatch();
  var sw2 = new Stopwatch();
  var sw3 = new Stopwatch();
  var sw4 = new Stopwatch();
  var sw5 = new Stopwatch();
  var sw6 = new Stopwatch();
  var sw7 = new Stopwatch();
  var sw8 = new Stopwatch();

  // fibonacci series
  sw1.start();
  print('Calculate fib(35): ${fib_naive(35)}');
  sw1.stop();
  print('Elapsed time ${sw1.elapsedMilliseconds}ms');
  
  sw2.start();
  print('Calculate fib(1000) (tail-recursive): ${fib_tr(1000)}');
  sw2.stop();
  print('Elapsed time ${sw2.elapsedMicroseconds}us');
  
  // perfect numbers
  sw3.start();
  print('Calculate perfect numbers until 10000: ${perfectnumbers(10000)}');
  sw3.stop();
  print('Elapsed time ${sw3.elapsedMilliseconds}ms');
  
  // mandelbrot set
  sw4.start();
//  print('Calculate mandelbrot set for 180x120 pixel...');
  var pixels = mandelbrotRgb(180, 120, -0.5, 0.0, 4.0/180);
  pixels.whenComplete(() {
    sw4.stop();
    print('Mandelbrot set (180:120) calculated. Elapsed time ${sw4.elapsedMilliseconds}ms');    
  });
  
  sw5.start();
  pixels.then((p) => writeImagePGM(r"..\..\mandelbrot.pgm", p, 180, 120, 255))
    .then( (_) {
      sw5.stop();
      print('Mandelbrot set (180:120) written to file. Elapsed time ${sw5.elapsedMilliseconds}ms');
  });
  
  sw6.start();
//  print('Calculate mandelbrot set for 640x480 pixel...');
  var pixelsLarge = mandelbrotRgb(640, 480, -0.5, 0.0, 4.0/640);
  pixelsLarge.whenComplete(() {
    sw6.stop();
    print('Mandelbrot set (640:480) calculated. Elapsed time ${sw6.elapsedMilliseconds}ms');    
  });
  
  sw7.start();
  pixelsLarge.then((p) => writeImagePGM(r"..\..\mandelbrot_640_480.pgm", p, 640, 480, 255))
    .then( (_) {
      sw7.stop();
      print('Mandelbrot set (640:480) written to file. Elapsed time ${sw7.elapsedMilliseconds}ms');
  });

      
//  print('Done!');
}
