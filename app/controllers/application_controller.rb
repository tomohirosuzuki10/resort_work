class ApplicationController < ActionController::Base
    def configure_permitted_parameters
    keys = %i[name sex introduction career good_place email password password_confirmation prefecture_id image ]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
    end
end
