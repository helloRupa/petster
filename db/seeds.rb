# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clear all tables
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}'")
end

# Create pets and profile photos
pet_names = ['Fluffanilla', 'Cumberbun', 'Xanadu', 'Fabio', 'Gremlin']
photos = [
  'https://www.marylandzoo.org/wp-content/uploads/2018/04/lemuranimaheader3.jpg',
  'https://www.birminghamzoo.com/wp-content/uploads/2013/11/Red-Panda-Parker-001-Birmingham-Zoo-2-27-18-1024x801.jpg',
  'https://images2.minutemediacdn.com/image/upload/c_crop,h_1455,w_2587,x_0,y_423/f_auto,q_auto,w_1100/v1554917589/shape/mentalfloss/62012-istock-833768276.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lionel-animals-to-follow-on-instagram-1568319926.jpg?crop=0.922xw:0.738xh;0.0555xw,0.142xh&resize=640:*',
  'https://i1.wp.com/cutefunnycatvideos.com/wp-content/uploads/2017/05/Funny-Cat-Names-for-Male-Female-Kittens.jpg?fit=1079%2C1140&ssl=1'
]
password_digest = '1234567891011121314151617181920'

pet_names.each_with_index do |name, idx|
  Pet.create(name: name, tagline: "Tagline #{name}", password_digest: password_digest)
  Photo.create(pet_id: idx + 1, photo_url: photos[idx], profile_photo: true)
end

# make friends
Friend.create(requestor_id: 1, requestee_id: 2, has_friended: true)
Friend.create(requestor_id: 1, requestee_id: 3, has_friended: true)
Friend.create(requestor_id: 1, requestee_id: 4, has_friended: true)
Friend.create(requestor_id: 1, requestee_id: 5, has_friended: true)
Friend.create(requestor_id: 2, requestee_id: 4, has_friended: true)
Friend.create(requestor_id: 3, requestee_id: 5, has_friended: true)
Friend.create(requestor_id: 4, requestee_id: 3, has_friended: false)
Friend.create(requestor_id: 5, requestee_id: 2, has_friended: false)

# add more photos
pet1_photos = [
  'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://www.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.jpg',
  'https://1843magazine.static-economist.com/sites/default/files/styles/article-main-image-overlay/public/WC-cat-header%203.jpg'
]

pet1_photos.each do |url|
  Photo.create(pet_id: 1, photo_url: url)
end

pet2_photos = [
  'https://www.sciencenews.org/wp-content/uploads/2019/07/072319_ee_cat-allergy_feat.jpg',
  'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/WALN4MAIT4I6VLRIPUMJQAJIME.jpg&w=767'
]

pet2_photos.each do |url|
  Photo.create(pet_id: 2, photo_url: url)
end

# Create posts and comments
(1..5).each do |n|
  Post.create(pet_id: n, content: "This is post #{n}")
  Comment.create(post_id: n, pet_id: 1, content: "This is comment #{n} from pet 1")
  Comment.create(post_id: n, pet_id: 2, content: "This is comment #{n} from pet 2")
end

# Like posts and comments
Like.create(pet_id: 1, likeable_type: Post, likeable_id: 2)
Like.create(pet_id: 2, likeable_type: Post, likeable_id: 2)
Like.create(pet_id: 1, likeable_type: Post, likeable_id: 3)
Like.create(pet_id: 1, likeable_type: Comment, likeable_id: 1)
