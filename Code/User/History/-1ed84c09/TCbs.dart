combination(List list, int k) {
  if (k == 0) {
    return null;
  }
}

void backtracking(List<int> list, List result, List temp, int start, int n, int k) {
  if (temp.length == k) {
    result.add(temp.toList());
    return;
  }
  for (var i = start; i < n; i++) {
    temp.add(list[i]);
    backtracking(list, result, temp, i + 1, n, k);
    temp.removeLast();
  }
}

void main(List<String> args) {
  combination();
}
