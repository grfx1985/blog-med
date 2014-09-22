class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar2, :content_type => /\Aimage\/.*\Z/


def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    post = find_or_initialize_by(id: row["id"])
    post.update_attributes(row.to_hash)
    post.save!
  end
end


end
  
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end


def self.import(file)
   spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    post = find_by_id(row["id"]) || new
    post.attributes = row.to_hash
    post.save!
  end
end



def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when '.csv' then Csv.new(file.path, nil, :ignore)
  when '.xls' then Excel.new(file.path, nil, :ignore)
  when '.xlsx' then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end






