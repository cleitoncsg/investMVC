package comportamentos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class EscreveArquivo {

	public static void escreveCompra(){
		try {
			BufferedWriter saida = new BufferedWriter(new FileWriter("../respostaMultiagente.txt"));
			saida.write("1");
			saida.close();
			} catch (IOException e) {
				e.toString();
			}
	}
	
	public static void escreveVenda(){
		try {
			BufferedWriter saida = new BufferedWriter(new FileWriter("../respostaMultiagente.txt"));
			saida.write("0");
			saida.close();
			} catch (IOException e) {
				e.toString();
			}
	}
	
	public static void escreveNenhumaAcao(){
		try {
			BufferedWriter saida = new BufferedWriter(new FileWriter("../respostaMultiagente.txt"));
			saida.write("-1");
			saida.close();
			} catch (IOException e) {
				e.toString();
			}
	}
}
