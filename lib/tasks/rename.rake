

task :rename do

  root = "/Volumes/tv1/Films"

  Dir["#{root}/**/*.*"].each do |entry|
    dir= File.dirname(entry)
    filename = File.basename(entry)

    if /^(.*)\.([A-Za-z0-9]*)$/ =~ filename
      name = $1
      ext =$2
      if /(.*)\_\-\_(.*)/ =~ name
        series = $1
        episode =$2
        if episode.include?(series)
           if /^(.*)_(b[0-9a-z]*)\_default$/ =~ episode
             episode = $1
             puts "mv  #{entry} #{dir}/#{episode}.#{ext}"
             FileUtils.mv entry, "#{dir}/#{episode}.#{ext}"
           else
             puts "mv  #{entry} #{dir}/#{episode}.#{ext}"
             FileUtils.mv entry, "#{dir}/#{episode}.#{ext}"
           end
        else
          puts "skipped #{series} in #{episode}"
        end
      else
        puts "skipped filenmae #{filename}"
      end
    else
      puts "skipped entry #{entry}"
    end
  end

end