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
    // console.log("Sekil");
  }

  alanHesapla() {
    return this.kenar1 * this.kenar1;
  }
  cevreHesapla() {}
}

class Kare extends Sekil {
  constructor(kenar1) {
    super(kenar1);
    this.kenar1 = kenar1;
    // console.log("Kare");
  }
  cevreHesapla() {
    return this.kenar1 * 4;
  }
}

class Dikdortgen extends Sekil {
  constructor(kenar1, kenar2) {
    super(kenar1, kenar2);
    // console.log("Dikdortgen");
  }

  alanHesapla() {
    return this.kenar1 * this.kenar2;
  }
}

class Ucgen extends Kare {
  constructor(kenar1, kenar2, kenar3) {
    super(kenar1);
    this.kenar2 = kenar2;
    this.kenar3 = kenar3;
    // console.log("Ucgen");
  }

  alanHesapla(yukseklik) {
    return (this.kenar1 * yukseklik) / 2;
  }

  alanHesapla() {
    return (this.kenar2 * this.kenar3) / 2;
  }

  alanHesapla(yukseklik, kenar) {
    return (kenar * yukseklik) / 2;
  }
}

// const kare1 = new Kare(15);
// const alan = kare1.alanHesapla();
// console.log(alan);

const dikdortgen = new Dikdortgen(10, 15);
// console.log(dikdortgen.alanHesapla());

const ucgen = new Ucgen(10, 12, 15);
console.log(ucgen.alanHesapla(12));
console.log(ucgen.alanHesapla());
console.log(ucgen.alanHesapla(12, 15));
