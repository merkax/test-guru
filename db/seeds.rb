# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  users = User.create!(name: 'Mike', name: 'Ivan')

  categories  = Category.create!([
    { title: 'Frontend' },
    { title: 'Backend' }
  ])

  tests = Test.create!([
    { title: 'Ruby', level: 2, category_id: categories[1].id },
    { title: 'HTML', level: 1, category_id: categories[0].id },
    { title: 'JavaScript', level: 2, category_id: categories[0].id }
  ])

  questions = Question.create!([
    { body: 'Who is Matz?', test_id: tests[0].id },
    { body: 'Who is Berners-Lee?', test_id: tests[1].id },
    { body: 'Who is Brendan Eich?', test_id: tests[2].id }
  ])

  answers = Answer.create!([
    {
      body:'He is Ruby creator'
      correct: true
      question_id: questions[0].id
    },
    {
      body:'He is HTML creator'
      correct: false
      question_id: questions[0].id
    }
  ])
