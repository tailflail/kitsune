class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # convert 'YY-MM-DD HH:MM:SS UTC' to 'HH:MM:SS'
  def creation_date
    created = DateTime.parse(self.created_at.to_s)
    date = created.strftime("#{created.day.ordinalize} %b %Y")
    "#{date}"
  end

  def creation_time
    created = DateTime.parse(self.created_at.to_s)
    time = created.strftime('%R')
    "#{time}"
  end
end
