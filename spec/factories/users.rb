FactoryBot.define do
  factory :admin_user do
    image {"./app/assets/images/1.JPG"}
    name { "goma" }
    comment {"ゴマです"}
    email { "goma@gmail.com" }
    password { "111111" }
    admin { "true" }
  end

  factory :user do ,class: User do
    image {"./app/assets/images/2.JPG"}
    name { "kuro" }
    comment {"クロです"}
    email { "kuro@gmail.com" }
    password { "111111" }
    admin { "false" }
  end
end