//+------------------------------------------------------------------+
//|                                               Lagrange.c         |
//|                         Copyright © 2012, Cleiton da Silva Gomes |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>

void Calculations3(int i);
void Calculations4(int i);
void Calculations5(int i);
double f3(double X);
double f4(double X);
double f5(double X);

double *a, *b, *c, *d, *e;
double *x, *fx;
double A,B,C,D,E;

int main (){
	int i, opcao;
	double X;

	do{
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		E = 0;
		system("clear");
		printf("\t\t    Programa Interpolacao por Lagrange\n\n");
		printf("\t(1) ............................................ n = 3\n");
		printf("\t(2) ............................................ n = 4\n");
		printf("\t(3) ............................................ n = 5\n");
		printf("\t(0) ............................................ Sair\n\n");
		printf(" Opcao desejada: ");
		scanf("%d",&opcao);
		
		switch(opcao){
			case 1:
				a = (double *)calloc(3, sizeof(double));
				b = (double *)calloc(3, sizeof(double));
				c = (double *)calloc(3, sizeof(double));
				x = (double *)calloc(3, sizeof(double));
				fx = (double *)calloc(3, sizeof(double));
				
				printf("\n");
				
				for(i=0; i<3; i++)
				{	
					printf("x%d = ",i);
					scanf("%lf",&x[i]);
					printf("f(%d) = ",i);
					scanf("%lf",&fx[i]);
				}
				
				for(i=0; i<3; i++) Calculations3(i);
				
				for(i=0; i<3; i++)
				{
					A += a[i];
					B += b[i];
					C += c[i];
				}
				
				printf("P2(x) = (%lf)x^2 + (%lf)x + (%lf)\n\n",A,B,C);
				do
				{
					printf("Entre com o valor de x: ");
					scanf("%lf",&X);
					
					printf("f(%.2lf) = %lf\n",X,f3(X));
					
					printf("\n");
					//system("read b");
				}while(X);
				
				break;
			
			case 2:
				a = (double *)calloc(4, sizeof(double));
				b = (double *)calloc(4, sizeof(double));
				c = (double *)calloc(4, sizeof(double));
				d = (double *)calloc(4, sizeof(double));
				x = (double *)calloc(4, sizeof(double));
				fx = (double *)calloc(4, sizeof(double));
				
				
				printf("\n");
				
				for(i=0; i<4; i++)
				{	
					printf("x%d = ",i);
					scanf("%lf",&x[i]);
					printf("f(%d) = ",i);
					scanf("%lf",&fx[i]);
				}
				
				for(i=0; i<4; i++) Calculations4(i);
				
				for(i=0; i<4; i++)
				{
					A += a[i];
					B += b[i];
					C += c[i];
					D += d[i];
				}
				
				printf("P2(x) = (%lf)x^3 + (%lf)x^2 + (%lf)x + (%lf)\n\n",A,B,C,D);
				do
				{
					printf("Entre com o valor de x: ");
					scanf("%lf",&X);
					
					printf("f(%.2lf) = %lf\n",X,f4(X));
					
					printf("\n");
					//system("read b");
				} while(X);
				
				break;
				
			case 3:
				a = (double *)calloc(5, sizeof(double));
				b = (double *)calloc(5, sizeof(double));
				c = (double *)calloc(5, sizeof(double));
				d = (double *)calloc(5, sizeof(double));
				e = (double *)calloc(5, sizeof(double));
				x = (double *)calloc(5, sizeof(double));
				fx = (double *)calloc(5, sizeof(double));
				
				
				printf("\n");
				
				for(i=0; i<5; i++)
				{	
					printf("x%d = ",i);
					scanf("%lf",&x[i]);
					printf("f(%d) = ",i);
					scanf("%lf",&fx[i]);
				}
				
				for(i=0; i<4; i++) Calculations4(i);
				
				for(i=0; i<4; i++)
				{
					A += a[i];
					B += b[i];
					C += c[i];
					D += d[i];
					E += e[i];
				}
				
				printf("P2(x) = (%lf)x^4 + (%lf)x^3 + (%lf)x^2 + (%lf)x + (%lf)\n\n",A,B,C,D,E);
				do
				{
					printf("Entre com o valor de x: ");
					scanf("%lf",&X);
					
					printf("f(%.2lf) = %lf\n",X,f4(X));
					
					printf("\n");
					//system("read b");
				} while(X);
				
				break;
		}
	}while(opcao);	
		
	return 0;
}

void Calculations3(int i)
{
	double k;
	
	switch (i)
	{
		case 0:
			k = x[0]*x[0] - x[0]*x[2] - x[1]*x[0] + x[1]*x[2];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - x[2]*fx[i])/k;
			c[i] = (x[1]*x[2]*fx[i]) / k;
			break;
			
		case 1:
			k = x[1]*x[1] - x[1]*x[2] - x[0]*x[1] + x[0]*x[2];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[0] - x[2]*fx[i])/k;
			c[i] = (x[0]*x[2]*fx[i]) / k;
			break;
			
		case 2:
			k = x[2]*x[2] - x[1]*x[2] - x[0]*x[2] + x[0]*x[1];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[0] - x[1]*fx[i])/k;
			c[i] = (x[0]*x[1]*fx[i]) / k;
			break;
	}
}

void Calculations4(int i)
{
	double k;
	
	switch (i)
	{
		case 0:
			k = x[0]*x[0]*x[0] - x[0]*x[0]*x[3] - x[0]*x[0]*x[2] + x[0]*x[2]*x[3] - x[1]*x[0]*x[0] + x[1]*x[0]*x[3] + x[1]*x[0]*x[2] - x[1]*x[2]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[2] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[2]*x[3] + fx[i]*x[1]*x[3] + fx[i]*x[1]*x[2])/k;
			d[i] = (-x[1]*x[2]*x[3]*fx[i])/k;
			break;
			
		case 1:
			k = x[1]*x[1]*x[1] - x[1]*x[1]*x[3] - x[1]*x[1]*x[2] + x[1]*x[2]*x[3] - x[0]*x[1]*x[1] + x[0]*x[1]*x[3] + x[0]*x[1]*x[2] - x[0]*x[2]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[0] - fx[i]*x[2] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[2]*x[3] + fx[i]*x[0]*x[3] + fx[i]*x[0]*x[2])/k;
			d[i] = (-x[0]*x[2]*x[3]*fx[i])/k;
			break;
			
		case 2:
			k = x[2]*x[2]*x[2] - x[2]*x[2]*x[3] - x[2]*x[2]*x[0] + x[2]*x[0]*x[3] - x[1]*x[2]*x[2] + x[1]*x[2]*x[3] + x[1]*x[2]*x[0] - x[1]*x[0]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[0] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[0]*x[3] + fx[i]*x[1]*x[3] + fx[i]*x[1]*x[0])/k;
			d[i] = (-x[1]*x[0]*x[3]*fx[i])/k;
			break;
			
		case 3:
			k = x[3]*x[3]*x[3] - x[3]*x[3]*x[0] - x[3]*x[3]*x[2] + x[3]*x[2]*x[0] - x[1]*x[3]*x[3] + x[1]*x[3]*x[0] + x[1]*x[3]*x[2] - x[1]*x[2]*x[0];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[2] - fx[i]*x[0])/k;
			c[i] = (fx[i]*x[2]*x[0] + fx[i]*x[1]*x[0] + fx[i]*x[1]*x[2])/k;
			d[i] = (-x[1]*x[2]*x[0]*fx[i])/k;
			break;
	}
}

void Calculations5(int i)
{
	double k;
	
	switch (i)
	{
		case 0:
			k = x[0]*x[0]*x[0]*x[0] - x[0]*x[0]*x[0]*x[4] - x[0]*x[0]*x[0]*x[3] + x[0]*x[0]*x[3]*x[4] - x[0]*x[0]*x[0]*x[2] + x[0]*x[0]*x[2]*x[4] + x[0]*x[0]*x[2]*x[3] - x[0]*x[2]*x[4]*x[3] - x[0]*x[0]*x[0]*x[1] + x[0]*x[0]*x[1]*x[4] + x[0]*x[0]*x[1]*x[3] - x[0]*x[1]*x[4]*x[3] + x[0]*x[0]*x[1]*x[2] - x[0]*x[1]*x[2]*x[4] - x[0]*x[1]*x[2]*x[3] + x[1]*x[2]*x[4]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[2] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[2]*x[3] + fx[i]*x[1]*x[3] + fx[i]*x[1]*x[2])/k;
			d[i] = (-x[1]*x[2]*x[3]*fx[i])/k;
			break;
			
		case 1:
			k = x[1]*x[1]*x[1]*x[1] - x[1]*x[1]*x[1]*x[4] - x[1]*x[1]*x[1]*x[3] + x[1]*x[1]*x[3]*x[4] - x[1]*x[1]*x[1]*x[2] + x[1]*x[1]*x[2]*x[4] + x[1]*x[1]*x[2]*x[3] - x[1]*x[2]*x[4]*x[3] - x[1]*x[1]*x[1]*x[0] + x[1]*x[1]*x[0]*x[4] + x[1]*x[1]*x[0]*x[3] - x[1]*x[0]*x[4]*x[3] + x[1]*x[1]*x[0]*x[2] - x[1]*x[0]*x[2]*x[4] - x[1]*x[0]*x[2]*x[3] + x[0]*x[2]*x[4]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[0] - fx[i]*x[2] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[2]*x[3] + fx[i]*x[0]*x[3] + fx[i]*x[0]*x[2])/k;
			d[i] = (-x[0]*x[2]*x[3]*fx[i])/k;
			break;
			
		case 2:
			k = x[2]*x[2]*x[2]*x[2] - x[2]*x[2]*x[2]*x[4] - x[2]*x[2]*x[2]*x[3] + x[2]*x[2]*x[3]*x[4] - x[2]*x[2]*x[2]*x[0] + x[2]*x[2]*x[0]*x[4] + x[2]*x[2]*x[0]*x[3] - x[2]*x[0]*x[4]*x[3] - x[2]*x[2]*x[2]*x[1] + x[2]*x[2]*x[1]*x[4] + x[2]*x[2]*x[1]*x[3] - x[2]*x[1]*x[4]*x[3] + x[2]*x[2]*x[1]*x[0] - x[2]*x[1]*x[0]*x[4] - x[2]*x[1]*x[0]*x[3] + x[1]*x[0]*x[4]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[0] - fx[i]*x[3])/k;
			c[i] = (fx[i]*x[0]*x[3] + fx[i]*x[1]*x[3] + fx[i]*x[1]*x[0])/k;
			d[i] = (-x[1]*x[0]*x[3]*fx[i])/k;
			break;
			
		case 3:
			k = x[0]*x[0]*x[0]*x[0] - x[0]*x[0]*x[0]*x[4] - x[0]*x[0]*x[0]*x[3] + x[0]*x[0]*x[3]*x[4] - x[0]*x[0]*x[0]*x[2] + x[0]*x[0]*x[2]*x[4] + x[0]*x[0]*x[2]*x[3] - x[0]*x[2]*x[4]*x[3] - x[0]*x[0]*x[0]*x[1] + x[0]*x[0]*x[1]*x[4] + x[0]*x[0]*x[1]*x[3] - x[0]*x[1]*x[4]*x[3] + x[0]*x[0]*x[1]*x[2] - x[0]*x[1]*x[2]*x[4] - x[0]*x[1]*x[2]*x[3] + x[1]*x[2]*x[4]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[2] - fx[i]*x[0])/k;
			c[i] = (fx[i]*x[2]*x[0] + fx[i]*x[1]*x[0] + fx[i]*x[1]*x[2])/k;
			d[i] = (-x[1]*x[2]*x[0]*fx[i])/k;
			break;
			
		case 4:
			k = x[0]*x[0]*x[0]*x[0] - x[0]*x[0]*x[0]*x[4] - x[0]*x[0]*x[0]*x[3] + x[0]*x[0]*x[3]*x[4] - x[0]*x[0]*x[0]*x[2] + x[0]*x[0]*x[2]*x[4] + x[0]*x[0]*x[2]*x[3] - x[0]*x[2]*x[4]*x[3] - x[0]*x[0]*x[0]*x[1] + x[0]*x[0]*x[1]*x[4] + x[0]*x[0]*x[1]*x[3] - x[0]*x[1]*x[4]*x[3] + x[0]*x[0]*x[1]*x[2] - x[0]*x[1]*x[2]*x[4] - x[0]*x[1]*x[2]*x[3] + x[1]*x[2]*x[4]*x[3];
			a[i] = fx[i]/k;
			b[i] = (-fx[i]*x[1] - fx[i]*x[2] - fx[i]*x[0])/k;
			c[i] = (fx[i]*x[2]*x[0] + fx[i]*x[1]*x[0] + fx[i]*x[1]*x[2])/k;
			d[i] = (-x[1]*x[2]*x[0]*fx[i])/k;
			break;
	}
}

double f3(double X)
{
	return X*X*A + X*B + C;
}

double f4(double X)
{
	return X*X*X*A + X*X*B + X*C + D;
}

double f5(double X)
{
	return X*X*X*X*A + X*X*X*B + X*X*C + X*D + E;
}
