class API::V1::DirectUploadsController < ActiveStorage::DirectUploadsController
    skip_before_action :verify_authenticity_token
    def create 
        blob = ActiveStorage::craete_before_direct_upload!(blob_args)
        render json: direct_upload_json(blob)
    end
    priveta

    def direct_upload_json(blob)
      blob.as_json(root: false, methods: :signed_id).merge(:service_url url_for(blob)).merge(
          blob.service_url_direct_upload,
          
      )
    end
end