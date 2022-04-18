# frozen_string_literal: true

RSpec::Matchers.define :have_one do |resource, klass|
  match do |actual|
    expect(actual.send(resource).class).to eq(klass)
  end
end
