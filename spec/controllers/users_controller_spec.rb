require "rails_helper"
require "spec_helper"
require "factory_girl_rails"

describe UsersController do
 
      describe "Get#index" do
      	  it "populates an array of user" do 
           user = FactoryGirl.build(:user) 
           get :index 
           # assigns(:micropost).should eq([micropost]) 
          end 
      	  it "renders the :index view" do 
      	    get :index 
      	    response.should render_template :index 
          end 

      end 

      describe "GET #show" do 
          it "assigns the requested contact to user" do 
           user = FactoryGirl.create(:user) 
           get :show, id: user 
           #assigns(:micropost).should eq(micropost)
          end 
          it "renders the #show view" do
            get :show, id: FactoryGirl.create(:user) 
            response.should render_template :show 
          end 
      end 

      describe "GET #new" do
          it "assigns a email, name to the new user" do
            get :new 
            response.should render_template :new
            #assigns(:micropost).phones.map{ |p| p.content,p.user,p.id }.should eq %w(content user id) 
          end 
      end 

      describe "GET #edit" do 
        it "assigns the requested  to user" do 
           user = FactoryGirl.create(:user) 
            get :show, id: user 
           #assigns(:micropost).should eq(micropost)
        end 
        it "renders the #edit view" do
           get :edit, id: FactoryGirl.create(:user) 
           response.should render_template :edit 
        end 
      end 

      describe " DELETE #destroy" do 
        it "delete a micropost to user" do 
           user = FactoryGirl.create(:user) 
           get :destroy, id: user 
           #assigns(:micropost).should eq(micropost)
        end 
        it "renders the #index view" do
           get :index, id: FactoryGirl.create(:user) 
           response.should render_template :index 
        end 
      end 
        
       

      describe "POST #create" do
        context "with valid attributes" do
          it "create a  new user in the database" do
            expect{
                 post :create, user: FactoryGirl.attributes_for(:user) 
            }.to change(User,:count).by(1)
          end
          # it "redirects to the new page" do
          #      post :create, micropost: FactoryGirl.attributes_for(:micropost)
          #      response.should redirect_to Micropost.last
          # end
        end

        context "with invalid attributes" do
          it "does not save the new user in the database" do
            expect{
                   post :create, user: FactoryGirl.attributes_for(:invalid_user)
            }.to_not change(User,:count)
          end
          it "re-renders the :new method" do
               post :create, user: FactoryGirl.attributes_for(:invalid_user)
               response.should render_template :new
          end
        end
      end
       
     
      describe 'PUT update' do 
         before :each do 
                @user = FactoryGirl.create(:user, email: 'xxx@gmail.com' ,name: "Brijesh")
              end
         context "valid attributes" do 

          it "located the requested @micropost" do 
              put :update, id: @user, user: FactoryGirl.attributes_for(:user) 
              #assigns(:micropost).should eq(@micropost) 
          end 
          it "changes @micropost's attributes" do 
              put :update, id: @user, 
              user: FactoryGirl.attributes_for(:user, email: 'xxx@gmail.com' ,name: "Brijesh") 
              @user.reload 
              @user.email.should eq("xxx@gmail.com")
              @user.name.should eq("Brijesh")
          end 
          # it "redirects to the updated micropost" do 
          #     put :update, id: @micropost, micropost: FactoryGirl.attributes_for(:micropost) 
          #     response.should redirect_to @micropost 
          #   end 
          end 
          context "invalid attributes" do 
            it "locates the requested @user" do
              put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user) 
              #assigns(:micropost).should eq(@micropost) 
            end 
            it "does not change @micropost's attributes" do
                put :update, id: @user, 
                user: FactoryGirl.attributes_for(:user, email: 'xxx@gmail.com' ,name: "Brijesh") 
                @user.reload 
                @user.email.should eq("xxx@gmail.com")
                @user.name.should eq("Brijesh")
            end 
          it "re-renders the edit method" do 
              put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user) 
              response.should render_template :edit 
            end 
          end 
        end 
 end