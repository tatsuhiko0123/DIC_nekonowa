class OtherPost < ApplicationRecord
  belongs_to :post
  enum vaccination:{ "---":0,未接種:1,接種済:2 }, _prefix: true
  enum operation:{ "---":0,未手術:1,手術済:2 }, _prefix: true
  enum single:{ "---":0,可:1,不可:2 }, _prefix: true
  enum old_age:{ "---":0,可:1,不可:2 }, _prefix: true
end
