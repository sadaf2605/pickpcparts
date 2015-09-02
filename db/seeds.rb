# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

load "spec/factories.rb"


ActiveRecord::Base.connection.tables.map(&:classify)
  .map{|name| name.constantize if Object.const_defined?(name)}
  .compact.each(&:delete_all)

FactoryGirl.create(:admin_user)
  
5.times do
	FactoryGirl.create(:cpu_socket)
end
20.times do
	FactoryGirl.create(:cpu)
end