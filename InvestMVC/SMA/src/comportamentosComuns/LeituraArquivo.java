package comportamentosComuns;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;


public class LeituraArquivo{
	static String correlacao;
	static String tendencia;
	
	public static String leituraCorrelacao() throws IOException{
		Scanner scanner = new Scanner(new FileReader("../EstruturadoComponente/correlacaoResposta.txt"))
        .useDelimiter("\\||\\n");
		while (scanner.hasNext()) {
			correlacao = scanner.next();
		}
		return correlacao;
	}
	
	public static String leituraTendencia() throws IOException{
		
		Scanner scanner = new Scanner(new FileReader("../tendencia.txt"))
        .useDelimiter("\\||\\n");
		while (scanner.hasNext()) {
			tendencia = scanner.next();
		}
		return tendencia;
	}
	
	public static ArrayList<String> leituraFibonacci() throws FileNotFoundException{
		ArrayList<String> fibonacci = new ArrayList<String>();
		Scanner scanner = new Scanner(new FileReader("../EstruturadoComponente/FibonacciResposta.txt"));
		
		fibonacci.add(scanner.next());
		fibonacci.add(scanner.next());
		fibonacci.add(scanner.next());
		
		return fibonacci;
	}
	
	public static String leituraMetodo() throws FileNotFoundException {
		String metodo = new String();		
		Scanner scanner = new Scanner(new FileReader("../criterioEntrada.txt")).useDelimiter("\\||\\n");
		
		while (scanner.hasNext()){
			metodo = scanner.next();
		}
		return metodo;
	}
	
	public static double lerAlavancaProlog(){
		double alavanca;
		Scanner scanner = null;
		
		try {
			scanner = new Scanner(new FileReader("../prologResposta.txt")).useDelimiter("\\||\\n");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		alavanca = Double.parseDouble(scanner.next());
		return alavanca;
	}
	
	public static long lerTipoGrafico() {
		long tempoEmMiliSegundos=0;
		String tipoGrafico = new String();
		Scanner scanner;
		try {
			scanner = new Scanner(new FileReader("../criterioEntrada.txt")).useDelimiter("\\||\\n");
			scanner.nextLine();
			tipoGrafico = scanner.nextLine();
			tempoEmMiliSegundos = converteTipoGraficoEmTempo(tipoGrafico);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return tempoEmMiliSegundos;
	}
	
	private static long converteTipoGraficoEmTempo(String tipoGrafico) {
		
		if(tipoGrafico == "M1"){
			return 60000;
		}
		else if (tipoGrafico == "M5") {
			return 60000*5;
		}
		else return 60000*60;
	}
	
}
