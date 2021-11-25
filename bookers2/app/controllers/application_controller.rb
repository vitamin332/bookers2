class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # ログアウト後
  def after_sign_out_path_for(resource)
    root_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :name])
    # 新規登録の際、nameの情報を送ってもいいように許可する

  end
end