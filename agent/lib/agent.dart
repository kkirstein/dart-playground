library agent;

import 'dart:async';
import 'dart:isolate';

typedef dynamic StartupFun();
typedef dynamic UpdateFun(dynamic x);
//typedef T UpdateFun2(T x);

class Agent {

  // private properties
  var _bucket;
  
  // constructor
  Agent() {
    // TODO: spawn new isolate
  }
  
  bool start(StartupFun fun) {
    // TODO: send startup msg
    
    return false;
  }
  
  Future<dynamic> update(UpdateFun fun) {
    // TODO: send update msg
    
    return _bucket;
  }
  
//  factory 
}
