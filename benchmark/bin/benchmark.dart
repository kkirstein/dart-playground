// vim: ft=dart sw=2 ts=2
//
// benchmark.dart
// Benchmarks to compare Dart with other programming language implementations
// e.g. Perl , Ruby, Scheme, Lua
//
library benchmark;

//import 'dart:async';
import 'dart:io';

import 'package:image/image.dart';

import 'fib.dart';
import 'perfectnumbers.dart';
import 'mandelbrot.dart';
import 'imageio.dart';

void main() {
	// setup stopwatch
	var sw1 = new Stopwatch();
	var sw2 = new Stopwatch();
	var sw3 = new Stopwatch();
	var sw3a = new Stopwatch();
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
	print('Calculate perfect numbers until 10000 (sync): ${perfectnumbersSync(10000)}');
	sw3.stop();
	print('Elapsed time ${sw3.elapsedMilliseconds}ms');

	sw3a.start();
	var pn = perfectnumbers2(10000);
	pn.then((val) {
		print('Calculate perfect numbers until 10000: ${val}');
		sw3a.stop();
		print('Elapsed time ${sw3a.elapsedMilliseconds}ms');
	});

	// mandelbrot set
	sw4.start();
	var pixels = mandelbrotRgb(640, 480, -0.5, 0.0, 4.0 / 640);
	pixels.whenComplete(() {
		sw4.stop();
		print(
			'Mandelbrot set (640:480) calculated. Elapsed time ${sw4.elapsedMilliseconds}ms');
	});

	pixels
		.then((p) {
			sw5.start();
			new File(r"..\mandelbrot_640_480.png")
				..writeAsBytes(encodePng(p));
		}).then((_) {
			sw5.stop();
			print(
				'Mandelbrot set (640:480) written to file. Elapsed time ${sw5.elapsedMilliseconds}ms');
		});

	sw6.start();
	var pixelsLarge = mandelbrotRgb(1920, 1080, -0.5, 0.0, 4.0 / 1920);
	pixelsLarge.whenComplete(() {
		sw6.stop();
		print(
			'Mandelbrot set (1920:1080) calculated. Elapsed time ${sw6.elapsedMilliseconds}ms');
	});

	pixelsLarge
		.then((p) {
			sw7.start();
			new File(r"..\mandelbrot_1920_1080.png")
			..writeAsBytes(encodePng(p));
		}).then((_) {
			sw7.stop();
			print(
				'Mandelbrot set (1920:1080) written to file. Elapsed time ${sw7.elapsedMilliseconds}ms');
		});

	//  print('Done!');
}
