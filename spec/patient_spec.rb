require('spec_helper')
require('pry')

describe '#Patient' do

before(:each)do 
  @doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id=> nil})
  @doctor.save()
end 

  describe('.all') do
    it("it should return a list of all the patients") do
      patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient.save()
      patient2 = Patient.new({:name => "Chubbs", :birthday => "2002-07-04", :id => nil, :doctor_id => @doctor.id})
      patient2.save()
      expect(Patient.all).to(eq([patient, patient2]))
    end
  end

  describe('#==') do
    it('returns the same patient if two patients have the same attributes') do
      patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient.save()
      patient2 = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient2.save()
      expect(patient).to(eq(patient2))
    end
  end

  describe('#save') do
  it("saves a song") do
    patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
    patient.save()
    expect(Patient.all).to(eq([patient]))
  end
end

  describe('.find') do
    it('finds a patient by ID') do
      patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient.save()
      patient2 = Patient.new({:name => "Chubbs", :birthday => "2002-07-04", :id => nil, :doctor_id => @doctor.id})
      patient2.save()
      expect(Patient.find(patient.id)).to(eq(patient))
    end
  end

  describe('#update') do
    it("updates an patient by id") do
      patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient.save()
      patient.update("Angry")
      expect(patient.name).to(eq("Angry"))
    end
  end

  describe('#delete') do
    it("deletes an patient by id") do
      patient = Patient.new({:name => "Sleepy", :birthday => "1999-01-01", :id => nil, :doctor_id => @doctor.id})
      patient.save()
      patient2 = Patient.new({:name => "Chubbs", :birthday => "2002-07-04", :id => nil, :doctor_id => @doctor.id})
      patient2.save()
      patient.delete()
      expect(Patient.all).to(eq([patient2]))
    end
  end

end