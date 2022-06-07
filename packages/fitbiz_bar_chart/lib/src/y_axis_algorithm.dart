import 'dart:math';

countDegree(num estep, num maxN, num minN, bool symmetrical) {
  num maxi, mini;
  maxi = (maxN / estep + 1).toInt() * estep;
  mini = (minN / estep - 1).toInt() * estep;
  if (maxN == 0) maxi = 0;
  if (minN == 0) mini = 0;
  if (symmetrical && maxi * mini < 0) {
    var tm = max(maxi.abs(), mini.abs());
    maxi = tm;
    mini = -tm;
  }

  return [maxi, mini];
}

YAxsiValue getYasxiNumber(List<num> valueList, int splitNumber) {
  var symmetrical = false;
  var deviation = false;
  var magic = [10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 90, 100];
  var arr = valueList;
  num maxN, minN;
  maxN = arr.reduce(max);
  minN = arr.reduce(min);
  var tempGap = (maxN - minN) / splitNumber;
  num multiple = (tempGap == 0 ? 0.0 : (log(tempGap) / ln10 - 1)).floor();
  multiple = pow(10, multiple);
  var tempStep = tempGap / multiple;
  num estep = 0.0;
  var lastIndex = -1;
  int magicIndex = 0;
  for (var i = 0; i < magic.length; i++) {
    if (magic[i] > tempStep) {
      estep = magic[i] * multiple;
      magicIndex = i;
      break;
    }
  }

  num maxi, mini;
  List maxAndMin = countDegree(estep, maxN, minN, symmetrical);
  maxi = maxAndMin[0];
  mini = maxAndMin[1];

  if (deviation) {
    var interval = estep;
    return YAxsiValue(maxi, mini, interval);
  } else if (!symmetrical || maxi * mini > 0) {
    var tempSplitNumber = ((maxi - mini) / estep).round();
    do {
      if ((magicIndex - lastIndex) * (tempSplitNumber - splitNumber) < 0) {
        while (tempSplitNumber < splitNumber) {
          if ((mini - minN) <= (maxi - maxN) && mini != 0 || maxi == 0) {
            mini -= estep;
          } else {
            maxi += estep;
          }
          tempSplitNumber++;
          if (tempSplitNumber == splitNumber) break;
        }
      }
      if (magicIndex >= magic.length - 1 || magicIndex <= 0 || tempSplitNumber == splitNumber) break;
      lastIndex = magicIndex;
      if (tempSplitNumber > splitNumber) {
        estep = magic[++magicIndex] * multiple;
      } else {
        estep = magic[--magicIndex] * multiple;
      }
      List maxAndMin = countDegree(estep, maxN, minN, symmetrical);
      maxi = maxAndMin[0];
      mini = maxAndMin[1];
    } while (tempSplitNumber != splitNumber);
  }
  maxi = maxi;
  mini = mini;
  var interval = (maxi - mini) / splitNumber;

  return YAxsiValue(maxi, mini, interval);
}

class YAxsiValue {
  num maxY;
  num minY;
  num interval;
  YAxsiValue(this.maxY, this.minY, this.interval);
}
