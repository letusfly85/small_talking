class RsStory < ActiveRecord::Base
  attr_accessible :category, :contents, :summary, :title, :user_id
end
