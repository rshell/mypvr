class Ownership < ActiveRecord::Base

  def Ownership.read(hash)
    puts hash.inspect

    x = Ownership.where(bbc_id:hash['id']).first || Ownership.new
    x.key = hash['key']
    x.bbc_id = hash['id']
    x.style = hash['type']
    x.save
    x
  end

end
