class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   def fullname
   	if self.first_name && self.last_name
   		return self.first_name + " " + self.last_name
   	else
   		return "Names Not Set"
   	end
   end
end
