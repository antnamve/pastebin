User.delete_all

User.create! email: 'test@example.com', password: 'password'

Paste.delete_all

Paste.create!(
  body: Faker::Lorem.paragraph(sentence_count: 40), 
  user_id: User.first.id
)
