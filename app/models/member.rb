require 'open-uri'

class Member < ActiveRecord::Base
  attr_accessible :affiliation, :first_name, :iris_url, :last_name

  default_scope :order => [:last_name, :first_name]

  has_one :role, :as => :profile, :dependent => :destroy
  has_one :user, :through => :role

  def first_last
    "#{first_name} #{last_name}"
  end

  def name
    first_last
  end

  def to_s
    name
  end

  def full_iris_url
    "http://www.nuigalway.ie/our-research/people/mathematics-statistics-and-applied-mathematics/#{iris_url}/"
  end

  def iris_home
    page = Nokogiri::HTML(open(full_iris_url))
    page.css("div[title='Home']").to_html
  end

  def iris_publications
    page = Nokogiri::HTML(open(full_iris_url))
    page.css("div[title='Publications']").to_html
  end

  def iris_content
    content = Nokogiri::HTML(open(full_iris_url)).css("div[title]")
    image = content.css("img[alt='My Photograph']").first
    image["src"] = URI.join(full_iris_url, image["src"]).to_s
    image["style"] = "height: 180px; width: auto;"
    content
  end

end
