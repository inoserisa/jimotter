require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @prefecture = Prefecture.create(name: '東京都')
    @city = City.create(name: '新宿区', prefecture_id: @prefecture.id)
  end

  describe 'バリデーションチェック' do
    it 'バリデーションが機能しているか' do
      user = User.create(name: 'test_user', email: 'user@example.com', password: 'password')

      post = user.posts.new(user_id: user.id, prefecture_id: @prefecture.id, city_id: @city.id, content: 'aaa')
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end
  end
end
