class FormRequest < ApplicationRecord
  belongs_to :form, inverse_of: :form_requests, touch: true
  belongs_to :recipient, inverse_of: :form_requests
end
