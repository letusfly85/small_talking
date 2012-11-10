class MsUser < ActiveRecord::Base
  attr_accessible :language, :mailaddress, :name
end
