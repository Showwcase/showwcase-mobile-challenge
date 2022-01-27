import 'package:flutter_challenge/src/home/domain/models/pokemon/stat.dart';

/// take stat value based on filter
String statFilter(List<Stat> stats, String filter) {
  for (var stat in stats) {
    if (stat.stat?.name == filter) {
      return stat.baseStat.toString();
    }
  }

  return '0';
}
