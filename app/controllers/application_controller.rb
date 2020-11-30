class ApplicationController < ActionController::Base

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404 unless Rails.env.development?
  rescue_from ActionController::RoutingError, with: :render_404 unless Rails.env.development?
  rescue_from Exception, with: :render_500 unless Rails.env.development?

  def set_host
      Rails.application.routes.default_url_options[:host] = request.host_with_port
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

  def has_store?
    if current_user.stores.count < 1
      redirect_to new_store_path, notice: '会社情報を登録して下さい。'
      return false
    end
  end

  def set_store
    @current_store = current_user.stores.find(params[:store_id])
  end

  def current_store
    @current_store
  end

  def set_user
    @current_user = User.find_by(id: params[:id])
  end

  def current_user
    @current_user
  end


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      root_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin, :admin, :admins
      root_path
    when User, :user, :users
      root_path
    else
      super
    end
  end

  def layout_by_resource
    if devise_controller && resource_name == :admin
      "admins"
    elsif devise_controller && resource_name == :user
      "users"
    else
      "application"
    end
  end

  def layout_by_resource
    if devise_controller?
      "application"
    end
  end
end
