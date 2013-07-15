namespace :db do
   desc "Fill database with initial user"
   task populate: :environment do
      User.create!(name: "Kwaku Farkye",
               email: "kwafarkye@gmail.com",
               password: "15player",
               password_confirmation: "15player",
               admin: "true")
   end
end