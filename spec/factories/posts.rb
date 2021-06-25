FactoryBot.define do
  factory :post do
    image { "./app/assets/images/6.JPG" }
    comment { "ゴマ" }
    breed { "雑種" }
    gender { 1 }
    age { 1 }
    prefecture { 1 }
    address { "茨城県つくばみらい市福田195" }
    association :user
  end

  factory :post2, class: "Post" do
    image { "./app/assets/images/7.JPG" }
    comment { "クロ" }
    breed { "雑種" }
    gender { 1 }
    age { 1 }
    prefecture { 1 }
    address { "茨城県つくばみらい市福田195" }
    association :user
  end

  factory :post3, class: "Post" do
    image { "./app/assets/images/8.JPG" }
    comment { "トラ" }
    breed { "雑種" }
    gender { 1 }
    age { 1 }
    prefecture { 1 }
    address { "茨城県つくばみらい市福田195" }
    association :user
  end
end