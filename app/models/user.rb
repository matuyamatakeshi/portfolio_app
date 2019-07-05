# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin           :boolean          default(FALSE), not null
#  mail            :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_mail  (mail) UNIQUE
#

class User < ApplicationRecord   
    has_secure_password 

    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post

    def already_liked?(post)
        self.likes.exists?(post_id: post.id)
    end

    validates :name, presence: true
    validates :mail, presence: true, uniqueness: true    
    
end
