class ProgrammePeer < ActiveRecord::Base

  belongs_to :next,   class_name: Programme, foreign_key:'to_programme_id'
  belongs_to :previous ,class_name: Programme, foreign_key:'from_programme_id'

end
