class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: { message: "Title can't be blank" }
  validates :body, presence: { message: "Body can't be blank" }, length: { maximum: 200 }
  
end
