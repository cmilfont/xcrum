puts 'escreva alguma coisa antes'

Factory.define :item do |u|
	u.description "Qual a descricao?"
end

Factory.sequence :controle do |con|
	@item1 = Factory.build(:item, :description => "Milfont#{con}")
end

#puts Factory.next(:controle).description
#item1 = Factory.next :controle
#puts item1.description
#puts 'escreva alguma coisa depois'

#Factory.sequence :email do |n|
#    "person#{n}@example.com"
#end
#puts  Factory.next :email
  # => "person1@example.com"

#puts  Factory.next :email
  # => "person2@example.com"

