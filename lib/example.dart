import 'dart:io';

import 'logic/score.dart';

class Example {
  List<Score> intialExample = [
    Score(label: 'MPI', value: -0.676187074894606),
    Score(label: 'RYD', value: -0.410085929),
    Score(label: 'AAP', value: -0.797942151),
    Score(label: 'PAC', value: 0),
    Score(label: 'SWR', value: -0.558665688),
    Score(label: 'HWD', value: -0.676187075),
    Score(label: 'WWT', value: 0.115762196),
    Score(label: 'PWQ', value: 0),
    Score(label: 'CWT', value: 0),
    Score(label: 'SES', value: -0.212614261),
    Score(label: 'OWR', value: 0),
    Score(label: 'PWD', value: 0),
    Score(label: 'AWD', value: 0),
    Score(label: 'SSA', value: -0.041999394),
    Score(label: 'WSL', value: -1.005657864),
    Score(label: 'PDL', value: 0),
//    Score(label: 'OS', value: -0.266473578)
  ];

  List<Score> example1 = [
    Score(label: 'MPI', value: -0.676187075),
    Score(label: 'RYD', value: -0.410085929),
    Score(label: 'AAP', value: -0.797942151),
    Score(label: 'PAC', value: 0),
    Score(label: 'SWR', value: -0.558665688),
    Score(label: 'HWD', value: -0.676187075),
    Score(label: 'WWT', value: 0.499480733),
    Score(label: 'PWQ', value: 0),
    Score(label: 'CWT', value: 0),
    Score(label: 'SES', value: -0.212614261),
    Score(label: 'OWR', value: 0),
    Score(label: 'PWD', value: 0),
    Score(label: 'AWD', value: 0),
    Score(label: 'SSA', value: -0.041999394),
    Score(label: 'WSL', value: -1.005657864),
    Score(label: 'PDL', value: 0),
  ];

  get getInitExample {
    return intialExample;
  }
}
