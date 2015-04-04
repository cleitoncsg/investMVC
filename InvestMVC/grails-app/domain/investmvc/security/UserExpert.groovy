package investmvc.security

class UserExpert {

	User user
	Expert expert

	static	constraints = {
    }

    static UserRole create(User user, Expert expert, boolean flush = false) {
		def instance = new UserExpert(user: user, expert: expert)
		instance.save(flush: flush, insert: true)
		instance
	}
}
