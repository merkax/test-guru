  users = User.create!([
                        {email: 'mishagrishkinandco@gmail.com',
                        password: 'secret1234', 
                        password_confirmation: 'secret1234',
                        first_name: 'Mike', 
                        last_name: 'admin', 
                        type: 'Admin'}
                      ])

  categories  = Category.create!([
                                  { title: 'Frontend' },
                                  { title: 'Backend' }
                                ])

  tests = Test.create!([
                        { title: 'Ruby', level: 2, category_id: categories[1].id, author_id: users[0].id },
                        { title: 'HTML', level: 1, category_id: categories[0].id, author_id: users[0].id },
                        { title: 'JavaScript', level: 2, category_id: categories[0].id, author_id: users[0].id }
                      ])

  questions = Question.create!([
                                { body: 'Who is Matz?', test_id: tests[0].id },
                                { body: 'Who is Berners-Lee?', test_id: tests[1].id },
                                { body: 'Who is Brendan Eich?', test_id: tests[2].id }
                              ])

  answers = Answer.create!([
                            {
                              body:'He is Ruby creator',
                              correct: true,
                              question_id: questions[0].id
                            },
                            {
                              body:'He is HTML creator',
                              correct: false,
                              question_id: questions[0].id
                            }
                          ])
