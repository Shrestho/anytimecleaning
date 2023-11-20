import React from "react";
import useProvider from "../../hooks/useProvider";
import { useParams } from "react-router";
import { AiOutlineUser } from "react-icons/ai";
import provider_img from '../../../assets/uploads/media-uploader/provider.png';

const ProviderProfile = () => {
    const { id } = useParams();
    const { provider } = useProvider(id);
    console.log("provider:",provider);
    const img_index = provider?.media?.length ? provider.media.length-1 : null;

  return (
    <div className="container top-margin">
      <div className="row mt-5">
        <div className="col-sm-4 pt-5 d-flex justify-content-center">
        {img_index!==null ?
        <img className="" height={200} width={200} src={provider.media[img_index]?.url} alt="Provider" />:
        <img className="" height={200} width={200} src={provider_img} alt="Provider" />
        }
        </div>
        <div className="col-sm-8">
          <h2 className="pt-5">{provider?.name}</h2>
          <p><strong>Email: </strong>{provider?.email}</p>
          <p><strong>Location:</strong> {provider?.custom_fields?.address?.value}</p>
          <p><strong>Phone Number:</strong> {provider?.phone_number}</p>
          <p><strong>Availability Range:</strong> {provider?.availability_range}</p>
          
        </div>
      </div>
      <div className="row">
        <div className="col-sm-12 py-5">
          <h3>About</h3>
          <p
            dangerouslySetInnerHTML={{ __html: provider?.custom_fields?.bio?.view }}/>
        </div>
      </div>
    </div>
  );
};

export default ProviderProfile;
