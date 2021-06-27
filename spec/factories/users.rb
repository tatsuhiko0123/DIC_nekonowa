FactoryBot.define do
  factory :user do
    image { File.open("./app/assets/images/2.JPG") }
    name { "kuro" }
    comment {"クロです"}
    email { "kuro@gmail.com" }
    password { "111111" }
    admin { "false" }
  end

  factory :user2, class: User do
    image { File.open("./app/assets/images/3.JPG") }
    name { "tora" }
    comment {"トラです"}
    email { "tora@gmail.com" }
    password { "111111" }
    admin { "false" }
  end

  factory :admin_user, class: User do
    image { File.open("./app/assets/images/1.JPG") }
    name { "goma" }
    comment {"ゴマです"}
    email { "goma@gmail.com" }
    password { "111111" }
    admin { "true" }
  end
end