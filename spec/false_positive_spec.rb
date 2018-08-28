require 'rails_helper'

RSpec.describe 'false positive' do

  def create_records
    form1 = Form.new
    form2 = Form.new
    form3 = Form.new

    Form.import! [form1, form2, form3]

    recipient1 = Recipient.create first_name: 'bob', last_name: 'seger'
    recipient2 = Recipient.create first_name: 'steph', last_name: 'curry'
    recipient3 = Recipient.create first_name: 'xsteph', last_name: 'xcurry'

    form_request1 = FormRequest.create form: form1, recipient: recipient1
    form_request2 = FormRequest.create form: form2, recipient: recipient2
    form_request3 = FormRequest.create form: form3, recipient: recipient3

    form1.update! current_form_request: form_request1
    form2.update! current_form_request: form_request2
    form3.update! current_form_request: form_request3
  end

  it 'exists' do
    create_records
    expect(Form.all_first_names).to be_present
  end

  it 'should not exist' do
    create_records
    expect(Form.all_last_names).to be_present
  end

  # it 'exists' do
  #   Bullet.profile do
  #     expect(Form.all_first_names).to be_present
  #   end
  # end

  # it 'should not exist' do
  #   Bullet.profile do
  #     expect(Form.all_last_names).to be_present
  #   end
  # end

  # after do
  #   Form.delete_all
  #   FormRequest.delete_all
  #   Recipient.delete_all
  # end

end
