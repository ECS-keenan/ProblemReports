module LoggedInHelperHelper
	ECS_LOGIN_KEY = :cas_user

	def current_user=(user)
		@current_user = user;
	end

	def current_user
		@current_user ||= User.find_by_ecs_id(session[ECS_LOGIN_KEY])
	end

	def auth_user?
		!self.current_user.nil?
	end

	def admin?
		if(self.current_user.nil?)
			false
		else
			self.current_user.position.admin_permisions
		end
	end
end
