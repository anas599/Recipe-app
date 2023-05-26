class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, length: { maximum: 30 }
  validates :password, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true
end
