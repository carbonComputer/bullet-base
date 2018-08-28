require 'rails_helper'

RSpec.describe 'false positive' do

  def create_records
    form1 = Form.create!
    form2 = Form.create!
    form3 = Form.create!

    recipient1 = Recipient.create first_name: 'bob', last_name: 'seger'
    recipient2 = Recipient.create first_name: 'steph', last_name: 'curry'
    recipient3 = Recipient.create first_name: 'mike', last_name: 'shinoda'

    form_request1 = FormRequest.create! form: form1, recipient: recipient1
    form_request2 = FormRequest.create! form: form2, recipient: recipient2
    form_request3 = FormRequest.create! form: form3, recipient: recipient3

    form1.update! current_form_request: form_request1
    form2.update! current_form_request: form_request2
    form3.update! current_form_request: form_request3

    [form1, form2, form3]

  end

  it 'exists' do
    forms = create_records
    Bullet.profile do
      forms.each do |form|
        expect(form.association(:current_form_request)).to be_loaded
        expect(form.current_form_request.association(:recipient)).to be_loaded
        expect(form.current_form_request.recipient).to be_present
      end
    end
  end

end
