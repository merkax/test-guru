module Admin::BadgesHelper
  def by_category
    Badge::RULES[0]
  end

  def first_attempt
    Badge::RULES[1]
  end

  def by_level
    Badge::RULES[2]
  end
end
