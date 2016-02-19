require 'linkedin_scraper'
require 'openssl'
require 'json'

class Test
end

I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

i = 0

IO.foreach('links_2K-3K.txt') do |line|
  begin
    i += 1
    puts(i.to_s + ". Link: " + line)
    split_link = line.split('/')[-1].chomp

    profile = Linkedin::Profile.get_profile(line)

    profile.first_name          # The first name of the contact
    profile.last_name           # The last name of the contact
    profile.name                # The full name of the profile
    profile.title               # The job title
    profile.summary             # The summary of the profile
    profile.location            # The location of the contact
    profile.country             # The country of the contact
    profile.industry            # The domain for which the contact belongs
    profile.picture             # The profile picture link of profile
    profile.skills              # Array of skills of the profile
    profile.organizations       # Array organizations of the profile
    profile.education           # Array of hashes for education
    profile.websites            # Array of websites
    profile.groups              # Array of groups
    profile.languages           # Array of languages
    profile.certifications      # Array of certifications
    profile.number_of_connections # The number of connections as a string
    profile.current_companies
    profile.past_companies
    profile.recommended_visitors

    linkedinprofile = {
        "First_Name" => profile.first_name,
        "Last_Name" => profile.last_name,
        "Full_Name" => profile.name,
        "Title" => profile.title,
        "Summary" => profile.summary,
        "Location" => profile.location,
        "Country" => profile.country,
        "Industry" => profile.industry,
        "Picture" => profile.picture,
        "Skills" => profile.skills,
        "Organizations" => profile.organizations,
        "Education" => profile.education,
        "Websites" => profile.websites,
        "Groups" => profile.groups,
        "Languages" => profile.languages,
        "Certifications" => profile.certifications,
        "Number_of_Connections" => profile.number_of_connections,
        "Current_Companies" => profile.current_companies,
        "Past_Companies" => profile.past_companies,
        "Recommended_Visitors" => profile.recommended_visitors
    }

    File.open("Linked_Profiles/" + split_link + ".json","w") do |f|
      f.write(linkedinprofile.to_json)
    end

    sleep rand(4..9)

  rescue
    next
  end

end


