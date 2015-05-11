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

get('/project_manager') do
  @projects = Project.all()
  erb(:project_manager)
end
