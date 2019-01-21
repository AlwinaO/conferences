class Conference < ActiveRecord::Base

  belongs_to :user

  def conference_date
    self.date.strftime("%A %B %e %Y")
  end
end
