class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	@teacher = User.first.first_name || ""
  	@entries = Entry.all.where(:user_id => current_user.id)
  end
end
