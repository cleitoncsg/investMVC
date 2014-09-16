import investmvc.security.*

class BootStrap {

    def init = { servletContext ->
    	//createAdmin()
    	//createUser()
    }

    def destroy = {
    }
/*
    public void createAdmin(){
    	def adminUser = new User (name:"admin",lastName:"admin", email:"admin@com", password:"admin",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
    	adminUser.save(flush:true)

        println adminUser.name

    	def role = new Role (authority: 'ROLE_ADMIN');
        role.save(flush:true)

        println "Autorizacao criado"

    	UserRole.create(adminUser, role, true)
    }

    public void createUser(){
    	def adminUser = new User (username:"user",password:"user",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
    	adminUser.save(flush:true)

    	def role = new Role (authority: 'User');
        role.save(flush:true)

    	UserRole.create(adminUser, role, true)
    }*/
}
