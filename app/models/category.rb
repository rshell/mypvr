class Category < ActiveRecord::Base

  def Category.read(hash)
    puts hash.inspect

    if hash.is_a?(Hash) and hash[:key]
    category = Category.where(key:hash['key']).first || Category.new
    ["key", "title"].each do |key|
       category.send("#{key}=",hash[key])
    end
    category.bbc_id=hash['id']
    category.style = hash['type']
    category.save
    category
    else
      logger.warn "bad Category hash #{hash.inspect}"
      nil
    end
  end

end
