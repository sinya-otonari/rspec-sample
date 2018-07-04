require 'rails_helper'

RSpec.describe Article, type: :model do
  shared_context 'タイトルの文字数が' do |num|
    let(:title) { 'a' * num }
  end

  shared_examples_for '次のタイトルが返ること' do |title|
    it { is_expected.to eq(title) }
  end

  let(:article) { Article.create(title: title) }
  describe '.abbreviated_title' do
    subject { article.abbreviated_title }
    context '記事タイトルが19文字の場合' do
      include_context 'タイトルの文字数が', 19
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}"
    end

    context '記事タイトルが20文字の場合' do
      include_context 'タイトルの文字数が', 20
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}..."
    end
  end

  describe '.break_title' do
    subject { article.break_title }
    context '記事タイトルが19文字の場合' do
      include_context 'タイトルの文字数が', 19
      it_behaves_like '次のタイトルが返ること', "#{'a' * 19}"
    end

    context '記事タイトルが20文字の場合' do
      include_context 'タイトルの文字数が', 20
      it_behaves_like '次のタイトルが返ること', "#{'a' * 20}"
    end

    context '記事タイトルが21文字の場合' do
      include_context 'タイトルの文字数が', 21
      it_behaves_like '次のタイトルが返ること', "#{'a' * 20}\\na"
    end
  end

  describe '.abbreviated_title' do
    let(:article) { Article.new(title: title) }
    subject { article.abbreviated_title }
    context '記事タイトルが20文字未満の場合' do
      let(:title) { 'タイトル' }
      it '記事タイトルがそのまま返ること' do
        is_expected.to eq 'タイトル'
      end
    end

    context '記事タイトルが20文字以上の場合' do
      let(:title) { 'a' * 20 }
      it '記事タイトルが省略されること' do
        is_expected.to eq "#{'a' * 19}..."
      end
    end
  end
end
