module Markethackers
  module Client
    class Scan < Base
      CREATE_URL = "/api/v1/scans.json"
      RUN_URL    = "/api/v1/scans/:id/run.json"

      attr_accessor :name, :script

      def initialize(name, script = nil)
        @name   = name
        @script = script
      end

      def create
        resp = post(CREATE_URL, scan: {name: name, script: script})

        resp.body["id"]
      end

      def run
        resp = post(RUN_URL.gsub(:id, name))

        resp.body["id"]
      end
    end
  end
end
