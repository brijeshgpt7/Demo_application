require 'faker'

FactoryGirl.define do 
		factory :user do |f|
		 
		f.email { Faker::Internet.email }
		f.name { Faker::Name.name }
		
		end
		factory :invalid_user, parent: :user do |f|
		f.email nil
		f.name nil
	    end
 end 