import 'dart:math';

const hata = 0.00001;
double F(double x) {
  return pow(x, 3) + 7 * pow(x, 2) - 5 * x - 20;
}

double FT(double x) {
  return 3 * pow(x, 2) + 14 * x - 5;
}

int main() {
  double x0 = 8;
  double x = 0;
  int i = 0;
  print("Yönteme başladığımız nokta= $x0\n");
  do {
    x = x0;
    x0 = x - F(x) / FT(x);
    i++;
    print("$i. adımda yaklaşık değer= $x0\n");
  } while ((x0 - x).abs() > hata);
  print("yaklaşık kök = $x0");
  return 0;
}
