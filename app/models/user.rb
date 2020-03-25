class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :notes
  belongs_to :carrier
  def fullname
   	if self.first_name && self.last_name
   		return self.first_name + " " + self.last_name
   	else
   		return "Names Not Set"
   	end
  end

  def adminify
    self.admin = true
    self.save
  end
end
