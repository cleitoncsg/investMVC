package comportamentosComuns;

import investidores.Controlador;

import java.io.FileWriter;
import java.io.IOException;

public abstract class EscreveArquivo {
	
	public static void escreveDecisao(String decisao, double alavanca) throws IOException{
		FileWriter arquivo = new FileWriter("../../MQL4/Files/decisaoFinal.txt");
		
		arquivo.write(decisao);
		arquivo.append("\n");
		arquivo.append(String.valueOf(alavanca));
		arquivo.append("\n");
		arquivo.append(String.valueOf(Controlador.fibonacciResposta));
		arquivo.append("\n");
		arquivo.append(String.valueOf(Controlador.minimoQuadradosSaida));
		
		arquivo.close();
	}
}