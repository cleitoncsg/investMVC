package investidores;

import java.io.IOException;

import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.NotificarTendencia;
import comportamentosComuns.RegistrarNoDF;
import comportamentosComuns.RodarComandos;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentController;
import jade.wrapper.StaleProxyException;

public class Controlador extends Agent {
	private double correlacaoResposta = 0;
	public static double fibonacciResposta = 0;
	private double coeficienteAngular = 0;
	private double coeficienteLinear = 0;
	public static double minimoQuadradosSaida=0;
	private  String[] minimosQuadradosResposta=null;
	public static double suporte=0;
	public static double resistencia=0;
	
	private static final long serialVersionUID = 4191947920949390195L;

	protected void setup() {
		addBehaviour(new RegistrarNoDF("Controlador", "controladorDeMetodos"));
		addBehaviour(new RecerberMensagem());
	}

	public class RecerberMensagem extends CyclicBehaviour {
		private static final long serialVersionUID = -2648197607106035526L;

		@Override
		public void action() {
			ACLMessage mensagemRecebida = myAgent.receive();
			
			if(mensagemRecebida.equals("-nan")){
				block();
			}
			if (mensagemRecebida != null) {
				if (mensagemRecebida.getSender().getLocalName()
						.equals("correlacao")) {
					correlacaoResposta = Double.parseDouble(mensagemRecebida.getContent());
				}

				else if (mensagemRecebida.getSender().getLocalName()
						.equals("fibonacci")) {
					String[] quebraResposta = mensagemRecebida.getContent().split(" ");
					fibonacciResposta = Double.parseDouble(quebraResposta[0]);
					suporte = Double.parseDouble(quebraResposta[1]);
					resistencia = Double.parseDouble(quebraResposta[2]);
				} else{
					minimosQuadradosResposta = mensagemRecebida.getContent().split(",");
					coeficienteLinear = Double.parseDouble(minimosQuadradosResposta[0]);
					coeficienteAngular = Double.parseDouble(minimosQuadradosResposta[1]);
				}

				System.out.println("Respostas do Controlador\nPearson: "
						+ correlacaoResposta + "\nFib: " + fibonacciResposta
						+ "\nMinimos Quadrados: " + coeficienteLinear+ " + "+coeficienteAngular+"Suporte: "+suporte
						+"Resistência: "+resistencia+"\n\n");
				
				addBehaviour(new AnaliseDosMetodos());

			}			
			else
				block();
		}
	}
	
	public class AnaliseDosMetodos extends OneShotBehaviour{
		private static final long serialVersionUID = 459178688756475297L;

		@Override
		public void action() {
			
			if(correlacaoResposta==0){
				oportunidadeDeNegocio();
			}
			
			else if (correlacaoResposta > 0.9){
				oportunidadeDeNegocio();
			}
			
			else{
				minimoQuadradosSaida = coeficienteLinear + (coeficienteAngular * suporte);
				String comando = "NOTHING"+" "+0.1+" "+fibonacciResposta + " "
						+ minimoQuadradosSaida + " "+ resistencia+"\n\n";
				
				try {
					RodarComandos.rodarComandoNoTerminal("bash escreveArquivo.sh "+comando);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	public void oportunidadeDeNegocio(){
		if((coeficienteAngular!=0) && (coeficienteLinear!=0))
			minimoQuadradosSaida = coeficienteLinear + (coeficienteAngular * suporte);
		
		addBehaviour(new NotificarTendencia());
	}
	
	protected void takeDown(){
		System.out.println("Agente morto "+ this.getLocalName());
		try {
			String nome = "Controlador "+Math.random();
			AgentController agente = this.getContainerController().createNewAgent(nome, "agenteQ.AgenteQ", null);
			agente.start();
		} catch (StaleProxyException e) {
			e.printStackTrace();
		}
	}

}
