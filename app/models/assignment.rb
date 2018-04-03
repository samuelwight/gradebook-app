class Assignment < ApplicationRecord
  belongs_to :course

  def self.get_letter_grade(average)
    if (average <= 100.0) && (average >= 90.0)
      return 'A'
    elsif (average < 90.0) && (average >= 80.0)
      return 'B'
    elsif (average < 80.0) && (average >= 70.0)
      return 'C'
    elsif (average < 70.0) && (average >= 60.0)
      return 'D'
    else
      return 'F'
    end
  end
end
