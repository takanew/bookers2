class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top, :about]
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
    user_path(resource)
end

def after_sign_up_path_for(resource)
    user_path(resource)
end

# ログアウト時の引数の設定に注意
def after_sign_out_path_for(resource_or_scope)
    root_path
end

protected
# 【Rails】この記事を「devise 名前 ログイン」で調べたあなたへ贈るに要件の定義の仕方書いてある
# config/initializers/devise.rbでデフォルトのemailからnameに変更したので、emailを認証のキーにするためにここで再定義を行う

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
