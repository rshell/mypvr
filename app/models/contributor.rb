class Contributor < ActiveRecord::Base
  #
  # segment
  # version
  #

  def Contributor.read(hash)
    puts hash.inspect
    if hash.is_a?(Hash) and hash['name']
      x = Contributor.where( name: hash['name'] ).first || Contributor.new
      ["name", 'role', 'given_name', 'family_name', 'character_name'].each do |key|
        x.send("#{key}=", hash[key])
      end
      x.save
    end
    x
  end

end
