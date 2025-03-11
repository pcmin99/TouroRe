import React, { useEffect, useState } from "react";
import Layout from "../../component/home-two/Layout";
import BreadCrumb from "../../component/home-two/BreadCrumb";
import Wrapper from "../../component/tour-view/Wrapper";
import { images, images2 } from "../../data/images";
import Heading from "../../component/tour-view/Heading";
import useMenu from "../../hooks/useMenu";

function Tourview() {
  useMenu();
  const [activeGallery, setActiveGallery] = useState(1);
  const [imagesG, setImages] = useState(images);
  useEffect(() => {
    setImages(imagesG === images ? images2 : images);
  }, [activeGallery]);
  return (
    <Layout>
      <BreadCrumb title="여행지 상세" link="/tour-view" />
      <Wrapper>
        <Heading />
        
      </Wrapper>
    </Layout>
  );
}

export default Tourview;
