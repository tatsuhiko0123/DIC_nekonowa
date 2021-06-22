class OtherPost < ApplicationRecord
  belongs_to :post
  enum vaccination:{ "ワクチン接種":0,未接種:1,接種済:2 }, _prefix: true
  enum operation:{ "去勢／避妊":0,未手術:1,手術済:2 }, _prefix: true
  enum single:{ "単身者応募":0,可:1,不可:2 }, _prefix: true
  enum old_age:{ "高齢者応募":0,可:1,不可:2 }, _prefix: true
end
