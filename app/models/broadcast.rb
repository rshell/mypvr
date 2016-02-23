class Broadcast < ActiveRecord::Base

  def Broadcast.read(version,hash)
    puts hash.inspect
    if hash.is_a?(Hash)
      x = Broadcast.where(pid:version.pid,start_at:hash['start']).first || Broadcast.new
      x.pid = version.pid
      x.start_at = hash['start']
      x.end_at = hash['end']
      x.duration = hash['duration']
      x.service = hash['service']['id'] if hash['service']
      x.save
      # version.broadcasts << x
    else
      nil
    end

  end

end
