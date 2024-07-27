class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings #as the interpreter
  has_many :jobs, dependent: :destroy
  has_many :bookings_as_owner, through: :jobs, source: :bookings #as the user/owner
end
