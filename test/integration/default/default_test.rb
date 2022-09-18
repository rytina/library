
# This is an example test, replace with your own test.
describe user('root') do
  it { should exist }
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should_not be_listening }
end
