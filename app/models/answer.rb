class Answer < ActiveRecord::Base
  belongs_to :question
  validates :description, length: {minimum: 150}
end
