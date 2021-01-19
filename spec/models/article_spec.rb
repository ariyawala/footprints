require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿機能' do
    context '記事登録ができる場合' do
      it '画像、タイトル、メモ、場所、日付があれば記事は保存される' do
        expect(@article).to be_valid
      end
    end

    context '記事投稿がされない場合' do
      it '画像がないと記事は保存されない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Image can't be blank")
      end

      it 'タイトルが空の場合記事は保存されない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'メモが空の場合記事は保存されない' do
        @article.memo = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Memo can't be blank")
      end

      it '場所が空の場合記事は保存されない' do
        @article.place = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Place can't be blank")
      end

      it '日付が空の場合記事は保存されない' do
        @article.date = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Date can't be blank")
      end

      it 'ユーザーが紐付いていないと記事は保存されない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('User must exist')
      end
    end
  end
end