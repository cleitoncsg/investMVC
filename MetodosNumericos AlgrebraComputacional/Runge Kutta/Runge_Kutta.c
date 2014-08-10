//+------------------------------------------------------------------+
//|                                               Runge_Kutta        |
//|                         Copyright © 2012, Cleiton da Silva Gomes |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

double f(double x, double y)
{
	return x*x - y;
}

void Runge_Kutta_2(double, int);
void Runge_Kutta_4(double h, int n);
void interface(int opcao);

int main ()
{

	int opcao;

	do
	{
		printf("            Resolucao de Equacoes Diferenciais Pelo Metodo Range Kutta\n");
		printf("\n\n\n\t(1)..........................Range Kutta de 2 Ordem\n");
		printf("\t(2)..........................Range Kutta de 4 Ordem\n");
		printf("\t(0)..........................Sair\n");
		printf("\nOpcao Desejada: ");
		scanf("%d",&opcao);

		switch(opcao)
		{
			case 1:
				interface(opcao);
				break;
			case 2:
				interface(opcao);
				break;
			case 0:
								exit(0);
				break;
		}
	} while(opcao);

	return 0;
}

void interface(int opcao)
{
	int option,n;
	double a,b,h;

	do
	{
		printf("            Resolucao de Equacoes Diferenciais Pelo Metodo Runge Kutta\n");
		printf("\n\n\n\t(1)..........................Entrar com a, b e n\n");
		printf("\t(2)..........................Entrar com h e n\n");
		printf("\t(0)..........................Voltar\n");
		printf("\nOpcao Desejada: ");
		scanf("%d",&option);
		switch (option)
		{
			case 1:

				printf("Entre com a: ");
				scanf("%lf",&a);
				printf("Entre com b: ");
				scanf("%lf",&b);
				printf("Entre com o numero de intervalos: ");
				scanf("%d",&n);
				h = (b-a)/n;
				if(opcao == 1) Runge_Kutta_2(h,n);
				else Runge_Kutta_4(h,n);

				break;

			case 2:
				printf("Entre com h: ");
				scanf("%lf",&h);
				printf("Entre com o numero de intervalos: ");
				scanf("%d",&n);
				if(opcao == 1) Runge_Kutta_2(h,n);
				else Runge_Kutta_4(h,n);
				break;

			case 0:
				main();
				break;
		}

	} while(opcao);
}

void Runge_Kutta_2(double h, int n)
{
	double *y,*x;
	int i;

	y = (double *)calloc(n+1, sizeof(double));
	x = (double *)calloc(n+1, sizeof(double));

	printf("\nValores Iniciais:\n");

	printf("Entre com x0: ");
	scanf("%lf",&x[0]);
	printf("Entre com y(x0): ");
	scanf("%lf",&y[0]);
	printf("\nIteracoes\n");
	for(i=1; i<=n; i++)
	{
		x[i] += x[i-1]+h;
	}

	for(i=1; i<=n; i++)
	{
		y[i] = y[i-1] + (h/2) * ( f(x[i-1],y[i-1]) + f( x[i-1] + h, y[i-1] + h * f(x[i-1],y[i-1]) ) );
		printf("y(%lf) = %lf\n",x[i],y[i]);
	}

}

void Runge_Kutta_4(double h, int n)
{
	double *y,*x;
	int i;
	double k1, k2, k3, k4;

	y = (double *)calloc(n+1, sizeof(double));
	x = (double *)calloc(n+1, sizeof(double));

	printf("\nValores Iniciais:\n");

	printf("Entre com x0: ");
	scanf("%lf",&x[0]);
	printf("Entre com y(x0): ");
	scanf("%lf",&y[0]);
	printf("\nIteracoes\n");

	for(i=1; i<=n; i++)
	{
		x[i] += x[i-1]+h;
	}

	for(i=1; i<=n; i++)
	{
		k1 = h * f(x[i-1],y[i-1]);
		k2 = h*f(x[i-1] + (h/2) , y[i-1] + (k1/2));
		k3 = h*f(x[i-1] + (h/2) , y[i-1] + (k2/2));
		k4 = h*f(x[i-1] + h , y[i-1] + k3);

		y[i] = y[i-1] + (1.00/6.00)*(k1 + 2*k2 + 2*k3 + k4);

		printf("y(%lf) = %lf\n",x[i],y[i]);
	}

}

