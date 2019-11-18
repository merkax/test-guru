class Test < ApplicationRecord
  def self.sort_categories(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: :category }).order(title: :desc).pluck(:title)
  end
end
