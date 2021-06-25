FactoryBot.define do
  factory :other_post do
    vaccination { 1 }
    operation { 1 }
    single { 1 }
    old_age { 1 }
    health_status { "良好" }
    character { "おっとり" }
    surrender { "自転車オッケー" }
    note { "特に無し" }
    association :post
  end

  factory :other_post2 do, class: "OtherPost" do
    vaccination { 2 }
    operation { 2 }
    single { 2 }
    old_age { 2 }
    health_status { "良好" }
    character { "天邪鬼" }
    surrender { "徒歩でも可" }
    note { "特になし" }
    association :post
  end

  factory :other_post3 do, class: "OtherPost" do
    vaccination { 1 }
    operation { 2 }
    single { 1 }
    old_age { 2 }
    health_status { "良好" }
    character { "暴れん坊" }
    surrender { "車で来れる方" }
    note { "なし" }
    association :post
  end
end