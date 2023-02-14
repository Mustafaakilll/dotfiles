var dizi = [1, 2, "Merhaba", true, 4];

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

const filter = dizi.filter((item) => item % 2 == 0);
const filter1 = dizi.filter((item) => typeof item == String);
console.log(filter);
