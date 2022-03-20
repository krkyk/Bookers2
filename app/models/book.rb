class Book < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence:true
  validates :body,length:{maximum:200}


end
