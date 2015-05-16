package metodosNumericos;

import comportamentosComuns.EnviarCorrelacao;
import comportamentosComuns.RegistrarNoDF;

import jade.core.*;
import jade.domain.DFService;
import jade.domain.FIPAException;

public class CorrelacaoAgente extends Agent{

	private static final long serialVersionUID = -7919542083794177881L;
	
	protected void setup(){
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Correlacao"));
		addBehaviour(new EnviarCorrelacao());
	}
	
	//Remove o registro do agente da página amarela quando sua execução é finalizada
	protected void takeDown(){
		
		try {
			DFService.deregister(this);
			System.out.println("Agente "+getAID().getName()+"está finalizado!");
		} catch (FIPAException erro) {
			erro.printStackTrace();
		}	
	}

}