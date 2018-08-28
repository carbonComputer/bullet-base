class Form < ApplicationRecord
  has_many :form_requests
  belongs_to(
    :current_form_request,
    class_name: 'FormRequest',
    inverse_of: :form,
    autosave: true,
    required: false,
  )
end
