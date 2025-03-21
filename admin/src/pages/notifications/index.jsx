import React from "react";
import Layout from "../../component/home-two/Layout";
import BreadCrumb from "../../component/home-two/BreadCrumb";
import NotificationsCom from "../../component/notifications/NotificationsCom";
import useMenu from "../../hooks/useMenu";

function Notifications() {
  useMenu();
  return (
    <Layout>
      <BreadCrumb title="rica 여행지 등록/수정 " link="notifications" />
      <NotificationsCom />
    </Layout>
  );
}

export default Notifications;
