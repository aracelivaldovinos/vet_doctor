require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
require('pry')
also_reload('lib/**/*.rb')
require 'pg'


DB = PG.connect({:dbname => "vetdoc"})

get('/') do
  redirect to('/doctors')
end

get('/doctors') do
  @doctors = Doctor.all
  erb(:doctors)
end

get('/doctors/new') do
  erb(:new_doctor)
end

post('/doctors') do
  name = params[:doctor_name]
  specialty = params[:specialty]
  doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  doctor.save()
  @doctor = Doctor.all()
  redirect to('/doctors')
end

get('/doctors/:id') do
  @doctor = Doctor.find(params[:id].to_i())
  erb(:doctor)
end

get('/doctors/:id/edit') do
  @doctor = Doctor.find(params[:id].to_i())
  erb(:edit_doctor)
end

# patch('/doctors/:id') do
#   @doctor = Doctor.find(params[:id].to_i())
#   @doctor.update(params[:name])
#   redirect to('/doctors')
# end

# delete('/doctors/:id') do
#   @doctor = Doctor.find(params[:id].to_i())
#   @doctor.delete()
#   redirect to('/doctors')
# end

get('/doctors/newpatient') do
  erb(:patients)
end

# get('/doctors/:id/patients/:patient_id') do
#   @patient = Patient.find(params[:patient_id].to_i())
#   erb(:patient)
# end

post('/doctors/:id/patients') do
  @doctor = Doctor.find(params[:id].to_i())
  patient = Patient.new({:name => params[:patient_name], :doctor_id => @doctor.id, :id => nil})
  patient.save()
  erb(:doctor)
end

# patch('/doctors/:id/patients/:patient_id') do
#   @doctor = Doctor.find(params[:id].to_i())
#   patient = Patient.find(params[:patient_id].to_i())
#   patient.update(params[:name], @doctor.id)
#   erb(:doctor)
# end

# delete('/doctors/:id/patients/:patient_id') do
#   patient = Patient.find(params[:patient_id].to_i())
#   patient.delete
#   @doctor = Doctor.find(params[:id].to_i())
#   erb(:doctor)
# end