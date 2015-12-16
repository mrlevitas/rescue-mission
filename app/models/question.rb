class Question < ActiveRecord::Base
  has_many :answers
  validates :name, presence: true, length: {minimum: 40}
  validates :description, length: {minimum: 150}, allow_nil: true
end
