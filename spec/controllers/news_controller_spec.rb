require 'rails_helper'

RSpec.describe NewsController, type: :controller do
    include Devise::Test::IntegrationHelpers 

    describe "GET index" do

        context "unsigned user" do
                
            it "open news page" do
                get :index
                assert_response :success
            end

            it "render index" do
                get :index
                render_template 'post/index'
            end

            it "show all posts" do
                get :index
                assert_equal Post.all.order(created_at: :desc), assigns(:posts)
            end

        end


        context "signed in user" do

            it "open news page" do
                sign_in FactoryBot.create(:user)
                get :index
                assert_response :success
            end

            it 'render index' do
                get :index
                render_template 'post/index'
            end

            it "show user's news" do
                user = FactoryBot.create(:user)
                subject.sign_in user
                get :index
                expect(assigns(:posts)).to eq Post.getUsersNews user.id
            end
        end

    end
end
