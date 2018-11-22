class ApplicationController < ActionController::Base
  before_action :set_user
  helper_method :current_user

  
  def current_user
    @user
  end

  protected

  def set_user
    @user = User.find_by(ip_address: request.remote_ip)

    unless @user
      @user = User.create(username: "User-#{Time.now.to_i}", ip_address: request.remote_ip)
    end
  end
end
