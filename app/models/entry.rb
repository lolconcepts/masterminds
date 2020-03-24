class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :reason
  has_one_attached :evidence
end
