module Image
    def self.validate_size(picture)
        image = MiniMagick::Image.open(picture.path)
        if (image.width > 5000 || image.height > 5000)
            return false
        end
        return true
    end

    def self.validate_type(picture)
        if ["png","jpeg","jpg"].include? (picture.extension)
            return true
        else
            return false
        end
    end
end