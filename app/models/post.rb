# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  cname       :string
#  fee         :string
#  image       :string
#  information :text
#  name        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    is_impressionable

    validates :name, presence: true, length: { maximum: 10 }
    validates :cname, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 15 }
    validates :fee, presence: true, length: { maximum: 100 }
    validates :information, presence: true, length: { maximum: 1000 }
    validates :body, presence: true, length: { maximum: 1000 }

    mount_uploader :image, ImageUploader
end
