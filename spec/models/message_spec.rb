require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:user){ FactoryBot.create(:user, email:"kuro@gmail.com", name: 'kuro',password:'111111')}
  let!(:user2){ FactoryBot.create(:user2, email:"tora@gmail.com", name: 'tora',password:'111111')}
  let!(:conversation){ FactoryBot.create(:conversation, sender_id: user.id, recipient_id: user2.id)}
  let!(:message){Message.create(user_id: user.id, conversation_id: conversation.id, body: 'こんにちは')}

  describe 'メッセージ機能モデルテスト' do
    context 'メッセージが正常の場合'
    it 'メッセージが作成できる' do
      expect(message).to be_valid
    end
  end
end