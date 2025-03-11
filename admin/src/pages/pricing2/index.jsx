import React from "react";
import Layout from "../../component/home-two/Layout";
import BreadCrumb from "../../component/home-two/BreadCrumb";
import Wrapper from "../../component/pricing/Wrapper";
import PricingCom from "../../component/touromate-view/PricingCom";
import FunFact from "../../component/pricing/FunFact";
import useMenu from "../../hooks/useMenu";

function Touromate() {
  useMenu();
  return (
    <Layout>
      <BreadCrumb title="여행친구 찾기 상세 페이지" link="/pricing" />
      <Wrapper>
        <PricingCom />
        {/* <FunFact /> */}
      </Wrapper>
    </Layout>
  );
}

export default Touromate;
