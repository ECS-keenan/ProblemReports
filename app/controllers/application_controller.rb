class ApplicationController < ActionController::Base
	include LoggedInHelperHelper
    before_filter CASClient::Frameworks::Rails::Filter
  	protect_from_forgery

    def authenticate
      if(!auth_user?)
        respond_to do |format|
          format.html { redirect_to '/'}
        end
      end
    end

    def authenticateAdmin
      if(!admin?)
        respond_to do |format|
          format.html { redirect_to '/'}
        end
      end
    end

    
  	layout :selected_layout

  	private 
  		def selected_layout
  			if(admin?)
  				"admin_layout"
  			elsif(auth_user?)
  				"user_layout"
  			else
  				"unauth_layout"
  			end
  		end
end
