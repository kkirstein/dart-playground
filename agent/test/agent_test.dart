library agent_test;

import 'package:unittest/unittest.dart';

import 'package:agent/agent.dart';

void main() {
  
  test('AgentConstructor', () {
    var agent = new Agent();

    expect(agent.start(() => new Map()), isTrue);
  });
  
  skip_test('AgentUpdate', () {

    // TODO
    throw new TestFailure('Not implemented');
  });

  skip_test('AgentGet', () {

    // TODO
    throw new TestFailure('Not implemented');
  });

}
