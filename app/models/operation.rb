class Operation < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  has_many :groups, through: :group_operations

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author_id, presence: true
end
