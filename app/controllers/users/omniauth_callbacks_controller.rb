class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def self.provides_callback_for(provider)
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
          set_flash_message(:notice, :success, :kind => "#{provider}") if is_navigational_format?
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end
  [:google_oauth2, :facebook].each do |provider|
    provides_callback_for provider
  end
  #def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
  #    @user = User.from_omniauth(request.env["omniauth.auth"])

  #    if @user.persisted?
  #      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #      sign_in_and_redirect @user, :event => :authentication
  #    else
  #      session["devise.google_data"] = request.env["omniauth.auth"]
  #      redirect_to new_user_registration_url
  #    end
  #end
  def failure
    redirect_to root_path
  end
end