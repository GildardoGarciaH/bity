class Office < ApplicationRecord
  belongs_to :user
  has_many :employees
end
