import React, { useState } from "react";
import Layout from "../../component/home-two/Layout";
import BreadCrumb from "../../component/home-two/BreadCrumb";
import Wrapper from "../../component/inquiry-list/Wrapper";
import SupportHistoryCard from "../../component/cards/SupportHistoryCard";
import SupportTracker from "../../component/inquiry-list/SupportTracker";
import SupportTicketsList from "../../component/inquiry-list/SupportTicketsList";
import img from "../../assets/img/faq-img-2.png";
import SupportNowModal from "../../component/inquiry-list/SupportNowModal";
import useMenu from "../../hooks/useMenu";
import SearchBar from "../../component/user/SearchBar";

function InquiryList() {
  const [supportNow, setSupportNow] = useState(false);
  useMenu();
  return (
    <Layout>
      <SupportNowModal
        isOpen={supportNow}
        handleClose={() => setSupportNow(false)}
      />
      <BreadCrumb title="문의 목록" link="/inquiry-list" />
      <Wrapper>
      <div className="container-fluid p-0">
          <div className="row crancy-gap-30">
            <div className="col-xxl-3 col-lg-4 col-12">
              <div className="row">
                <div className="col-12">
                </div>
              </div>
            </div>
            <SupportTicketsList />
          </div>
        </div>
      </Wrapper>
    </Layout>
  );
}

export default InquiryList;
