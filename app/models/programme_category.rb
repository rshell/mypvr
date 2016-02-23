class ProgrammeCategory < ActiveRecord::Base
  belongs_to :programme
  belongs_to :category
end
