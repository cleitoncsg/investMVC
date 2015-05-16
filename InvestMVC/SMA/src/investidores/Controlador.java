package investidores;

import comportamentosComuns.RegistrarNoDF;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class Controlador extends Agent {
	String correlacaoResposta = "";
	String fibonacciResposta = "";
	String minimosQuadradosResposta = "";

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
					correlacaoResposta = mensagemRecebida.getContent();
				}

				else if (mensagemRecebida.getSender().getLocalName()
						.equals("fibonacci")) {
					fibonacciResposta = mensagemRecebida.getContent();
				} else
					minimosQuadradosResposta = mensagemRecebida.getContent();
				

				System.out.println("Respostas do Controlador\nPearson: "
						+ correlacaoResposta + "\nFib: " + fibonacciResposta
						+ "\nMinimos: " + minimosQuadradosResposta);

			} else
				block();
		}
	}

}
