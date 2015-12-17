class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :description, length: {minimum: 150}
end
