class Segment < ActiveRecord::Base

  def Segment.read(hash)
    x = Segment.where(bbc_id:hash['id']).first || Segment.new
    x.key = hash['key']
    x.bbc_id = hash['id']
    x.style = hash['type']
    x.save
    x
  end

end
