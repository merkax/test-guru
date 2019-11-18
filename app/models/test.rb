class Test < ApplicationRecord

# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию массив названий всех Тестов
# у которых Категория называется определённым образом (название категории передается в метод в качестве аргумента). 
  def self.sort_categories(categories)
    tests.where(title: :categories).order(id: :desc)
  end
end
