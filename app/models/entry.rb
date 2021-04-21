class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :reason
  has_one_attached :evidence

  def status
  	@message = ""
  	if self.reviewed
  		@message += "Reviewed "
  	end
  	if self.accepted
  		@message += "| Accepted"
  	end
  end
end
