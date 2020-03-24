class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	@entries = Entry.all.where(:user_id => current_user.id)
  end
end
