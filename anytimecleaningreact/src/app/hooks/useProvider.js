import { useEffect, useState } from 'react';

const useProvider = (id) => {
  const [provider, setProvider] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    const url = `http://127.0.0.1:8000/api/e_providers${id}`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        setProvider(data);
        console.log(data);
      });
  }, [id]);

  return {
    provider,
    setProvider,
    reload,
    setReload,
  };
};

export default useProvider;
