package execucao;

import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.core.event.AgentEvent;
import jade.wrapper.AgentContainer;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;

import java.io.IOException;

import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.RodarComandos;

public class Teste {
	
	private static AgentContainer containerExecucao;
	private static AgentController main;
	
	public static void main(String[] args) throws IOException {
		System.out.println("Criando Container");
		Runtime rt = Runtime.instance();
		ProfileImpl p = new ProfileImpl(true);
		containerExecucao = rt.createAgentContainer(p);
		
		try {
			main = containerExecucao.createNewAgent("main", "execucao.Main", null);
			main.start();
		} catch (StaleProxyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
