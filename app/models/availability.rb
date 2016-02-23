class Availability < ActiveRecord::Base



  def Availability.read(version,hash)
    puts hash.inspect
    x = Availability.where(pid:version.pid,started_at:hash['start']).first || Availability.new
    x.pid = version.pid
    x.version = version
    x.start_at = hash['start']
    x.ended_at = hash['end']
    x.save
    version
  end
end
