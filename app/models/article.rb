class Article < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  # 20文字以上の記事タイトルを省略する
  def abbreviated_title
    title.size >= 20 ? "#{title.slice(0, 19)}..." : title
  end

  # 記事を公開する
  def publish
    return if self.published?
    update({status: Article.statuses['published'], published_at: Time.current})
  end
  # 20文字ごとに記事タイトルに改行コードを入れる
  # 最後が改行コードになる場合は改行コードはつかない
  def break_title
    return if title.nil?
    title.scan(/.{1,20}/).join('\n')
  end
end
