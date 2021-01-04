module Api::ConsultancyHelper
  def calculate_rating(old_score, new_score, count_consultancies)
    (old_score + ((new_score - old_score) / (count_consultancies + 1))).floor(2)
  end
end
