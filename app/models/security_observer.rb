class SecurityObserver < ActiveRecord::Observer
	observe :project

	def after_save(model)
		puts "codigo de segurança checado => " + model.to_s()
	end

	def before_initialize(model)
		puts "codigo de segurança checado no new => "
	end

	def before_save(model)
		puts "You have initialized an object!"
	end

end

