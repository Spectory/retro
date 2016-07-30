FactoryGirl.define do
  factory :note do
    title 'title'
    body  'body'
    note_type 'positive'
    create_by 'someone'
  end
end
