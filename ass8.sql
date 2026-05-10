use SocialMediaDB  
db.createCollection("Posts")

db.Posts.insertMany([  
{  
post_id: 1,  
user: "amit_tech",  
content: "Learning MongoDB is fun! #MongoDB #NoSQL #Database",  
hashtags: ["MongoDB", "NoSQL", "Database"],  
likes: 120,  
shares: 30,  
post_date: ISODate("2024-02-01")  
},  
{ 
post_id: 2,  
user: "neha_codes",  
content: "AI is transforming the future #AI #MachineLearning",  
hashtags: ["AI", "MachineLearning"],  
likes: 250,  
shares: 60,  
post_date: ISODate("2024-02-02")  
}, 
{ 
post_id: 3,  
user: "rahul_dev",  
content: "Big data analytics using NoSQL #BigData #NoSQL",  
hashtags: ["BigData", "NoSQL"],  
likes: 180,  
shares: 45,  
post_date: ISODate("2024-02-03")  
}, 
{ 
post_id: 4,  
user: "sneha_ai",  
content: "Deep learning trends in 2024 #AI #DeepLearning",  
hashtags: ["AI", "DeepLearning"],  
likes: 300,  
shares: 90,  
post_date: ISODate("2024-02-04") 
}]) 

db.Posts.find().pretty()  
db.Posts.find({ likes: {$gt: 200} })  
db.Posts.find({ hashtags: "AI" })  

db.Posts.aggregate([  
{$unwind: "$hashtags"},  
{$group: { _id: "$hashtags", count: { $sum: 1}}},  
{ $sort: { count: -1 } },  
{ $limit: 5 }]) 

db.Posts.aggregate([  
{  
$project: {  
user: 1,  
total_engagement: { $add: ["$likes", "$shares"] }}}])