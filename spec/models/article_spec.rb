require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.abbreviate_title' do
    let(:article) { Article.new(title: title) }
    context '記事タイトルが20文字未満の場合' do
      let(:title) { 'タイトル' }
      it '記事タイトルがそのまま返ること' do
        expect(article.abbreviated_title).to eq 'タイトル'
      end
    end

  context '記事タイトルが20文字以上の場合' do
    # 追加されたサンプル
      let(:title) { 'a' * 20 }
      it '記事タイトルが省略されること' do
        expect(article.abbreviated_title).to eq "#{'a' * 19}..."
      end
    end
  end
end
