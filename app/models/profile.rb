class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
                  styles: { thumb: ["64x64#", :jpg],
                            original: ['500x500>', :jpg],
                            small: ["300x300#", :jpg]},
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip",
                                      small: "-quality 85 -strip"},
                  url: "/system/:hash.:extension",
                  hash_secret: "abc123"
  validates_attachment :image, presence: true,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


  # has_attached_file :image,
  #                   styles: { thumb: ["64x64#", :jpg],
  #                             original: ['500x500>', :jpg] },
  #                   convert_options: { thumb: "-quality 75 -strip",
  #                                      original: "-quality 85 -strip" },
  #                   storage: :s3,
  #                   s3_region: ENV["AWS_REGION"],
  #                   s3_credentials: {access_key_id: ENV["AWS_KEY"], secret_access_key: ENV["AWS_SECRET"]},
  #                   bucket: "devdate"
  # validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  #                       size: { in: 0..500.kilobytes }

  def self.swearword
    %w(shitballs fuck damn goddamn shit  son\ of\ a\ bitch only\ in\ my\ head)
  end

  def self.interests
    %w(art reading photography food sports health design writing outdoors animals travel culture coffee wine)
  end

  def item
    "Favorite Item: #{favorite_item}"
  end

  def word
    "Favorite Word: #{favorite_swearword}"
  end

  def self.search(search)
    where("favorite_item ILIKE ? OR interests ILIKE ? ", "%#{search}%", "%#{search}%")
  end
end
