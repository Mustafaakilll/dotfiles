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

var sekil2 = new Sekil(20, 25);
console.log(sekil2.alanHesapla());

console.log(sekil1);
console.log(sekil1.kenar1);
console.log(sekil1.kenar2);
const alan = sekil1.alanHesapla();
console.log(alan);
