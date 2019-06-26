# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
    (1..45).each do |i|
        Post.create(name: "ユーザー#{i}", title: "遺産名#{i}", body: "本文#{i}", cname: "国名#{i}", fee: "料金#{i}", information: "お役立ち情報#{i}")
    end
end