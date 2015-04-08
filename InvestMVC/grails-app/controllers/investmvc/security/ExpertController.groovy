package investmvc.security


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ExpertController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ExpertController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expert.list(params), model:[expertInstanceCount: Expert.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expert.list(params), model:[expertInstanceCount: Expert.count()]
    }

    def show(Expert expertInstance) {
        respond expertInstance
    }

    def create() {
        respond new Expert(params)
    }

    @Transactional
    def save(Expert expertInstance) {
        if (expertInstance == null) {
            notFound()
            return
        }

        if (expertInstance.hasErrors()) {
            respond expertInstance.errors, view:'create'
            return
        }

        expertInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expertInstance.label', default: 'Expert'), expertInstance.id])
                redirect expertInstance
                def relacao = new UserExpert(user: springSecurityService.getCurrentUser() ,expert: expertInstance)
                relacao.save()
            }
            '*' { respond expertInstance, [status: CREATED] }
        }
    }

    def edit(Expert expertInstance) {
        respond expertInstance
    }

    @Transactional
    def update(Expert expertInstance) {
        if (expertInstance == null) {
            notFound()
            return
        }

        if (expertInstance.hasErrors()) {
            respond expertInstance.errors, view:'edit'
            return
        }

        expertInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Expert.label', default: 'Expert'), expertInstance.id])
                redirect expertInstance
            }
            '*'{ respond expertInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Expert expertInstance) {

        if (expertInstance == null) {
            notFound()
            return
        }

        expertInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Expert.label', default: 'Expert'), expertInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expertInstance.label', default: 'Expert'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def ativarExpert(Expert expertInstance){

        def arquivo ="criterioEntrada.txt"
        File limpaArquivo = new File(arquivo)
        File gravaArquivo = new File(arquivo)

        flash.message = "Expert "+expertInstance.name.toString()+" actived!"
                redirect action:"index"

        limpaArquivo.write("")
        gravaArquivo.append(expertInstance.getName())
        gravaArquivo.append("\n")
        gravaArquivo.append(expertInstance.getChartType())
        gravaArquivo.append("\n")
        gravaArquivo.append(expertInstance.getNumberOfCandles())
        gravaArquivo.append("\n")
        gravaArquivo.append(expertInstance.getMathematicalMethods())
        gravaArquivo.append("\n")
     
    }
}
