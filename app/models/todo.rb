class Todo < ApplicationRecord
  before_save :set_completed_at

  def set_completed_at
    self.completed_at = completed ? Time.now : nil if completed_changed?
  end
end
