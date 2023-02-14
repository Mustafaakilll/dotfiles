/* class Sekil {
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
 */

/* class Dizi {
  dizi = [];
  constructor(...args) {
    args.map((item) => {
      this.dizi.push(item);
    });
  }
  push(item) {
    this.dizi.push(item);
  }
  pop() {
    return this.dizi.pop();
  }

  print() {
    this.dizi.forEach((item) => {
      console.log(item);
    });
  }
}

var dizi1 = new Dizi(1, 2, 3, 4, 5, 6);
dizi1.print();
dizi1.push(7);
dizi1.print();
dizi1.pop();
dizi1.print();
 */

class Sekil {
  constructor(kenar1, kenar2) {
    this.kenar1 = kenar1;
    this.kenar2 = kenar2;
  }

  alanHesapla() {
    return this.kenar1 * this.kenar1;
  }
  cevreHesapla();
}

class Kare extends Sekil{
  constructor(kenar1) {
    this.kenar1 = kenar1;
    super(kenar1)
  }
  cevreHesapla() {
    return this.kenar1 * 4
  }
}


