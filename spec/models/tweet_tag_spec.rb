require 'rails_helper'

RSpec.describe TweetTag, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.id = '1'
    @user.save
    @tweet = FactoryBot.build(:tweet)
    @tweet.id = '1'
    @tweet.save
    @tweet_tag = FactoryBot.build(:tweet_tag, user_id: @user.id, id: @tweet.id)
  end

  describe 'tweetの新規投稿' do
    context 'tweetの新規投稿ができるとき' do
      it '全ての項目が入力されていれば投稿できる' do
        expect(@tweet_tag).to be_valid
      end
      it 'thoughtsが空でも投稿できる' do
        @tweet_tag.thoughts = ''
        @tweet_tag.valid?
        expect(@tweet_tag).to be_valid
      end
      it 'tag_nameが空でも投稿できる' do
        @tweet_tag.tag_name = ''
        @tweet_tag.valid?
        expect(@tweet_tag).to be_valid
      end
    end
    context 'tweetの新規投稿ができないとき' do
      it 'titleが空では投稿できない' do
        @tweet_tag.title = ''
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('夢のタイトルを入力してください')
      end
      it 'textが空では投稿できない' do
        @tweet_tag.text = ''
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('夢の内容を入力してください')
      end
      it 'mind_idが空では投稿できない' do
        @tweet_tag.mind_id = ''
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('気持ちを選択してください')
      end
      it 'category_idが空では投稿できない' do
        @tweet_tag.category_id = ''
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'time_length_idが空では投稿できない' do
        @tweet_tag.time_length_id = ''
        @tweet_tag.valid?
        expect(@tweet_tag.errors.full_messages).to include('夢の長さを選択してください')
      end
    end
  end
end
