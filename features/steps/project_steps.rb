#require 'webrat'
#require 'rubygems'
#require 'firewatir'


Before do
    @project = Project.new
    #browser = Watir::Browser.start "http://www.milfont.org/"
    #browser.link(:text, "About").click
    #browser = Watir::Browser.start "http://www.itest2.com/"
    #browser.link(:text, "Downloads").click
    #browser.link(:text, "Install manually").click
    #pending "falta fazer"
end

Given /^um projeto com nome (.*)/ do |name|
    #Watir::Browser.default = "firefox"

    #browser.goto('http://www.milfont.org/tech')
    #browser.link(:text, "About").click
    #visit "http://localhost:3000/projects"
    #click_link "New project"
    #fill_in "name", :with => name
    #click_button "project_submit"
    #select "xcrum"
    @project.name = name
    #pending "falta fazer"
end

When /^solicitar a criação de um projetos$/ do
    @project.save
    #pending "falta fazer"
end

Then /^que um projeto com o nome Xcrum exista$/ do
    @project.name.should == "Xcrum"
    puts @project.id
    #pending "falta fazer"
end

