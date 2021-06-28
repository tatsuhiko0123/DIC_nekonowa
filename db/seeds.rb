# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザー ユーザー1
user1 = User.create!(
  image: File.open("./app/assets/images/1.JPG"), 
  name: "goma", 
  comment: "ゴマです", 
  email: "goma@gmail.com", 
  password: "111111", 
  password_confirmation: "111111", 
  admin: true
)

# ユーザー2
user2 = User.create!(
  image: File.open("./app/assets/images/2.JPG"), 
  name: "kuro", 
  comment: "クロです", 
  email: "kuro@gmail.com", 
  password: "111111", 
  password_confirmation: "111111", 
  admin: false
)

# ユーザー3
user3 = User.create!(
  image: File.open("./app/assets/images/3.JPG"),
  name: "tora",
  comment: "トラです",
  email: "tora@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  admin: false
)

# ユーザー4
user4 = User.create!(
  image: File.open("./app/assets/images/4.JPG"),
  name: "natsu",
  comment: "ナツです",
  email: "natsu@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  admin: false
)

# ユーザー5
user5 = User.create!(
  image: File.open("./app/assets/images/5.JPG"),
  name: "cocoa",
  comment: "ココアです",
  email: "cocoa@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  admin: false
)

# ユーザー1
post1 = Post.create!(
  image: File.open("./app/assets/images/6.JPG"),
  comment: "ゴマ",
  breed: 1,
  gender: 1,
  age: 1,
  prefecture: 1,
  address: "茨城県つくばみらい市福田195",
  user_id: user1.id
)

# ユーザー2
post2 = Post.create!(
  image: File.open("./app/assets/images/7.JPG"),
  comment: "クロ",
  breed: 1,
  gender: 1,
  age: 1,
  prefecture: 1,
  address: "茨城県つくばみらい市福田195",
  user_id: user2.id
)

# ユーザー3
post3 = Post.create!(
  image: File.open("./app/assets/images/8.JPG"),
  comment: "トラ",
  breed: 1,
  gender: 1,
  age: 1,
  prefecture: 1,
  address: "茨城県つくばみらい市福田195",
  user_id: user3.id
)

# ユーザー4
post4 = Post.create!(
  image: File.open("./app/assets/images/9.JPG"),
  comment: "ナツ",
  breed: 1,
  gender: 1,
  age: 1,
  prefecture: 1,
  address: "茨城県つくばみらい市福田195",
  user_id: user4.id
)

# ユーザー5
post5 = Post.create!(
  image: File.open("./app/assets/images/10.JPG"),
  comment: "ココア",
  breed: 1,
  gender: 1,
  age: 1,
  prefecture: 1,
  address: "茨城県つくばみらい市福田195",
  user_id: user5.id
)

# post1
other_post1 = OtherPost.create!(
  vaccination: 1,
  operation: 1,
  single: 1,
  old_age: 1,
  health_status: "良好",
  character: "おっとり",
  surrender: "自転車オッケー",
  note: "特に無し",
  post_id: post1.id
)

# post2
other_post2 = OtherPost.create!(
  vaccination: 1,
  operation: 1,
  single: 1,
  old_age: 1,
  health_status: "良好",
  character: "天邪鬼",
  surrender: "徒歩でも可",
  note: "特になし",
  post_id: post2.id
)

# post3
other_post3 = OtherPost.create!(
  vaccination: 1,
  operation: 1,
  single: 1,
  old_age: 1,
  health_status: "良好",
  character: "暴れん坊",
  surrender: "車で来れる方",
  note: "なし",
  post_id: post3.id
)

# post4
other_post4 = OtherPost.create!(
  vaccination: 1,
  operation: 1,
  single: 1,
  old_age: 1,
  health_status: "良好",
  character: "デブ",
  surrender: "同じ県の人",
  note: "特にないです",
  post_id: post4.id
)

# post5
other_post5 = OtherPost.create!(
  vaccination: 1,
  operation: 1,
  single: 1,
  old_age: 1,
  health_status: "良好",
  character: "元気がいい",
  surrender: "車で30分以内",
  note: "可愛がってください",
  post_id: post5.id
)

Favorite.create!(
  [
    # ユーザー1
    {user_id: user1.id, post_id: post2.id},

    # ユーザー2
    {user_id: user2.id, post_id: post3.id},
    
    # ユーザー3
    {user_id: user3.id, post_id: post4.id},

    # ユーザー4
    {user_id: user4.id, post_id: post5.id},

    # ユーザー5
    {user_id: user5.id, post_id: post1.id}
  ]
)