it "displays the user's name" do
    within "h1" do
      expect(page).to have_content(user.name)
    end
  end