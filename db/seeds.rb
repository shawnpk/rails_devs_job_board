User.delete_all
Job.delete_all

admin = User.new(email: 'john.doe@example.com', 
                 password: 'fakepass', 
                 password_confirmation: 'fakepass', 
                 admin: true, 
                 developer: true, 
                 employer: true)
admin.skip_confirmation!
admin.save

developer = User.new(email: 'developer@example.com', 
                     password: 'fakepass', 
                     password_confirmation: 'fakepass', 
                     admin: false, 
                     developer: true, 
                     employer: false)
developer.skip_confirmation!
developer.save

employer = User.new(email: 'employer@example.com', 
                    password: 'fakepass', 
                    password_confirmation: 'fakepass', 
                    admin: false, 
                    developer: false, 
                    employer: true)
employer.skip_confirmation!
employer.save

Job.create!(company_name: 'Google', 
            company_website: 'https://google.com', 
            compensation_range: '170,000 - 180,000', 
            compensation_type: 'Full-time', 
            estimated_hours: nil,
            featured: false,
            featured_until: nil,
            headquarters: 'California',
            link_to_apply: 'https://google.com/apply',
            price: 199,
            published_at: DateTime.now,
            remote: false,
            slug: 'rails-developer-at-google',
            status: 'published',
            title: 'Rails Developer at Google',
            upsell_type: nil,
            years_of_experience: '5',
            user_id: admin.id,
            description: Faker::Hipster.paragraph,
            company_description: Faker::Hipster.paragraph
          )

Job.create!(company_name: 'Dropbox', 
            company_website: 'https://dropbox.com', 
            compensation_range: nil, 
            compensation_type: 'Contract', 
            estimated_hours: '100+',
            featured: false,
            featured_until: nil,
            headquarters: 'California',
            link_to_apply: 'https://dropbox.com/apply',
            price: 299,
            published_at: DateTime.now,
            remote: true,
            slug: 'ruby-developer-at-dropbox',
            status: 'published',
            title: 'Ruby Developer at Dropbox',
            upsell_type: 'best',
            years_of_experience: '5',
            user_id: employer.id,
            description: Faker::Hipster.paragraph,
            company_description: Faker::Hipster.paragraph
          )

Job.create!(company_name: 'Apple', 
            company_website: 'https://apple.com', 
            compensation_range: '240,000 - 250,000', 
            compensation_type: 'Full-time', 
            estimated_hours: nil,
            featured: false,
            featured_until: nil,
            headquarters: 'California',
            link_to_apply: 'https://apple.com/apply',
            price: 199,
            published_at: DateTime.now,
            remote: false,
            slug: 'ruby-developer-at-apple',
            status: 'published',
            title: 'Ruby Developer at Apple',
            upsell_type: 'best',
            years_of_experience: '8',
            user_id: employer.id,
            description: Faker::Hipster.paragraph,
            company_description: Faker::Hipster.paragraph
          )

puts "Created #{User.count} users"
puts "Created #{Job.count} jobs"