module CarrierWave
  module Uploader
    module Url

      ##
      # === Returns
      #
      # [String] the location where this file is accessible via a url
      #
      def url(*args)
        if(args.first)
          raise ArgumentError, "Version #{args.first} doesn't exist!" if versions[args.first.to_sym].nil?
          # recursively proxy to version
          versions[args.first.to_sym].url(*args[1..-1])
        else
          if file.respond_to?(:url) and not file.url.blank?
            file.url
          elsif current_path
            File.expand_path(current_path).gsub(File.expand_path(public), '')
          end
        end
      end

      alias_method :to_s, :url

    end # Url
  end # Uploader
end # CarrierWave