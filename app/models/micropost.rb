class Micropost < ActiveRecord::Base
  attr_accessible :content, :id, :user
  belongs_to :user_id

validates :content, :id , :presence => true
#validates :content, :uniqueness => true


end
