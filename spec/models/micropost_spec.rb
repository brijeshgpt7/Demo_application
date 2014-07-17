require "spec_helper"
require "rails_helper"
		
		 describe Micropost do
				 it "has a valid factory" do
				 FactoryGirl.create(:micropost).should be_valid
				 end
				
				 it "is invalid without a content" do
				 FactoryGirl.build(:micropost, content: nil).should_not be_valid
				 end 

				 it "is invalid without a id" do
				 FactoryGirl.build(:micropost, id: nil).should_not be_valid
				 end   
			 
		end



