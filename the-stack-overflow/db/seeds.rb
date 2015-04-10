# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

natalia = User.create(username: "natalia", password: "123")
angel = User.create(username: "angel", password: "123")
steph = User.create(username: "steph", password: "123")

q1 = Question.create(title: "What the heck is a polymorphic association?", body: "Why do I need it? Will it revolutionize my life?? Elaborate please.", user: angel)
q2 = Question.create(title: "What's for dinner?", body: "Vegan?? Steak? Indddiaaaannnn?", user: steph)
q3 = Question.create(title: "How to poach an egg", body: "Why do I need it? Will it revolutionize my life?? Elaborate please.", user: natalia)

a1 = Answer.create(body: "You need it. Just trust. And... stackoverflow it.", user: steph, question: q1)

a2 = Answer.create(body: "Steak. Medium rare. You need it. Just trust.", user: angel, question: q2)
a3 = Answer.create(body: "TOFU Steak. Medium rare. You need it. Just trust.", user: natalia, question: q2)
