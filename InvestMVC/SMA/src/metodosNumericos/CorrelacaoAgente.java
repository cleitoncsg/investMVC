package metodosNumericos;

import java.io.IOException;

import comportamentosComuns.EnviarCorrelacao;
import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.RegistrarNoDF;

import jade.core.*;
import jade.domain.DFService;
import jade.domain.FIPAException;

public class CorrelacaoAgente extends Agent{

	private static final long serialVersionUID = -7919542083794177881L;
	private double correlacaoLinear;
	
	protected void setup(){
		
		try {
			correlacaoLinear = Double.parseDouble(LeituraArquivo.leituraCorrelacao());
		} catch (NumberFormatException erro) {
			erro.printStackTrace();
		} catch (IOException erro) {
			erro.printStackTrace();
		}
		
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "Correlacao"));
		addBehaviour(new EnviarCorrelacao(correlacaoLinear));
	}
	
	//Remove o registro do agente da página amarela quando sua execução é finalizada
	protected void takeDown(){
		
		try {
			DFService.deregister(this);
			System.out.println("Agente analisador+"+getAID().getName()+"está finalizado!");
		} catch (FIPAException erro) {
			erro.printStackTrace();
		}	
	}

}