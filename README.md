# Petster
Social media for pets

## Models
- Pets: name, tagline, password_digest, session_token
- Friends: pet_id, pet_id, can't be the same, uniquely scoped, has_friended
- Photos: pet_id, photo_url, profile_photo
- Posts: pet_id, content
- Likes: post_id or comment_id (polymorphic), pet_id, uniquely scoped
- Comments: post_id, pet_id, content

## 20+ Methods in Models
1. Pet#friends: return all pet's friends
2. Pet#photos: return all pet's photos
3. Pet#number_friends: return number of friends
4. Pet#number_photos: return number of photos
5. Pet.most_popular: return Pet/s w/ most friends
6. Pet.least_popular: return Pet/s w/ least friends
7. Pet.newest: return last added pet
8. Pet#posts: return all pet's posts
9. Pet#most_liked_post: return pet's most liked post
10. Pet#most_commented_post: return pet's most commented on post
11. Pet#most_popular_post: return pet's most popular post (comment number + like number)
12. Post#comments: return all comments for a post
13. Post#number_comments: return number of comments on a post
14. Post#likes: return number of likes on a post
15. Post#likers: return list of users who liked a post
16. Post#who_commented: return list of users who commented on a post
17. Pet#number_posts: return number of posts made by a pet
18. Comment#likes: return number of likes for a comment
19. Comment#likers: return list of users who liked a comment
20. Post.most_popular: return most popular post (comment number * like number)
21. Pet#profile_photo

## 10 Specs
A user can:
1. Create a new pet profile
2. Add a friend for a pet
3. See all of a pet's friends
4. Create a post
5. See all of a pet's posts
6. Like a post
7. Comment on a post
8. See all of a post's comments
9. Like a comment
10. Add a photo to a pet's page