class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_one :other_post, dependent: :destroy
  accepts_nested_attributes_for :other_post, update_only: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :image, presence: true
  validates :comment, presence: true

  scope :search_prefecture, -> (search_prefecture) { where(prefecture: search_prefecture)}

  enum prefecture:{
     "エリアを選択":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
     沖縄県:47
  }, _prefix: true

  enum gender:{ "性別を選択":0,♂　オス:1,♀　メス:2,不明:3 }, _prefix: true

  enum age:{
    "推定年齢を選択":0,
    １週間:1,２週間:2,３週間:3,１ヶ月:4,２ヶ月:5,３ヶ月:6,４ヶ月:7,
    ５ヶ月:8,６ヶ月:9,７ヶ月:10,８ヶ月:11,９ヶ月:12,１０ヶ月:13,１１ヶ月:14,
    １歳:15,２歳:16,３歳:17,４歳:18,５歳:19,６歳:20,
    ７歳:21,８歳:22,９歳:23,１０歳以上:24,
    不明:25
  }, _prefix: true

  geocoded_by :address
  after_validation :geocode
end
