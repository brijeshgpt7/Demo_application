require "spec_helper"
require "rails_helper"
require "factory_girl_rails"

describe MicropostsController do

    describe "GET #index" do 
        it "populates an array of micropost" do 
         micropost = FactoryGirl.build(:micropost) 
         get :index 
        # assigns(:micropost).should eq([micropost]) 
         end 
        it "renders the :index view" do 
         get :index 
         response.should render_template :index 
        end 
    end 

    describe "GET #show" do 
        it "assigns the requested contact to @micropost" do 
         micropost = FactoryGirl.create(:micropost) 
         get :show, id: micropost 
         #assigns(:micropost).should eq(micropost)
        end 
       it "renders the #show view" do
         get :show, id: FactoryGirl.create(:micropost) 
         response.should render_template :show 
        end 
    end 

    describe "GET #new" do
        it "assigns a content, user, and id to the new micropost" do
          get :new 
          response.should render_template :new
          #assigns(:micropost).phones.map{ |p| p.content,p.user,p.id }.should eq %w(content user id) 
        end 
    end 

    describe "GET #edit" do 
        it "assigns the requested contact to @micropost" do 
            micropost = FactoryGirl.create(:micropost) 
            get :show, id: micropost 
            #assigns(:micropost).should eq(micropost)
           end 
        it "renders the #edit view" do
          get :edit, id: FactoryGirl.create(:micropost) 
          response.should render_template :edit 
          end 
    end 

    describe " DELETE #destroy" do 
        it "delete a micropost to @micropost" do 
            micropost = FactoryGirl.create(:micropost) 
            get :destroy, id: micropost 
            #assigns(:micropost).should eq(micropost)
          end 
        it "renders the #index view" do
            get :index, id: FactoryGirl.create(:micropost) 
            response.should render_template :index 
          end 
    end 

    describe "POST #create" do
      context "with valid attributes" do
        it "create a  new micropost in the database" do
          expect{
             post :create, micropost: FactoryGirl.attributes_for(:micropost) 
          }.to change(Micropost,:count).by(1)
           end
        end
      context "with invalid attributes" do
        it "does not save the new micropost in the database" do
          expect{
            post :create, micropost: FactoryGirl.attributes_for(:invalid_micropost)
          }.to_not change(Micropost,:count)
        end
        it "re-renders the :new method" do
             post :create, micropost: FactoryGirl.attributes_for(:invalid_micropost)
             response.should render_template :new
        end
      end
    end

      describe 'PUT update' do 
         before :each do 
                @micropost = FactoryGirl.create(:micropost, content: 'HEY Rspec' ,user: "Brijesh", id: 55)
              end
         context "valid attributes" do 

          it "located the requested @micropost" do 
              put :update, id: @micropost, micropost: FactoryGirl.attributes_for(:micropost) 
              #assigns(:micropost).should eq(@micropost) 
          end 
          it "changes @micropost's attributes" do 
              put :update, id: @micropost, 
              micropost: FactoryGirl.attributes_for(:micropost, content: 'HEY Rspec' ,user: "Brijesh", id: 55) 
              @micropost.reload 
              @micropost.content.should eq("HEY Rspec")
              @micropost.user.should eq("Brijesh")
              @micropost.id.should eq(55) 
          end 
          # it "redirects to the updated micropost" do 
          #     put :update, id: @micropost, micropost: FactoryGirl.attributes_for(:micropost) 
          #     response.should redirect_to @micropost 
          #   end 
          end 
          context "invalid attributes" do 
            it "locates the requested @micropost" do
              put :update, id: @micropost, micropost: FactoryGirl.attributes_for(:invalid_micropost) 
              #assigns(:micropost).should eq(@micropost) 
            end 
            it "does not change @micropost's attributes" do
                put :update, id: @micropost, 
                micropost: FactoryGirl.attributes_for(:micropost, content: 'HEY Rspec' ,user: "Brijesh", id: 55) 
                @micropost.reload 
                @micropost.content.should eq("HEY Rspec")
                @micropost.user.should eq("Brijesh")
                @micropost.id.should eq(55)
            end 
          it "re-renders the edit method" do 
              put :update, id: @micropost, micropost: FactoryGirl.attributes_for(:invalid_micropost) 
              response.should render_template :edit 
            end 
          end 
        end 
        
end

