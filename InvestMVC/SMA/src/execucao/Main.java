package execucao;

import java.io.FileNotFoundException;
import java.io.IOException;

import comportamentosComuns.ManipulaStrings;
import comportamentosComuns.ReiniciaSistema;
import jade.core.Agent;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.core.behaviours.OneShotBehaviour;
import jade.wrapper.AgentContainer;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;


public class Main extends Agent {
	private static final long serialVersionUID = 3206847208968227199L;
	private static String[] metodoNumericoEscolhido;
	
	private AgentContainer metodos;
	
	
	protected void setup() {
		System.out.println("Iniciando a execução");
		try {
			ReiniciaSistema.compilaArquivoC();
		} catch (IOException e) {
			e.printStackTrace();
		}
		metodos = getContainerController();
		addBehaviour(new CriandoAgentes());
	}
	
//	public class CriandoContainers extends OneShotBehaviour{
//
//		private static final long serialVersionUID = -7764417346591307311L;
//
//		@Override
//		public void action() {
//			System.out.println("Criando Container");
//			Runtime rt = Runtime.instance();
//			ProfileImpl p = new ProfileImpl(true);
//			metodos = rt.createAgentContainer(p);
//		}
//	}
	
	public class CriandoAgentes extends OneShotBehaviour{
		private static final long serialVersionUID = -7774814918503262919L;

		@Override
		public void action() {
			
			try {
				metodoNumericoEscolhido = ManipulaStrings.metodosUsados();
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			}
			try {				
				criaAgenteMetodoNumerico();
				
				AgentController controlador = metodos.createNewAgent("controladorDeMetodos", "investidores.Controlador", null);
				controlador.start();
				
				AgentController tendencia = metodos.createNewAgent("tendencia", "investidores.Tendencia", null);
				tendencia.start();
				
				AgentController vendendor = metodos.createNewAgent("vendendor", "investidores.Vendendor", null);
				vendendor.start();
				
				AgentController comprador = metodos.createNewAgent("comprador", "investidores.Comprador", null);
				comprador.start();
				
				AgentController consultor = metodos.createNewAgent("consultor", "metodosNumericos.ConsultorAgente", null);
				consultor.start();
				
			} catch (StaleProxyException e) {
				e.printStackTrace();
			}
		}		
	}
	
	private void criaAgenteMetodoNumerico() throws StaleProxyException{
		for (int i = 0; i < metodoNumericoEscolhido.length; i++) {
			if(metodoNumericoEscolhido[i].equals("Correlacao"))
				criaAgenteCorrelacao();
			else if(metodoNumericoEscolhido[i].equals("Fibonacci"))
				criaAgenteFibonacci();
			else if (metodoNumericoEscolhido[i].equals("Mímimos Quadrados"))
				criaAgenteMinimosQuadrados();
		}
	}

	private void criaAgenteFibonacci() throws StaleProxyException {
		AgentController fibonacci = metodos.createNewAgent("fibonacci", "metodosNumericos.FibonacciAgente", null);
		fibonacci.start();
	}

	private void criaAgenteCorrelacao() throws StaleProxyException {
		AgentController correlacao = metodos.createNewAgent("correlacao", "metodosNumericos.CorrelacaoAgente", null);
		correlacao.start();	
	}
	
	private void criaAgenteMinimosQuadrados() throws StaleProxyException{
		AgentController minimosQuadrados = metodos.createNewAgent("minimosQuadrados", "metodosNumericos.MinimosQuadradosAgente", null);
		minimosQuadrados.start();
	}
	
	
	@Override
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
