package metodosNumericos;

import java.io.FileNotFoundException;

import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.ProcurarCotacoes;
import jade.core.Agent;

public class ConsultorAgente extends Agent{
	private static final long serialVersionUID = -1528819378039323293L;

	protected void setup(){
		System.out.println("Iniciado o agente consultor");
		try {
			addBehaviour(new ProcurarCotacoes(this,LeituraArquivo.lerTipoGrafico()));
//			addBehaviour(new ProcurarCotacoes(this,6000));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}
}
