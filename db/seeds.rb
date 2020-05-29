# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

p "cleaning database"
Transaction.destroy_all
Piece.destroy_all
User.destroy_all

# Create users
f = User.new
f.first_name = "Francois"
f.last_name = "Jouvray"
f.email = "francois0690@gmail.com"
f.password = "123456"
f.password_confirmation = "123456"
f.save!

b = User.new
b.first_name = "Barnabé"
b.last_name = "Dubus"
b.email = "barnabe.dubus@gmail.com"
b.password = "123456"
b.password_confirmation = "123456"
b.save!

s = User.new
s.first_name = "Shaun"
s.last_name = "O Graham"
s.email = "shaun.o.graham@gmail.com"
s.password = "123456"
s.password_confirmation = "123456"
s.save!

m = User.new
m.first_name = "Myriam"
m.last_name = "de Bossoreille"
m.email = "myriam.dbdr@gmail.com"
m.password = "123456"
m.password_confirmation = "123456"
m.save!

g = User.new
g.first_name = "Gerard"
g.last_name = "Majax"
g.email = "gege@gmail.com"
g.password = "123456"
g.password_confirmation = "123456"
g.save!

p "#{User.count} utilisateurs crées"


#Create pieces
f1 = URI.open('https://res.cloudinary.com/diryp7blh/image/upload/v1590694253/art2heart/Mona_Lisa_Leonardo_da_Vinci.jpg')
p1 = Piece.new
p1.owner = f
p1.name ="Mona Lisa"
p1.artist ="Léonard de Vinci"
p1.price = 425
p1.status ="available"
p1.category = "tableau"
p1.photos.attach(io: f1, filename: 'Mona_Lisa.jpg', content_type: 'image/jpg')
p1.save!
p p1.photos.attached?

f2 = URI.open('https://res.cloudinary.com/diryp7blh/image/upload/v1590694252/art2heart/La_creation_d_adam_Michel_Ange.jpg')
p2 = Piece.new
p2.owner = b
p2.name ="La création d'Adam"
p2.artist ="Michel-Ange"
p2.price = 512
p2.status ="available"
p2.category = "tableau"
p2.photos.attach(io: f2, filename: 'La_creation_d_Adam.jpg', content_type: 'image/jpg')
p2.save!
p p2.photos.attached?

f3 = URI.open('https://res.cloudinary.com/diryp7blh/image/upload/v1590694252/art2heart/Nympheas_claude_monet.jpg')
p3 = Piece.new
p3.owner = s
p3.name ="Les Nymphéas"
p3.artist ="Claude Monet"
p3.price = 147
p3.status ="available"
p3.category = "tableau"
p3.photos.attach(io: f3, filename: 'Nymphéas.jpg', content_type: 'image/jpg')
p3.save!
p p3.photos.attached?

f4 = URI.open('https://res.cloudinary.com/diryp7blh/image/upload/v1590694252/art2heart/La_jeune_fille_a_la_perle_Johannes_Vermeer.jpg')
p4 = Piece.new
p4.owner = m
p4.name ="La Jeune Fille à la perle"
p4.artist ="Johannes Vermeer"
p4.price = 65
p4.status ="not available"
p4.category = "tableau"
p4.photos.attach(io: f4, filename: 'La_jeune_fille_a_la_perle.jpg', content_type: 'image/jpg')
p4.save!
p p4.photos.attached?

f5 = URI.open('https://res.cloudinary.com/diryp7blh/image/upload/v1590694253/art2heart/David_Michel_Ange.jpg')
p5 = Piece.new
p5.owner = f
p5.name ="le David"
p5.artist ="Michel-Ange"
p5.price = 631
p5.status ="available"
p5.category = "sculpture"
p5.photos.attach(io: f5, filename: 'David.jpg', content_type: 'image/jpg')
p5.save!
p p5.photos.attached?

p "#{Piece.count} pièces créées"

# Create Transactions
t1 = Transaction.new
t1.piece = p1
t1.user = g
t1.start = "2020-05-17"
t1.end = "2020-06-25"
t1.save!

p "#{Transaction.count} transaction créées"



