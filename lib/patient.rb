class Patient
  attr_accessor :name, :birthday, :doctor_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:doctor_id)
  end
 

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      id = patient.fetch("id").to_i
      doctor_id = patient.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :id => id, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', '#{@doctor_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i

  end

  def ==(patient_to_compare)
    self.name == patient_to_compare.name
  end

  def self.find(id)
    returned_ids = DB.exec("SELECT * FROM patients WHERE id = #{id};").first
    name = returned_ids.fetch('name')
    birthday = returned_ids.fetch('birthday')
    id = returned_ids.fetch('id').to_i
    doctor_id = returned_ids.fetch("doctor_id").to_i
    Patient.new({:name => name, :birthday => birthday, :id => id, :doctor_id => doctor_id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE patients SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id};")
  end

  def doctor
    Doctor.find(@doctor_id)
  end

  def self.find_by_doctor(doc_id)
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM patients WHERE doctor_id = #{doc_id};")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :doctor_id => doc_id, :id => id}))
    end
    doctors
  end
end