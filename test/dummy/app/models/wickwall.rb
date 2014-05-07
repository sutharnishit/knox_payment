class Wickwall < ActiveRecord::Base
 acts_as_knox yaffle_text_field: :last_tweet
end
