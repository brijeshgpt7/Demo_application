require 'faker'

FactoryGirl.define do 
		factory :micropost do |f|
		 
		f.content { Faker::Name.name }
		f.user { Faker::Name.name }
		f.id { Faker::Number.number(2)} 
		end
		factory :invalid_micropost, parent: :micropost do |f|
		f.content nil
		
	end
 end 