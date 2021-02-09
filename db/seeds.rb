#create admin user
User.create(username: "Matteo", dob: '1/1/1991', email: "matteo@gmail.com", password: "Password!!!", admin: true)
#create coins
Scraper.new.make_coins