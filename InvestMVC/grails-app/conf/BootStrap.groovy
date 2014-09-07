import investmvc.security.*

class BootStrap {

    def init = { servletContext ->
    	createAdmin()
    	createUser()
    }

    def destroy = {
    }

    public void createAdmin(){
    	def adminUser = new User (username:"admin",password:"admin",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
    	adminUser.save(flush:true)

    	def role = new Role (authority: 'ADMIN');
        role.save(flush:true)

    	UserRole.create(adminUser, role, true)
    }

    public void createUser(){
    	def adminUser = new User (username:"user",password:"user",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
    	adminUser.save(flush:true)

    	def role = new Role (authority: 'User');
        role.save(flush:true)

    	UserRole.create(adminUser, role, true)
    }
}
