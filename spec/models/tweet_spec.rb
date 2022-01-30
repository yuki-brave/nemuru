require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'tweetの新規投稿' do
    context 'tweetの新規投稿ができるとき' do
      it '全ての項目が入力されていれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'tweetの新規投稿ができないとき' do
      it 'titleが空では投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('夢のタイトルを入力してください')
      end
      it 'textが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('夢の内容を入力してください')
      end
      it 'mind_idが1では投稿できない' do
        @tweet.mind_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('気持ちを選択してください')
      end
      it 'category_idが1では投稿できない' do
        @tweet.category_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'time_zone_idが1では投稿できない' do
        @tweet.time_zone_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('時間帯を選択してください')
      end
      it 'userが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
