

describe "User creation", type: :feature do 
    before do
        visit new_user_path
        fill_in "Username", with: "SantiSalazar"
        fill_in "Password", with: "1234567"
        fill_in "Bio", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        click_button "Create User"
    end