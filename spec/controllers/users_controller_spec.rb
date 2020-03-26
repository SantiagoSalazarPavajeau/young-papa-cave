let(:user) { User.find_by(username: "SantiSalazar") }

it "creates a user" do
    expect(user).to_not be_nil
end

it "redirects to the new user home page" do
    expet(current_path).to eq(user_path(user))
end