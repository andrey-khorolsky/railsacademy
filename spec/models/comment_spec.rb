require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.getLastComments post_id, count }
  let(:count) { 3 }

  context 'find some comments' do
    it {
      expect(Comment.getLastComments(1)).to eq Comment.where('post_id = ?', 1).order(created_at: :desc).limit(count)
    }
    it {
      expect(Comment.getLastComments(2)).to eq Comment.where('post_id = ?', 2).order(created_at: :desc).limit(count)
    }
  end

  context 'invalid post id' do
    it { expect(Comment.getLastComments(200)).to eq [] }
    it { expect(Comment.getLastComments(0)).to eq [] }
    it { expect(Comment.getLastComments(-1)).to eq [] }
  end

  context 'some same comments' do
    subject { FactoryBot.create(:comment) }
    it { should validate_uniqueness_of(:text).scoped_to(:user_id, :post_id) }
  end
end
