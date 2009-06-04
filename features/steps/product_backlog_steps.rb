Dado /^um item com descrição "([^\"]*)"$/ do |description|
	@item = Factory.build(:item, :description => description)
	#puts @item.description
end

Quando /^inserir o item que desejo$/ do
	@item.project = @project
	@item.save
end

Então /^o item será inserido numa lista conhecida como product backlog$/ do
	@project.items.count.should == 1
end

Então /^o item não estará atribuído a nenhum sprint$/ do
  pending
end

Então /^receberei a mensagem "([^\"]*)"$/ do |arg1|
	puts arg1
  pending
end

