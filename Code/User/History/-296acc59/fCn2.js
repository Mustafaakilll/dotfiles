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

const dizi = [];

/* for (let i=1;i<=Object.keys(obje).length;i++){
  if(obje[i].school === 'Pamukkale Universitesi'){
    dizi.push(obje[i])
  }
}
console.log(dizi) */

/* Object.keys(obje).forEach((key) => {
  if (obje[key].school === "Pamukkale Universitesi") {
    dizi.push(obje[key]);
  }
}); */

/* Object.keys(obje).map((key) => {
  if (obje[key].school === "Pamukkale Universitesi") {
    dizi.push(obje[key]);
  }
}); */

Object.values(obje).forEach((ogrenci) => {
  if (ogrenci.school === "Pamukkale Universitesi") {
    dizi.push(ogrenci);
  }
});
console.log();

console.log(dizi);
