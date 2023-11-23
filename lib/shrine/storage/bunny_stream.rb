require "shrine"
require "bunny_stream"
require "down/http"

class Shrine
  module Storage
    class BunnyStream
      attr_reader :host

      def initialize(host: nil, upload_options: {}, store_info: nil)
        @host = host
      end

      def upload(io, id, shrine_metadata: {}, **upload_options)
        video_id = BunnyStream::Storage.create_video({title: shrine_metadata["filename"]})

        BunnyStream::Storage.upload_video(video_id, io)

        id.replace(video_id)
      end

      def open(id, **options)
        Down::Http.open(url(id).gsub("playlist.m3u8", "original"), **options)
      end

      def exists?(id)
        val = BunnyStream::Storage.get_video(id)

        val.is_a?(Hash) && val['gid'].present?
      end

      def delete(id)
        BunnyStream::Storage.delete_video(id)
      end

      def url(id, size: nil, **options)
        "https://#{@host}/#{id}/playlist.m3u8"
      end
    end
  end
end
