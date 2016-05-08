module InteractionsHelper
  def interact(weight,city)
    if current_user
      interaction = Interaction.create({:weight => weight, :city_id => city.id})
      current_user.interactions << interaction
      current_user.save
      interaction
    end
  end

  def advertised_city
    if current_user && current_user.interactions.count > 0
    hash = {}
    ints = current_user.interactions
    ints.each do |interaction|
      time_weight = 0
      if (3600 - (Time.now.to_i - 1462670966)).to_f/3600 > 0
        time_weight = (3600 - (Time.now.to_i - 1462670966)).to_f/3600
      end
      val = interaction.weight.to_f * (time_weight + 1)
      if hash[interaction.city.name].nil?
        hash[interaction.city.name] = val
      else
        hash[interaction.city.name] += val
      end
    end
    sorted = hash.sort_by {|city,total| -total}
    if sorted.length >= 3
      city = sorted[rand(3)-1][0]
    else
      city = sorted[0][0]
    end
    # flash[:ad] = "Visit #{city} today!"
    # top_three[0].to_s
    end
  end

  def top_three_ints
    if current_user && current_user.interactions.count > 0
      all = current_user.interactions.limit(3).group(:city).sum(:weight)
      top_three = []
      all.each {|key,val| top_three << "#{key.name}: #{val}"}
      top_three
    end
  end
end
