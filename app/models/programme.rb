class Programme < ActiveRecord::Base

  ROOT_URL = 'http://www.bbc.co.uk/programmes/'
  attr_accessor :response
  attr_accessor :data

  belongs_to :ownership
  belongs_to :parent,class_name: Programme, foreign_key:'parent_id'

  has_many :versions

  has_many :programme_categories
  has_many :categories,:through=>:programme_categories

  has_many :to_programme_piers, class_name: ProgrammePeer, foreign_key:'from_programme_id'
  has_many :next,:through=>:to_programme_piers,:source=> :next

  has_many :from_programme_piers, class_name: ProgrammePeer, foreign_key:'to_programme_id'
  has_many :previous,:through=>:from_programme_piers,:source=> :previous


  def Programme.get(pid)
    response = HTTPI.get("#{ROOT_URL}#{pid}.xml")
    Crack::XML.parse(response.body)
  end


  def Programme.find_or_create_by_pid(pid)
    ##x = Programme.pid(pid) ||
    Programme.fill(pid)
  end

  def Programme.pid(pid)
    Programme.where(pid: pid).first
  end

  def Programme.fill(pid)
    data = Programme.get(pid)
    Programme.read(data['programme'])
  end


  def Programme.read(hash)
    puts hash.inspect
    programme = Programme.where(pid:hash['pid']).first || Programme.new
    ["pid", "title",'short_synopsis','medium_synopsis','long_synopsis'].each do |key|
      programme.send("#{key}=",hash[key])
    end
    programme.style = hash['type']
    programme.save
    programme.read_parent(hash['parent'])
    programme.read_peers(hash['peers'])
    programme.read_categories(hash['categories'])
    programme.reload
    programme
  end


  def read_parent(hash)
    if hash.is_a?(Hash)
      if hash['programme']
        self.parent =  Programme.find_or_create_by_pid(hash['programme']['pid'])
        self.save
      else
        logger.warn "Unexpected programme parent #{hash.inspect}"
      end
    end
  end

  def read_peers(hash)
    if hash.is_a?(Hash)
      if hash['previous']
        self.previous =   Programme.find_or_create_by_pid(hash['previous']['pid'])
        self.save
      end
      if hash['next']
        self.next =  Programme.find_or_create_by_pid(hash['next']['pid'])
        self.save
      end
    end
  end

  def read_categories(hash)
    return  unless hash.is_a?(Hash) && hash['category']
    if hash['category'].is_a?(Array)
      hash['category'].each do |i|
        x =Category.read(i)
        self.categories << x if x
      end
    elsif hash['category'].is_a?(Hash)
      x =  Category.read(hash['category'])
      self.categories << x if x
    end
  end
end
