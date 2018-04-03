class Course < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  has_many :averages, dependent: :destroy
  
  def self.each_year(array)
    years = []
    array.each do |course|
      years.push(course.year) unless years.include? course.year
    end

    years.each do |year|
      yield(year, array.select {|course| course.year.equal? year})
    end
  end

  def self.get_courses(user, pass)
    authCode = JSON.parse(HTTP.get("http://localhost:7070/login?username=#{user}&password=#{pass}").to_s)['data']['authCode']
    years = JSON.parse(HTTP.get("http://localhost:7070/getYears?authCode=#{authCode}").to_s)['data']

    years.each do |year|
      nineWeeks = JSON.parse(HTTP.get("http://localhost:7070/getNineWeeks?authCode=#{authCode}&yearId=#{year['id']}").to_s)['data']
      nineWeeks.each_with_index do |week, index|
        actual_year =  year['name'].split(//).last(7).first(4).join.to_i
        if (index.equal? 0) || (index.equal? 1)
          current_semester = 1
        else
          current_semester = 2
          actual_year += 1
        end
        classes = JSON.parse(HTTP.get("http://localhost:7070/getClasses?authCode=#{authCode}&nineWeeksId=#{week['id']}&yearId=#{year['id']}").to_s)['data']
        classes.each do |course|
          current_user.courses.build(name: course['name'], teacher: course['teacher'], period: course['period'], semester: current_semeter, year: actual_year, year_id: year['id'].to_i, nine_weeks_id: week['id'].to_i)
          sleep(1)
        end
        sleep(1)
      end
      sleep(1)
    end
  end
end
