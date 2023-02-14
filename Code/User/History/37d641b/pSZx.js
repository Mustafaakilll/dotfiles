var dizi = [1, 2, "Merhaba", true];

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
console.log(filter);
