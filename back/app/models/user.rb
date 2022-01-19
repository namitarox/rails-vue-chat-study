# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :messages
  has_many :likes

  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
