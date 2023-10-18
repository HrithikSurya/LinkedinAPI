# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

UserProfile.create(title: "Sr. ROR Eng.", designation: "ROR Dev", experience: "3+", qualification: "MCA",
  skill_set: "ROR, Restful API, API Integration, Ruby HTML CSS JavaScript", location:"India",user_id:1)
  
UserProfile.create(title: "Sr. REact", designation: "2yrs+", experience: "Fresher", qualification: "BCA",
  skill_set: "HTML, CSS, JavaScript, React, NodeJS", location:"US",user_id:2)

UserProfile.create(title: "Sr. JAVA Developer", designation: "Java Developer", experience: "expert", qualification: "Mtech",
  skill_set: "JAva, SQL, MySQL, OOPS, Git, Api ", location:"UAE",user_id:3)