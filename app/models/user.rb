class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists

  validates_presence_of :password, on: :create
end
