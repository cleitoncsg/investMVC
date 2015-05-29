package metodosNumericos;

import java.io.FileNotFoundException;
import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.ProcurarCotacoes;
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
		System.out.println("Agente morto "+ this.getLocalName());
		try {
			String nome = "Consultor "+Math.random();
			AgentController agente = this.getContainerController().createNewAgent(nome, "metodosNumericos.ConsultorAgente", null);
			agente.start();
		} catch (StaleProxyException e) {
			e.printStackTrace();
		}
	}
}
