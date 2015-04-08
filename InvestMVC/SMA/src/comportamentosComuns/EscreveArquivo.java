package comportamentosComuns;

import java.io.FileWriter;
import java.io.IOException;

public class EscreveArquivo {
	
	public static void escreveDecisao(String decisao, double alavanca) throws IOException{
		FileWriter arquivo = new FileWriter("../../MQL4/Files/decisaoFinal.txt");
		
		arquivo.write(decisao);
		arquivo.append("\n");
		arquivo.append(String.valueOf(alavanca));
		
		arquivo.close();
	}
}