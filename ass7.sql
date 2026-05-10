use db_EmpDB
db.createCollection("Employee")

db.Employee.insertOne({name:"Keshav",age:20,Sal:25000,dept:"AIDS"})
db.Employee.insertMany([ 
  { name: "Riya", age: 22, Sal: 30000, dept: "IT" }, 
  { name: "Amit", age: 25, Sal: 40000, dept: "HR" }, 
  { name: "Sneha", age: 21, Sal: 28000, dept: "AIDS" }, 
  { name: "Rahul", age: 27, Sal: 50000, dept: "Finance" }, 
  { name: "Priya", age: 24, Sal: 35000, dept: "Marketing" }, 
  { name: "Arjun", age: 26, Sal: 45000, dept: "IT" }, 
  { name: "Neha", age: 23, Sal: 32000, dept: "HR" }, 
  { name: "Vikram", age: 29, Sal: 60000, dept: "Finance" }, 
  { name: "Anjali", age: 22, Sal: 31000, dept: "Marketing" }, 
  { name: "Karan", age: 28, Sal: 55000, dept: "AIDS" } 
]);

db.Employee.find()
db.Employee.updateOne({name: "Riya"},{$set:{Sal:35000}})
db.Employee.deleteOne({name: "Karan"}) 
db.Employee.aggregate([{$group:{_id:"$dept",t_Sal:{$sum:"$Sal"}}}])