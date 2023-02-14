class Sekil {
  constructor(kenar1, kenar2) {
    this.kenar1 = kenar1;
    this.kenar2 = kenar2;
  }

  alanHesapla();
  cevreHesapla();
}

class Dortgen extends Sekil {
  constructor(kenar1, kenar2) {
    super(kenar1,kenar2)
  }

  alanHesapla() {
    console.log(this.kenar1 * this.kenar2);
    return this.kenar1 * this.kenar2
  }
}

class Daire extends Sekil {
  constructor(yaricap) {
    super()
    this.yaricap = yaricap
  }
  PI = 3.14;

  alanHesapla() {
    console.log(this.yaricap * this.yaricap * PI);
    return this.yaricap * this.yaricap * PI
  }
}