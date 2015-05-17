package investidores;

import comportamentosComuns.LeituraArquivo;
import comportamentosComuns.NotificarTendencia;
import comportamentosComuns.RegistrarNoDF;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;

public class Controlador extends Agent {
	private double correlacaoResposta = 0;
	public static double fibonacciResposta = 0;
	private double coeficienteAngular = 0;
	private double coeficienteLinear = 0;
	public static double minimoQuadradosSaida=0;
	private  String[] minimosQuadradosResposta=null;
	
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
			if (mensagemRecebida != null) {
				if (mensagemRecebida.getSender().getLocalName()
						.equals("correlacao")) {
					correlacaoResposta = Double.parseDouble(mensagemRecebida.getContent());
				}

				else if (mensagemRecebida.getSender().getLocalName()
						.equals("fibonacci")) {
					fibonacciResposta = Double.parseDouble(mensagemRecebida.getContent());
				} else{
					minimosQuadradosResposta = mensagemRecebida.getContent().split(",");
					coeficienteLinear = Double.parseDouble(minimosQuadradosResposta[0]);
					coeficienteAngular = Double.parseDouble(minimosQuadradosResposta[1]);
				}

				System.out.println("Respostas do Controlador\nPearson: "
						+ correlacaoResposta + "\nFib: " + fibonacciResposta
						+ "\nMinimos Quadrados: " + coeficienteLinear+ " + "+coeficienteAngular);
				
				addBehaviour(new AnaliseDosMetodos());

			} else
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
			
			else block();
		}
		
	}
	
	public void oportunidadeDeNegocio(){
		if((coeficienteAngular!=0) && (coeficienteLinear!=0))
			minimoQuadradosSaida = coeficienteLinear + (coeficienteAngular * LeituraArquivo.lerSuporte());
		
		addBehaviour(new NotificarTendencia());
	}

}
