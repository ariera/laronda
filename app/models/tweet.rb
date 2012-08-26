class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.create_from_search_results(results, query)
    results.each do |result|
      next if Tweet.find_by_id_str(result.attrs[:id_str]).present?
      tweet = self.new
      [:from_user, :from_user_id_str, :from_user_name, :geo, :id_str, :iso_language_code, :metadata, :profile_image_url, :profile_image_url_https, :source, :text, :to_user, :to_user_id_str, :to_user_name].each do |attr|
        tweet.send("#{attr}=", result.attrs[attr]) 
      end
      tweet.t_created_at = result.created_at
      tweet.query = query
      tweet.save
    end
  end

  def self.not_deleted
    where(deleted:false)
  end

  def self.deleted
    where(deleted:true)
  end

  def self.by_date(date)
    where(["DATE(t_created_at) = ?", date.to_date])
  end


  def self.last_tweet(query)
    Tweet.where(query:query).order(:id_str).first  
  end


  def self.find_for_laronda
    self.search_and_persist('to:riderstate')
    self.search_and_persist('to:dportsinlimites')
    self.search_and_persist('#laronda')
  end

  def self.search_and_persist(query='')
    last_tweet = self.last_tweet(query)
    results = Twitter.search(query, rpp:100, since_id: last_tweet.try(:id_str)).results
    self.create_from_search_results(results, query)
  end

  def url
    "http://twitter.com/#{self.from_user}/status/#{self.id_str}"
  end

  def mark_as_deleted!
    update_attribute(:deleted, true)
  end
  def undelete!
    update_attribute(:deleted, false)
  end


end
