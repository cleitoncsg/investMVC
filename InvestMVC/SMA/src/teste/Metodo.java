package teste;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

import comportamentosComuns.LeituraArquivo;

public class Metodo {

	public static String string = new String();
	public static void main(String[] args) {
		string = LeituraArquivo.leituraMetodo();
		System.out.println(string);
	}
}
