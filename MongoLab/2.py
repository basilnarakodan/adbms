import pymongo

url="mongodb://localhost:27017/"
c=pymongo.MongoClient(url)
db=c["student"]
coll=db["mark"]


#print first and last name and mark of all female students in mca dept


#for x in coll.find({"gender":"female","course":"MCA"},{"name":1,"_id":0,"mark":1}):
#	print(x["name"]["fname"]+" "+ x["name"]["lname"]+ " " + str(x["mark"]))


#display the details of student who scored highest marks in mca


#for x in coll.find({"course":"MCA"},{"name":1,"_id":0}).sort("mark",-1,).limit(1):
#	print (x)


#display all male student who secured A+ grade


#for x in coll.find({"gender":"male","grade":"A+"},{"name":1,"_id":0}):
#	print (x)


#display the name of top 3 students in mech dept

#for x in coll.find({"course":"Mechanical"},{"name":1,"_id":0}).sort("mark",-1,).limit(3):
#	print (x["name"]["fname"])


#display the details of female students (fname,lname,mark,contact)who achieved ,mark>90

#for x in coll.find({"gender":"female","mark":{"$gt":90}},{"name":1,"mark":1,"phone":1,"_id":0}):
#	print(x["name"]["fname"]+" "+ x["name"]["lname"]+ " " +str(x["phone"]["no"])+ " " +str(x["mark"]))


#display the details of students who secured mark >80 and <90

#for x in coll.find({"mark":{"$gt":80,"$lt":90}}):
#	print(x["name"]["fname"]+" "+ x["name"]["lname"]+ " " +str(x["phone"]["no"])+ " " +str(x["mark"]))



#display the details of students who names start with V
#for x in coll.find({"name.fname":{"$regex":"^A"}}):
#	print(x)


#display all students from Kollam

#for x in coll.find({"address.city":"Kollam"}):
#	print (x)


#display all students details who belong neither to tvm nor kollam

#for x in coll.find({"address.city":{"$nin":["Kollam","Thiruvananthapuram"]}}):
#	print (x)


#display all female students details who belong to either tvm or kollam

#for x in coll.find({"gender":"female","address.city":{"$in":["Kollam","Thiruvananthapuram"]}}):
#	print (x)






