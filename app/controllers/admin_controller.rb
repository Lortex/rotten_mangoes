class AdminController < ApplicationController
  before_action :require_admin
  def require_admin
    unless current_user.admin
      redirect_to movies_path, notice: "#{current_user.full_name} is not an admin!"
    end
  end
  
end
