package investmvc.security


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * UserExpertController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UserExpertController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserExpert.list(params), model:[userExpertInstanceCount: UserExpert.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserExpert.list(params), model:[userExpertInstanceCount: UserExpert.count()]
    }

    def show(UserExpert userExpertInstance) {
        respond userExpertInstance
    }

    def create() {
        respond new UserExpert(params)
    }

    @Transactional
    def save(UserExpert userExpertInstance) {
        if (userExpertInstance == null) {
            notFound()
            return
        }

        if (userExpertInstance.hasErrors()) {
            respond userExpertInstance.errors, view:'create'
            return
        }

        userExpertInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userExpertInstance.label', default: 'UserExpert'), userExpertInstance.id])
                redirect userExpertInstance
            }
            '*' { respond userExpertInstance, [status: CREATED] }
        }
    }

    def edit(UserExpert userExpertInstance) {
        respond userExpertInstance
    }

    @Transactional
    def update(UserExpert userExpertInstance) {
        if (userExpertInstance == null) {
            notFound()
            return
        }

        if (userExpertInstance.hasErrors()) {
            respond userExpertInstance.errors, view:'edit'
            return
        }

        userExpertInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserExpert.label', default: 'UserExpert'), userExpertInstance.id])
                redirect userExpertInstance
            }
            '*'{ respond userExpertInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserExpert userExpertInstance) {

        if (userExpertInstance == null) {
            notFound()
            return
        }

        userExpertInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserExpert.label', default: 'UserExpert'), userExpertInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userExpertInstance.label', default: 'UserExpert'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
