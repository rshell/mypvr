

#
# schedule
#  entry
#
#   <entry pid="b00fgzr2">
#     <key>4aff88fc573290555638c44f946ce2782eb51f9a</key>
#     <pid>b00fgzr6</pid>
#     <service>bbc_radio_four_extra</service>
#     <title>The Goon Show: Tiddlywinks</title>
#     <synopsis>After defeat at the hands of Cambridge, Neddie Seagoon seeks his gameful revenge.</synopsis>
#     <availability start="2014-11-11T08:30:00Z" end="2014-11-18T08:30:00Z"/>
#     <broadcast pid="p02b03mm" version_pid="b00fgzr2" imi="imi:bds.tv/441293963" start="2014-11-11T08:00:00Z" end="2014-11-11T08:30:00Z" duration="1800"/>
#     <parents>
#       <parent pid="b0072vdz" type="Brand">The Goon Show</parent>
#     </parents>
#    <links>
#    <link type="mediaselector">http://www.bbc.co.uk/mediaselector/4/mtis/stream/b00fgzr2</link>
#   </links>
#  </entry>
#
#
class ChannelReader

  ROOT_URL='http://www.bbc.co.uk/radio/aod/availability/'

  CHANNELS = ['radio1','radio2','radio3','radio4','radio4extra','6music']

  attr_accessor :channel
  attr_accessor :response
  attr_accessor :data
  attr_accessor :entries

  def initialize(new_channel)
    self.channel =  new_channel
  end

  def url
    "#{ROOT_URL}#{channel}.xml"
  end

  def get
    self.response = HTTPI.get(url)
    self.data = Crack::XML.parse(self.response.body)
    self.entries = self.data["schedule"]["entry"]
  end

  def process
    self.entries.each do |hash|
      entry = ScheduleEntry.read(hash)
    end
  end
  #
  # Processes all channels
  #
  def ChannelReader.run
    CHANNELS.each do |channel|
      reader = ChannelReader.new(channel)
      reader.get
      reader.process
    end
    ScheduleEntry.fill_details
  end


end