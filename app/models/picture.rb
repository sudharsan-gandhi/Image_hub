class Picture
    extend ActiveModel::Naming
    attr_reader :name, :extension, :file, :file_name, :path

    def initialize(file)
        @name = Time.now.hash.to_s
        @extension = file.original_filename.split(".").pop
        @file = file
        @file_name = [self.name, self.extension].join(".")
        @path = Rails.root.join('public', 'images', [self.name, self.extension].join(".") ).to_s
    end

    def save
        File.open(self.path, 'wb') do |f|
            f.write(self.file.read)
            f.close
        end
    end

    def delete
        File.delete(self.path)
    end

end