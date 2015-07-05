class Kid < ActiveRecord::Base
  has_one :bucket

  def pig_out(n)
    n = self.bucket.candies.size if (n > self.bucket.candies.size)
    n.times { |n|
      self.bucket.candies.delete(self.bucket.candies.last)
    }
    pig_out_feeling(n)
  end

  def pig_out_feeling(candies_eaten)
    if candies_eaten >= 3
      self.feeling = "Sick"
    elsif candies_eaten > 0
      self.feeling = "Happy"
    end
    self.save
  end

  def feeling_output
    self.feeling if self.feeling
  end

  def bucket_output
    if self.bucket
      self.bucket
    else
      Bucket.new
    end
  end
end
