import { useEffect, useState } from "react";

const useProviders = (id) => {
  const [providers, setProviders] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    const url = `http://127.0.0.1:8000/api/e_providers`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        setProviders(data);
        console.log(data);
      });
  }, []);

  return {
    providers,
    setProviders,
    reload,
    setReload,
  };
};

export default useProviders;
