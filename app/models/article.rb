class Article < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  def abbreviated_title
    title.size >= 20 ? "#{title.slice(0, 19)}..." : title
  end

  def publish
    return if self.published?
    update({status: Article.statuses['published'], published_at: Time.current})
  end
end
