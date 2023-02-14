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

const obje = {
  name: "Mustafa",
  surname: "Akil",
};

/* console.log(obje.name);
console.log(obje.surname); */

/* Object.keys(obje).map((a) => {
  console.log(a + " " + obje[a]);
}); */

/* console.log(Object.values(obje)); */

function topla(sayi1, sayi2, ...args) {
  let toplam = 0;
  for (i = 0; i < args.length; i++) {
    toplam += args[i];
  }
  toplam += sayi1;
  toplam += sayi2;

  console.log(toplam);
}

topla(1, 2, 3, 4, 5);
