package comportamentosComuns;

import java.io.FileNotFoundException;
import java.util.ArrayList;

import metodosNumericos.FibonacciAgente;

import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class EnviarFibonacci extends CyclicBehaviour {

	private static final long serialVersionUID = 1911196806706828656L;
	private ACLMessage resposta;
	
	
	@Override
	public void action() {
		ArrayList<String> fibonacci = new ArrayList<String>();
		try {
			fibonacci = LeituraArquivo.leituraFibonacci();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		ACLMessage msg = myAgent.receive();
		if(msg !=null){
			resposta= msg.createReply();
			System.out.println("O agente "+msg.getSender().getName() + "está se comunicando");
			String conteudo = msg.getContent();
			
			if(conteudo.equalsIgnoreCase("Pedido de informação")){
				
				resposta.setContent(mensagemComTresPontosDeFibonacci(fibonacci));
				myAgent.send(resposta);
			}
		}
		else block();
	}
	
	private String mensagemComTresPontosDeFibonacci(ArrayList<String> arrayFibonacci) {
		String mensagemComFibonacci = new String();
		mensagemComFibonacci = arrayFibonacci.get(0)+ ";"+arrayFibonacci.get(1)+ ";"+arrayFibonacci.get(2)+ ";";
		return mensagemComFibonacci;
	}
}
