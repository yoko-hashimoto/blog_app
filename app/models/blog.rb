class Blog < ApplicationRecord
  # 空の値で登録することを禁止する
  validates :title, presence: true
  #1文字以上140文字以下しか投稿できないようバリデーションを定義する
  validates :content, length: { in: 1..140 }
  
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :image, ImageUploader
end
