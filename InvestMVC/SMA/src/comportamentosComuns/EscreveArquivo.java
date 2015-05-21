package comportamentosComuns;

import investidores.Controlador;
import java.io.IOException;

public abstract class EscreveArquivo {

	public static void escreveDecisao(String decisao, double alavanca)
			throws IOException {
		
		String comando = decisao+" "+alavanca+" "+Controlador.fibonacciResposta + " "
				+ Controlador.minimoQuadradosSaida + " "
				+ Controlador.resistencia;
		
		RodarComandos.rodarComandoNoTerminal("bash escreveArquivo.sh "+comando);

	}
}