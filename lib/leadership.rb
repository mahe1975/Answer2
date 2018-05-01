
require 'selenium-webdriver'

module MailChimps

  module UI

    def self.launch
      $driver = Selenium::WebDriver.for :chrome
      $driver.manage.timeouts.implicit_wait = 10
      $driver.manage.window.maximize
      $driver.get "https://mailchimp.com/"
    end

    def self.navigate_about
      abt = $driver.find_element(:xpath,"//a[@href='/about']")
      $driver.execute_script("arguments[0].scrollIntoView();", abt)
      abt.click
      @count = driver.find_elements(:xpath,"//a[@class='bio_link']").size
      puts "Lead member count : #{@count}"
    end

    def self.add_members
      CSV.open("Mahendra.csv","w") do |csv|
        for j in 0..@count-1
          t=$driver.find_elements(:xpath,"//a[@class='bio_link']").get(j).getAttribute("data-title")
          p=$driver.find_elements(:xpath,"//a[@class='bio_link']").get(j).getAttribute("data-position")
          d=$driver.find_elements(:xpath,"//a[@class='bio_link']").get(j).getAttribute("data-description")
          csv << [t,p,d]
        end
      end
      puts 'CSV file was created successfully !!!'
      $driver.quit
    end
  end

end