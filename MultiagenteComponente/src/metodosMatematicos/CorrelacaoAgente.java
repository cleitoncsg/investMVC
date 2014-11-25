package metodosMatematicos;

import java.io.IOException;

import comportamentos.CorrelacaoLinearC;
import comportamentos.EsperarPedidos;
import comportamentos.LeituraArquivo;
import comportamentos.RegistrarNoDF;
import comportamentos.RodaComandos;

import jade.core.*;
import jade.domain.DFService;
import jade.domain.FIPAException;

public class CorrelacaoAgente extends Agent{

	private static final long serialVersionUID = -7919542083794177881L;
	
	protected void setup(){
		CorrelacaoLinearC c = new CorrelacaoLinearC(this,6000);
		addBehaviour(c);		
		addBehaviour(new RegistrarNoDF("MetodoNumerico", "CorrelacaoDePearson"));
		try {
			addBehaviour(new EsperarPedidos(LeituraArquivo.leituraCorrelacao()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Remove o registro do agente da página amarela quando sua execução é finalizada
	protected void takeDown(){
		
		try {
			DFService.deregister(this);
			System.out.println("Agente analisador+"+getAID().getName()+" está finalizado!");
		} catch (FIPAException erro) {
			erro.printStackTrace();
		}	
	}

}