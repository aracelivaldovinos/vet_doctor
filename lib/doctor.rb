class Doctor
  attr_accessor :name, :specialty
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end
 

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(doctor_to_compare)
    self.name == doctor_to_compare.name
  end

  def self.find(id)
    returned_ids = DB.exec("SELECT * FROM doctors WHERE id = #{id};").first
    name = returned_ids.fetch('name')
    specialty = returned_ids.fetch('specialty')
    id = returned_ids.fetch('id').to_i
    Doctor.new({:name => name, :specialty => specialty, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE doctors SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM doctors WHERE id = #{@id};")
  end

end