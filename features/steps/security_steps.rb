Dado /^um usuario$/ do
	@project = Project.new
end

Quando /^for instanciado$/ do
	@project.name = 'teste'
end

Então /^verificar se observou$/ do
	@project.save
end

