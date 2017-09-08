class User < ApplicationRecord
  has_many :chats, :class_name => "Chat", :foreign_key => "user_1_id", dependent: :destroy
  has_many :secondary_chows, :class_name => "Chat", :foreign_key => "user_2_id", dependent: :destroy
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id", dependent: :destroy
  has_many :secondary_messages, :class_name => "Message", :foreign_key => "recipient_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
