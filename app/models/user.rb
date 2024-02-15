class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :expenses, foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, numericality: { less_than_or_equal_to: 5000 }
end
