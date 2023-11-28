class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :operations, foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true
end
