package comportamentosComuns;

import java.io.FileNotFoundException;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.TickerBehaviour;
import jade.domain.DFService;
import jade.domain.FIPAException;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import jade.lang.acl.ACLMessage;

public class ProcurarCotacoes extends TickerBehaviour {

	public static String metodoUsado = new String();

	public ProcurarCotacoes(Agent a, long period) throws FileNotFoundException {
		super(a, period);
		metodoUsado = LeituraArquivo.leituraMetodo();
	}

	private static final long serialVersionUID = -8819431658328564461L;

	private AID[] metodoNumerico;

	@Override
	public void onTick() {
		procuraMetodosNoDF();
		mandarMensagens();
	}

	public void procuraMetodosNoDF() {
		DFAgentDescription template = new DFAgentDescription();
		ServiceDescription service = new ServiceDescription();
		// service.setName(metodoUsado);
		service.setType("MetodoNumerico");
		template.addServices(service);
		try {
			DFAgentDescription[] metodosAchados = DFService.search(myAgent,
					template);
			metodoNumerico = new AID[metodosAchados.length];
			for (int i = 0; i < metodosAchados.length; i++) {
				metodoNumerico[i] = metodosAchados[i].getName();
			}
		} catch (FIPAException erro) {
			erro.printStackTrace();
		}
	}

	private void mandarMensagens() {
		ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
		for (int i = 0; i < metodoNumerico.length; i++) {

			msg.addReceiver(metodoNumerico[i]);
			msg.setContent("Pedido de informação");
			myAgent.send(msg);
		}
	}

}