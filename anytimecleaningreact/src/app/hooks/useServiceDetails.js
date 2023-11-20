import { useEffect, useState } from 'react';
import RootURL from '../components/Contants';

const useServiceDetails = (id) => {
  const [serviceDetail, setServiceDetail] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    fetch(RootURL + `e_services${id}`)
      .then((response) => response.json())
      .then((data) => {
        setServiceDetail(data);
        console.log(data);
      });
  }, [id]);

  return {
    serviceDetail,
    setServiceDetail,
    reload,
    setReload,
  };
};

export default useServiceDetails;
