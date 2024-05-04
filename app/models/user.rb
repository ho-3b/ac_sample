class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :chat_members, dependent: :destroy
  has_many :rooms, through: :chat_members

  has_many :messages
end
