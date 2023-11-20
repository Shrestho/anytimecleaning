import React from "react";
import useFaqs from "./../hooks/useFaqs";
import Loading from "./../shared/Loading";

const FAQ = () => {
  const { faqs, loading } = useFaqs();
  return (
    <div className="container px-8 md:px-20 mx-auto my-20 top-margin" id="faq">

<section>
  <h3 class="text-center mb-4 pb-2 text-primary fw-bold">FAQ</h3>
  <p class="text-center mb-5"> 
    Find the answers for the most frequently asked questions below
  </p>
  {loading ? (
        <Loading />
      ) : (

    <div class="row">
    {faqs?.map((faq) => (
      <div class="col-md-6 col-lg-4 mb-4" key={faq?.id}>
        <h6 class="mb-3 text-primary"><i class="far fa-paper-plane text-primary pe-2"></i> {faq?.question?.en}</h6>
        <p>{faq?.answer?.en}</p>
      </div>
      ))}
    </div>
    )}
</section>
    </div>
  );
};

export default FAQ;
