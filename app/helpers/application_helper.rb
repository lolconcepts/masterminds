module ApplicationHelper
	@title = ENV["APPNAME"]

	def statusbar(current, goal)
		return "#{(current.to_f / goal.to_f) * 100}"
	end
	def sessioncount
		return Entry.where(user_id: current_user.id).count
	end
end
