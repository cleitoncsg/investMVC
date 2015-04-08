package comportamentosComuns;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RodarComandos {
	
	public static void rodarComandoNoTerminal(String comando) throws IOException{
		Runtime.getRuntime().exec(comando); 
	}
	
	//Atenção!! Código copiado da internet, com ele posso ver as saídas printadas no terminal
	
	 public static void terminal(String comando) {
		 
	        String s = null;
	 
	        try {
	             
	        // run the Unix "ps -ef" command
	            // using the Runtime exec method:
	            Process p = Runtime.getRuntime().exec(comando);
	             
	            BufferedReader stdInput = new BufferedReader(new
	                 InputStreamReader(p.getInputStream()));
	 
	            BufferedReader stdError = new BufferedReader(new
	                 InputStreamReader(p.getErrorStream()));
	 
	            // read the output from the command
	            System.out.println("Here is the standard output of the command:\n");
	            while ((s = stdInput.readLine()) != null) {
	                System.out.println(s);
	            }
	             
	            // read any errors from the attempted command
	            System.out.println("Here is the standard error of the command (if any):\n");
	            while ((s = stdError.readLine()) != null) {
	                System.out.println(s);
	            }
	             
	            System.exit(0);
	        }
	        catch (IOException e) {
	            System.out.println("exception happened - here's what I know: ");
	            e.printStackTrace();
	            System.exit(-1);
	        }
	    }
}
