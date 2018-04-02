class Course < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  
  def self.each_year(array)
    years = []
    array.each do |course|
      years.push(course.year) unless years.include? course.year
    end

    years.each do |year|
      yield(year, array.select {|course| course.year.equal? year})
    end
  end
end
