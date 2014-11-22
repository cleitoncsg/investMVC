package investmvc

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ExpertController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ExpertController {
    def scaffold = Expert
}
