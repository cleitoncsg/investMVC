package teste;
import java.io.IOException;
import java.util.ArrayList;

import comportamentosComuns.*;
public class TestaArquivo {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		ArrayList<String> array = LeituraArquivo.leituraFibonacci();
		
		System.out.println(array.get(0) + ";"+array.get(1) + ";"+array.get(2) + ";");
		
		
	}

}
