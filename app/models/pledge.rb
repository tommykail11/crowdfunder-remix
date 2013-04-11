class Pledge < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :amount, :user

  validates :user, presence: true
  validates :project, presence: true
  validates :amount, numericality: {greater_than: 0}
end
