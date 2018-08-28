class Form < ApplicationRecord
  has_many :form_requests
  belongs_to(
    :current_form_request,
    class_name: 'FormRequest',
    inverse_of: :form,
    autosave: true,
  )

  def self.all_first_names
    all.map do |form|
      form.current_form_request.recipient.first_name
    end
  end

  def self.all_last_names
    all.includes( :current_form_request => :recipient).map do |form|
      form.current_form_request.recipient.last_name
    end
  end
end
