require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/project")
require("./lib/division")
require("pg")
also_reload("lib/**/*.rb")

get('/') do
  erb(:index)
end

get('/hr_manager') do
  @divisions = Division.all()
  erb(:hr_manager)
end

get('/divisions/new') do
  erb(:division_form)
end

post('/divisions') do
  name = params.fetch("name")
  division = Division.new({:name => name, :id => nil})
  division.save()
  erb(:success)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = @division.employees()
  erb(:division)
end

get('/project_manager') do
  @projects = Project.all()
  erb(:project_manager)
end

get('/projects/new') do
  erb(:project_form)
end
