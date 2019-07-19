FactoryBot.define do
  factory :post do
    author { Faker::Superhero.name }
    authorId Faker::Number.between(1, 10)
    likes {Faker::Number.between(100, 1000)}
    popularity {Faker::Number.between(1000, 10000)}
    reads {Faker::Number.between(10000, 100000)}
    tags ["health", "tech"]
  end
end

class Post
end