class Book < ApplicationRecord
  
  belongs_to :users,optional: true
  
  validates :title, presence: true
  validates :body, presence: true

  
end
