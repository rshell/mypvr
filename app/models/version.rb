class Version < ActiveRecord::Base

  belongs_to :programme

  has_many :segment_events
  has_many :segments,:through=> :segment_events
  has_many :broadcasts
  has_many :availabilities


  def Version.read(hash)
    puts hash.inspect
    version = Version.where(pid:hash['pid']).first || Version.new
    ["pid", "duration"].each do |key|
      version.send("#{key}=",hash[key])
    end
    version.read_parent(hash['parent'])
    version.save
    version.read_contributors(hash['contributors'])
    version.read_broadcasts(hash['broadcasts'])
    version.read_availabilities(hash['availabilities'])
    version.reload
    version
  end


  def read_parent(hash)
    if hash.is_a?(Hash) && hash['programme']
      self.programme = Programme.find_or_create_by_pid(hash['programme']['pid'])
    end
  end

  def read_contributors(hash)
    if hash.is_a?(Array)
      hash.each{|i| Contributors.read(self,i['contributor'])}
    elsif hash.is_a?(Hash) && hash['contributor']
      Contributor.read(hash['contributor'])
    end
  end

  def read_broadcasts(hash)
    if hash.is_a?(Array)
        hash.each{|i| Broadcast.read(self,i['broadcast'])}
     elsif hash.is_a?(Hash) && hash['broadcast']
       Broadcast.read(self,hash['broadcast'])
     end
  end

  def read_availabilities(availabilities)
    if hash.is_a?(Array)
      hash.each{|i|  Availability.read(self,i['availabilities'])}
    elsif hash.is_a?(Hash) && hash['availability']
      Availability.read(self,hash['availability'])
    end

  end


end
