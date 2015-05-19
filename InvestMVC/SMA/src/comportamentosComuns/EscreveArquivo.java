package comportamentosComuns;

import investidores.Controlador;

import java.io.FileWriter;
import java.io.IOException;

public abstract class EscreveArquivo {
	
	public static void escreveDecisao(String decisao, double alavanca) throws IOException{
		FileWriter arquivo = new FileWriter("../../MQL4/Files/decisaoFinal.txt");
		
		System.out.println("-----------------------------------------");
		System.out.println(decisao);
		System.out.println(Controlador.fibonacciResposta);
		System.out.println(Controlador.minimoQuadradosSaida);
		System.out.println(LeituraArquivo.lerResistencia());
		System.out.println("-----------------------------------------");
		
		
		arquivo.write(decisao);
		arquivo.append("\n");
		arquivo.append(String.valueOf(alavanca));
		arquivo.append("\n");
		arquivo.append(String.valueOf(Controlador.fibonacciResposta));
		arquivo.append("\n");
		arquivo.append(String.valueOf(Controlador.minimoQuadradosSaida));
		arquivo.append("\n");
		arquivo.append(String.valueOf(LeituraArquivo.lerResistencia()));
		
		arquivo.close();
	}
}