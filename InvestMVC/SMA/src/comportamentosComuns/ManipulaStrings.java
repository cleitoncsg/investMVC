package comportamentosComuns;

import java.io.FileNotFoundException;

public abstract class ManipulaStrings {
	static String metodoNumericoEscolhido;
	
	
	public static String[] metodosUsados() throws FileNotFoundException{
		metodoNumericoEscolhido = LeituraArquivo.leituraMetodo();
		
		metodoNumericoEscolhido = metodoNumericoEscolhido.substring(1, metodoNumericoEscolhido.length()-1);
		String[] metodos = metodoNumericoEscolhido.split(", ");
		
//		for (int i = 0; i < metodos.length; i++) {
//			System.out.println(metodos[i]);
//		}		
//		
		return metodos;
	}
}
