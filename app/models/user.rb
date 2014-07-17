class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :microposts
  validates :email, :name,:presence => true

end
