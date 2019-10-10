# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# edit
=begin
GroupDefinition.create(uuid:"1",name:"Kunde",action:"edit",model:"customer")
BlockDefinition.create(uuid:"1",name:"Daten",gduuid:"1", blocktype:"edit")
FieldDefinition.create(uuid:"1",name:"Firmenname",field_name:"name",field_type:"string",bduuid:"1",min:4,max:64,is_required:true)
FieldDefinition.create(uuid:"2",name:"Adresse",field_name:"address",field_type:"string",bduuid:"1",min:4,max:255,is_required:true)
FieldDefinition.create(uuid:"3",name:"Kommentar",field_name:"comment",field_type:"text",bduuid:"1")
FieldDefinition.create(uuid:"4",name:"Anzahl Mitarbeiter",field_name:"employees",field_type:"numeric",bduuid:"1")
FieldDefinition.create(uuid:"5",name:"Insolvent",field_name:"is_broke",field_type:"boolean",bduuid:"1")
FieldDefinition.create(uuid:"6",name:"Klassifizierung",field_name:"customer_grade_id",field_type:"relation",bduuid:"1",lookup:"CustomerGrade.all",id_column:"id",value_column:"name")
# show
GroupDefinition.create(uuid:"2",name:"Kunde",action:"show",model:"customer")
BlockDefinition.create(uuid:"2",name:"",gduuid:"2", blocktype:"show")
FieldDefinition.create(uuid:"7",name:"Firmenname",field_name:"name",field_type:"headline",bduuid:"2")
FieldDefinition.create(uuid:"8",name:"Adresse",field_name:"address",field_type:"map",bduuid:"2")
FieldDefinition.create(uuid:"9",name:"Kommentar",field_name:"comment",field_type:"text",bduuid:"2")
FieldDefinition.create(uuid:"10",name:"Anzahl Mitarbeiter",field_name:"employees",field_type:"normal",bduuid:"2")
FieldDefinition.create(uuid:"11",name:"Insolvent",field_name:"is_broke",field_type:"normal",bduuid:"2")
FieldDefinition.create(uuid:"12",name:"Klassifizierung",field_name:"customer_grade_id",field_type:"relation",bduuid:"2",lookup:"CustomerGrade.all",id_column:"id",value_column:"name")
# list
GroupDefinition.create(uuid:"3",name:"Kunden",action:"list",model:"customer")
BlockDefinition.create(uuid:"3",name:"list",gduuid:"3", blocktype:"list")
=end
#Test-Data
#CustomerGrade.create(name:'A')
#CustomerGrade.create(name:'B')
#CustomerGrade.create(name:'C')
#CustomerGrade.create(name:'D')
#CustomerGrade.create(name:'E')
#Customer.create(name:"Test-Kunde", address: "Teststr. 123, 80336 München", comment:"Blub", employees:rand(1..60000), is_broke:false)
#Customer.create(name:"Zweiter Testkunde GmbH", address: "Unbekanntestr. 123, 82131 Gauting", comment:"Langer Text über diese Firma", employees:rand(1..60000), is_broke:false)

# Five seed users always have same email format

users = [
  'firstuser@example.com',
  'seconduser@example.com',
  'thirduser@example.com',
  'fourthuser@example.com',
  'fifthuser@example.com'
]

#################################
# Create Users                  #
#################################
users.each do |user|

  # Create each user in the user array
  User.create(
    email: user,
    # keep sign-in count > 0 for possible future functionality
    sign_in_count: 5,
    # CHANGE username limits to reflect your site policies
    user_name: Faker::Internet.user_name(5..12),
    password: 'password',
    password_confirmation: 'password'
  )
end

#################################
# Create Notes                  #
#################################


