require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = <<~CSV_TEXT
  email,username,avatar_url
  user-1@example.com,Mr. Hank Runte,https://robohash.org/sintutomnis.png?size=300x300&set=set1
  user-2@example.com,Glory Barrows,https://robohash.org/molestiasenimcorporis.png?size=300x300&set=set1
  user-3@example.com,Griselda Spencer,https://robohash.org/istedignissimosvoluptate.png?size=300x300&set=set1
  user-4@example.com,Mrs. Zella Leuschke,https://robohash.org/eaautemducimus.png?size=300x300&set=set1
  user-5@example.com,Victoria Kris,https://robohash.org/sintcorporisfugit.png?size=300x300&set=set1
CSV_TEXT

CSV.parse(users, headers: true) { |row| User.create(row.to_h) }


posts = <<~CSV_TEXT
  title,author_id
  Chuck Norris' preferred IDE is hexedit.,4
  "Chuck Norris doesn't need a java compiler, he goes straight to .war",2
  "Chuck Norris' programs occupy 150% of CPU, even when they are not executing.",5
  Chuck Norris's beard can type 140 wpm.,4
  Chuck Norris went out of an infinite loop.,3
CSV_TEXT

CSV.parse(posts, headers: true) { |row| Post.create(row.to_h) }


books = <<~CSV_TEXT
  title,author_id
  The Golden Bowl,4
  "Alone on a Wide, Wide Sea",2
  Cover Her Face,5
  The Line of Beauty,2
  Tirra Lirra by the River,1
CSV_TEXT

CSV.parse(books, headers: true) { |row| Book.create(row.to_h) }


reviews = <<~CSV_TEXT
  stars,comment,reviewer_id,book_id
  2,"Transmitting the pixel won't do anything, we need to reboot the solid state thx microchip!",4,3
  4,"The CSS bandwidth is down, quantify the mobile array so we can back up the SMTP protocol!",3,2
  4,"The TCP bus is down, reboot the primary protocol so we can transmit the SSL pixel!",1,2
  1,"I'll program the primary USB program, that should circuit the AI card!",5,1
  4,You can't transmit the monitor without navigating the solid state EXE panel!,4,5
  4,"Use the auxiliary RSS matrix, then you can calculate the auxiliary bus!",4,3
  3,"If we index the feed, we can get to the EXE card through the neural JBOD array!",5,1
  3,We need to copy the virtual RSS panel!,2,3
  1,You can't input the system without synthesizing the wireless RSS system!,5,4
  5,"Try to back up the SSL sensor, maybe it will transmit the haptic protocol!",1,5
CSV_TEXT

CSV.parse(reviews, headers: true) { |row| Review.create(row.to_h) }