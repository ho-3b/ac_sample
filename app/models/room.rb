class Room < ApplicationRecord

  has_many :chat_members, dependent: :destroy
  has_many :users, through: :chat_members

  has_many :messages

end
