package metodosNumericos;

import java.io.FileNotFoundException;
import java.io.IOException;

import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.ProcurarCotacoes;
import comportamentosComuns.ReiniciaSistema;
import jade.core.Agent;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;

public class ConsultorAgente extends Agent{
	private static final long serialVersionUID = -1528819378039323293L;

	protected void setup(){
		System.out.println("Iniciado o agente consultor");
		try {
			addBehaviour(new ProcurarCotacoes(this,LeituraArquivo.lerTipoGrafico()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}		
	}
	
	protected void takeDown(){
		try {
			ReiniciaSistema.reiniciaSMA(this);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
