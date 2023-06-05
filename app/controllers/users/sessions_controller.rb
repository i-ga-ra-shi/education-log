class Users::SessionsController < Devise::SessionsController
    def after_sign_in_path_for(resource)
      # ログイン後に遷移するページのパスを返します
      subjects_path
    end
  end
  