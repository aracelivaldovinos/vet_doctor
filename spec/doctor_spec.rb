require('spec_helper')

describe '#Doctor' do

  describe('.all') do
    it("it should return a list of all the doctors") do
      doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Snuggles", :specialty => "cuddling", :id => nil})
      doctor2.save()
      expect(Doctor.all).to(eq([doctor, doctor2]))
    end
  end

  describe('#==') do
    it('returns the same doctor if two doctors have the same attributes') do
      doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor2.save()
      expect(doctor).to(eq(doctor2))
    end
  end

  describe('.find') do
    it('finds a doctor by ID') do
      doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor2.save()
      expect(Doctor.find(doctor.id)).to(eq(doctor))
    end
  end

  describe('#update') do
    it("updates an doctor by id") do
      doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor.save()
      doctor.update("Sparky")
      expect(doctor.name).to(eq("Sparky"))
    end
  end

  describe('#delete') do
    it("deletes an doctor by id") do
      doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Snuggles", :specialty => "cuddling", :id => nil})
      doctor2.save()
      doctor.delete()
      expect(Doctor.all).to(eq([doctor2]))
    end
  end
#   describe('#songs') do
#   it("returns an album's songs") do
#     album = Album.new({:name => "A Love Supreme", :id => nil, :release_year => 2003, :cost => 1.0})
#     album.save()
#     song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
#     song.save()
#     song2 = Song.new({:name => "Cousin Mary", :album_id => album.id, :id => nil})
#     song2.save()
#     expect(album.songs).to(eq([song, song2]))
#   end
# end

end