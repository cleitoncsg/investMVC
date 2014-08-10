//+------------------------------------------------------------------+
//|                                               Simpson            |
//|                         Copyright © 2012, Cleiton da Silva Gomes |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

double f(double x)
{
	return pow(M_E, x);
}

double fIIII(double x)
{
	return pow(M_E, x);
}

double simpson(double, double, int);
double erro(double a, double b, int n, double x);

int main()
{
	int n, opcao;
	double a, b;
	
	printf("Entre com a: ");
	scanf("%lf",&a);
	printf("Entre com b: ");
	scanf("%lf",&b);
	
	do
	{
		
		printf("                       Metodo De Integracao de Simpson\n");
		printf("\n\n\n\t(1)..........................Calcular com n intervalos\n");
		printf("\t(2)..........................Entrar Com Novos Valores de a e b\n");
		printf("\t(0)..........................Sair\n");
		printf("\nOpcao Desejada: ");
		scanf("%d",&opcao);
			
		switch (opcao)
		{
			case 1:
				do
				{
					printf("\nEntre com n: ");
					scanf("%d",&n);
					
					if(n%2)
					{
						printf("N deve Ser Par!!!\n");
					}	
					
					
				} while(n%2);
				
					
				printf("Resultado %lf\n",simpson(a,b,n));
				printf("Erro Cometido: %lf\n",erro(a, b, n, simpson(a,b,n)));
				
				break;
			
			case 2:
				main();
				break;
				
			case 0:
				exit(0);
				break;
		}
		
	} while(opcao);
	
	
	return 0;
}

double simpson(double a, double b, int n)
{
	double *X, resultado, deslocamento, h;
	int i;
	
	deslocamento = (b - a)/n;
	h = deslocamento;
	
	X = (double *)calloc(n+1, sizeof(double));
	resultado = 0;
	
	X[0] = a;
	
	for(i=1; i<=n; i++)
	{
		X[i] += X[i-1] + deslocamento;
	}
	
	resultado += f(a) + f(b);	
	
	for(i=1; i<n; i++)
	{
		if(i%2)
		{
			resultado += 4*f(X[i]);
		}
		else
		{
			resultado += 2*f(X[i]);
		}
	}
	
	resultado *= (h/3);
	
	return resultado;
}

double erro(double a, double b, int n, double x)
{
	return (pow(((b-a)/n),4)/180) * sqrt(pow((b-a)*fIIII(x),2));
}
