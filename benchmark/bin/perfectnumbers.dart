// vim: ft=dart sw=2 ts=2
//
// perfectnumbers.dart
// Calculate perfect numbers
//
library perfectnumbers;

import 'dart:async';

bool isPerfect(int n) {
	var sum = 0;
	for (var i = 1; i < n; i++) {
		if (n % i == 0) sum += i;
	}

	return (sum == n);
}

Future<bool> isPerfect2(int n) {
	var sum = 0;

	return new Future( () {
		for (var i = 1; i < n; i++) {
			if (n % i == 0) sum += i;
		}

		return (sum == n);
	});
}

List<int> perfectnumbersSync(int n) {
	var pn = [];

	for (var i = 1; i < n; i++) {
		if (isPerfect(i)) pn.add(i);
	}

	return pn;
}

Future<List<int>> perfectnumbers(int n) async {
	var pn = [];
	var f = [];

	for (var i = 1; i < n; i++) {
		f.add(isPerfect2(i).then((val) { if (val) { pn.add(i); } }));
	}

	await Future.wait(f);
	return pn;
}

Future<List<int>> perfectnumbers2(int n) async {
	var pn = [];
	var inp = new List<int>.generate(n, (i) => i);

	var f = Future.forEach(inp, isPerfect);

	return f;
}


