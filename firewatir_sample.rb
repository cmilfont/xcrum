require 'rubygems'
require 'firewatir'
browser = Watir::Browser.start "http://www.milfont.org/"
browser.link(:text, "About").click
#browser.link(:text, "Install manually").click

