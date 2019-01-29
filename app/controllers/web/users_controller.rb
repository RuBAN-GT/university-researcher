class Web::UsersController < Web::ApplicationController
  before_action :prepare_user

  before_action :owner_only!, :only => %w(edit)

  def show
    set_meta_tags :title => @user.realname
  end

  def edit
  end

  def update
    data = user_params

    if data[:password].nil? || data[:password].blank?
      result = @user.update data.except(:password, :password_confirmation, :current_password)
    else
      result = @user.update_with_password data
    end

    if result
      add_flash_message t('messages.users.success'), :success
    else
      add_flash_message t('messages.users.error'), :error
    end

    render :edit
  end

  protected

    def prepare_user
      @user = User.find params[:id]
    end

    def owner_only!
      raise ActionController::RoutingError.new('Not Found') unless current_user == @user
    end

    def user_params
      params.require(:user).permit :realname, :email, :password, :password_confirmation, :current_password
    end
end
