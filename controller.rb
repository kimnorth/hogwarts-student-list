require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')

# CREATE

get '/hogwarts/new' do
  @random_house = Student.new_sorting_hat()
  erb(:new)
end

# SUBMIT (update table)

post '/hogwarts/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# FIND ALL

get '/hogwarts/students' do
  @students = Student.all()
  erb (:index)
end