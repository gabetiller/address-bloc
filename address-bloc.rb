require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "Welcome to AddresBloc!"

menu.main_menu
