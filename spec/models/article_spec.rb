require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.abbreviate_title' do
    it '記事タイトルがそのまま返ること' do
      article = Article.new(title: 'タイトルです')
      expect(article.abbreviated_title).to eq 'タイトルです'
    end
  end

  describe '.publish' do
    it '記事が公開状態になること' do
      article = Article.new(status: :draft)
      article.publish
      expect(article.published?).to be_truthy
    end
  end
end
