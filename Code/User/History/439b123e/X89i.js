class Sekil {
  constructor(kenar1, kenar2) {
    this.kenar1 = kenar1;
    this.kenar2 = kenar2;
  }

  alanHesapla() {
    return this.kenar1 * this.kenar2;
  }
}

var sekil1 = new Sekil();
sekil1.kenar1 = 10;
sekil1.kenar2 = 15;

console.log(sekil1);
console.log(sekil1.kenar1);
console.log(sekil1.kenar2);
