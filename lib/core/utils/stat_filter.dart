import 'package:pokemon/features/listing_feature/data/models/pokemon/stat.dart';

/// take stat value based on filter
String statFilter(List<Stat> stats, String filter) {
  for (var stat in stats) {
    if (stat.stat?.name == filter) {
      return stat.baseStat.toString();
    }
  }

  return '0';
}
