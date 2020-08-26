class ApplicationController < ActionController::Base
before_action :before_search
  def before_search
    @q = Eatery.ransack(params[:q])
    @eateries = @q.result
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      "/admin/#{current_admin.id}" #決済画面へ
    when User
      "/users/#{current_user.id}" #決済画面へ
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin, :admin, :admins
      new_admin_session_path
    when User, :user, :users
      new_user_session_path
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
