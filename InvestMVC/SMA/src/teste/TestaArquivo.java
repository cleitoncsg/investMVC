package teste;

import investidores.Controlador;

import java.io.IOException;
import comportamentosComuns.*;

public class TestaArquivo {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		
		String resposta = "fib suporte resistencia";
		String[] quebra = resposta.split(" ");
		System.out.println(quebra[0]);
		System.out.println(quebra[1]);
		System.out.println(quebra[2]);
	}

}
