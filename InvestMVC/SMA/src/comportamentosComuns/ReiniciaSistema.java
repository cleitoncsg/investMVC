package comportamentosComuns;

import java.io.IOException;

import jade.core.Agent;
import jade.wrapper.StaleProxyException;

public abstract class ReiniciaSistema {
	
	public static void main(String[] args) {
		try {
			RodarComandos.rodarComandoNoTerminal("bash SMA.sh");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void reiniciaSMA(Agent a) throws StaleProxyException, IOException{
		a.getContainerController().kill();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//RodarComandos.rodarComandoNoTerminal("bash SMA.sh");
	}
	
	public static void compilaArquivoC() throws IOException{
		RodarComandos.rodarComandoNoTerminal("bash compilaC.sh");
	}
}
