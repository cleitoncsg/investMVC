package comportamentosComuns;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public abstract class LeituraArquivo{
	static String correlacao;
	static String tendencia;
	

	private static Scanner novoArquivoDeLeitura(String nomeDoArquivo) throws FileNotFoundException {
		return new Scanner(new FileReader(nomeDoArquivo));
	}
	
	public static String leituraCorrelacao() throws IOException{
		Scanner scanner = novoArquivoDeLeitura("../correlacaoResposta.txt").useDelimiter("\\||\\n");
		while (scanner.hasNext()) {
			correlacao = scanner.next();
		}
		scanner.close();
		return correlacao;
	}
	
	public static String leituraTendencia() throws IOException{
		//Aqui vou ter que chamar um programa em C, e verificar o arquivo que foi reescito
		Scanner scanner = novoArquivoDeLeitura("../tendencia.txt").useDelimiter("\\||\\n");
		while (scanner.hasNext()) {
			tendencia = scanner.next();
			System.out.println("MINHA TENDENCIA: "+tendencia);
		}
		scanner.close();
		return tendencia;
	}
	
	public static String leituraFibonacci() throws FileNotFoundException{
		String fibonacci = new String();
		Scanner scanner = novoArquivoDeLeitura("../fibonacciResposta.txt");
		
		fibonacci= scanner.next();
		
		return fibonacci;
	}
	
	public static String leituraMetodo() throws FileNotFoundException {
		String metodo = new String();		
		Scanner scanner = novoArquivoDeLeitura("../criterioEntrada.txt").useDelimiter("\\||\\n");
		
		while (scanner.hasNext()){
			metodo = scanner.next();
		}
		return metodo;
	}
	
	public static double lerAlavancaProlog(){
		double alavanca;
		Scanner scanner = null;
		
		try {
			scanner = novoArquivoDeLeitura("../prologResposta.txt").useDelimiter("\\||\\n");
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
			scanner = novoArquivoDeLeitura("../criterioEntrada.txt").useDelimiter("\\||\\n");
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
			return (long) (1.67*1000);
		}
		else if (tipoGrafico == "M5") {
			return (long) (1.67*1000*5);
		}
		else if (tipoGrafico=="H1")
			return (long) (2.78*10*7);
		else return 60000;
	}
	
}
