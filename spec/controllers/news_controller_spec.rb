require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  describe 'GET index' do
    context 'unsigned user' do
      before { get :index }

      it { should respond_with 200 }

      it { should render_template 'index' }

      it { assert_equal Post.all.order(created_at: :desc), assigns(:posts) }
    end

    context 'signed in user' do
      let(:user) { FactoryBot.create(:user) }

      before do
        subject.sign_in user
        get :index
      end

      it { should respond_with 200 }

      it { should render_template('index') }

      it { expect(assigns(:posts)).to eq Post.getUsersNews user.id }
    end
  end
end
