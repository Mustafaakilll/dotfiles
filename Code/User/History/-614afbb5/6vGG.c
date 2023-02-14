#include<stdio.h>
#include<locale.h>
#include<math.h>
#define hata 0.00001
float F(float x)
{return exp(x)/3;}
int main()
{setlocale(LC_ALL, "Turkish");
float x1=0,x2; int i=0;
printf("Yönteme başladığımız nokta= %.6f\n",x1);
do
{x2=x1;
x1=F(x1);
i++;
printf("%d. adımda yaklaşık değer= %.6f\n",i,x1);
}while (fabs(x1-x2)>hata);
printf("yaklaşık kök =%.6f",x1);
return 0;
}