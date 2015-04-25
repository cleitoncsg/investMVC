import investmvc.security.*
import investmvc.Historico

class BootStrap {

    def init = { servletContext ->
    	def roleAdmin = new Role(authority: "ROLE_ADMIN") 
        roleAdmin.save()

        def adminUser = new User (username:"admin@com", password:"admin",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
        adminUser.save()

        UserRole.create(adminUser, roleAdmin, true)

        carregaHistorico();
    }

    def destroy = {
    }

    static void carregaHistorico(){
    	double abertura, fechamento, resultado;
        String numeroUsuario, operacao, tempoAbertura, tempoFechamento;
        
        Scanner scanner = new Scanner(new File(("../MQL4/Experts/historico.txt")));
        
            while (scanner.hasNext()) {

                numeroUsuario = scanner.next();
                tempoAbertura = scanner.next();
                tempoFechamento = scanner.next();
                operacao = scanner.next();
                abertura = Double.parseDouble(scanner.next());
                fechamento = Double.parseDouble(scanner.next());                 
                resultado = Double.parseDouble(scanner.next());

                def historico = new Historico();
                historico.setNumeroUsuario(numeroUsuario)
                historico.setTempoAbertura(tempoAbertura)
                historico.setTempoFechamento(tempoFechamento)
                historico.setOperacao(operacao)
                historico.setAbertura(abertura)
                historico.setFechamento(fechamento)
                historico.setResultado(resultado)
                historico.save()
            }
    }
}
