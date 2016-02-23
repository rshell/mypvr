class SegmentEvent < ActiveRecord::Base

  belongs_to :verison
  belongs_to :segment


  def SegmentEvent.read(hash)
    x = SegmentEvent.where(bbc_id:hash['id']).first || SegmentEvent.new
    x.key = hash['key']
    x.bbc_id = hash['id']
    x.style = hash['type']
    x.save
    x
  end

end
