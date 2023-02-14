/* var dizi = [1, 2, 3, "Merhaba"];
var dizi1 = [4, 5, 6];

var tamDizi = [...dizi, ...dizi1];
console.log(tamDizi); */

/* console.log(dizi);
dizi.push(3);
console.log(dizi);
console.log(dizi.pop());
console.log(dizi); */

/* for (i = 0; i < dizi.length; i++) {
  console.log(dizi[i]);
} */

/* dizi.forEach((item) => {
  console.log(item);
}); */

/* dizi.map((eleman) => {
  console.log(eleman);
}); */

/* const filter = dizi.filter((item) => item % 2 == 0);
const filter1 = dizi.filter((item) => typeof item == "string");
console.log(filter);
console.log(filter1); */

/* const obje = {
  name: "Mustafa",
  surname: "Akil",
}; */

/* console.log(obje.name);
console.log(obje.surname); */

/* Object.keys(obje).map((a) => {
  console.log(a + " " + obje[a]);
}); */

/* console.log(Object.values(obje)); */

/* function topla(sayi1, sayi2, ...args) {
  let toplam = 0;
  for (i = 0; i < args.length; i++) {
    toplam += args[i];
  }
  toplam += sayi1;
  toplam += sayi2;

  console.log(toplam);
}

const carp = (sayi3, sayi4) => {
  return sayi3 * sayi4;
};

const carpim = carp(3, 4);
console.log(carpim); */
/* topla(1, 2, 3, 4, 5); */

var obje = {
  1: {
    name: "Ahmet",
    surname: "Okcu",
    age: 18,
    school: "Pamukkale Universitesi",
  },
  2: {
    name: "Veli",
    surname: "Okcu",
    age: 20,
    school: "Uludag Universitesi",
  },
  3: {
    name: "Mustafa",
    surname: "Akil",
    age: 22,
    school: "Pamukkale Universitesi",
  },
  4: {
    name: "Guven",
    surname: "Karabulut",
    age: 23,
    school: "Isparta Uygulamali Bilimler Universitesi",
  },
  5: {
    name: "Yahya",
    surname: "Basakci",
    age: 24,
    school: "Ege Universitesi",
  },
  6: {
    name: "Arda",
    surname: "Ozcelik",
    age: 19,
    school: "Pamukkale Universitesi",
  },
};

var dizi = [];

Object.keys(obje).forEach((item) => {
  if (obje[item].school === "Pamukkae Universitesi") {
    dizi.push(obje[item]);
  }
});

/* for (i = 1; i <= Object.keys(obje).length; i++) {
  if (obje[i].school === "Pamukkale Universitesi") {
    dizi.push(obje[i]);
  }
} */

console.log(dizi);
