import investmvc.security.*

class BootStrap {

    def init = { servletContext ->
    	def roleAdmin = new Role(authority: "ROLE_ADMIN") 
        roleAdmin.save()

        def adminUser = new User (username:"admin@com", password:"admin",enabled:true,accountExpired:false,accountLocked:false,passwordExpired:false)
        adminUser.save()

        UserRole.create(adminUser, roleAdmin, true)
    }

    def destroy = {
    }
}
