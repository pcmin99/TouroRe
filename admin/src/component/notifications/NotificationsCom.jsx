import React, { useState } from "react";
import notifyImg from "../../assets/img/anotify1.svg";
import notifyImg2 from "../../assets/img/anotify2.svg";
import notifyImg3 from "../../assets/img/anotify3.svg";
import notifyImg4 from "../../assets/img/anotify4.svg";
import notifyImg5 from "../../assets/img/anotify5.svg";
import notifyImg6 from "../../assets/img/anotify6.svg";
import notifyImg7 from "../../assets/img/anotify7.svg";

import { Link } from "react-router-dom";
import NotificationItem from "./NotificationItem.jsx";

function NotificationsCom({ isSettings }) {
  const [activeNotification, setActiveNotification] = useState({
    ["All Notification update"]: true,
    "When you upload products": false,
    "You got sell your products": true,
    "Got new follower": false,
    "Got new Sale": true,
    "Author level up": false,
    "You upload your first product successfully done": true,
    "Got new followers": false,
  });
  const handleActiveNotification = (name) => {
    setActiveNotification({
      ...activeNotification,
      [name]: !activeNotification[name],
    });
  };

  return (
    <div className="row">
      <div className="col-12">
        <div className="crancy-body">
          {/* <!-- Dashboard Inner --> */}
          <div className="crancy-dsinner">
            <div
              className={`crancy-notifications crancy-notifications__all ${
                isSettings ? "" : "mg-top-30"
              }`}
            >
              {/* 여기에다 코드 붙이기 */}
              <div class="container-fluid">
                <div class="row">
                  <div class="col-12">
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="card">
                          <div class="card-header">
                            <h5>여행지 등록</h5>
                          </div>
                          <div class="card-body">
                            <form class="theme-form mega-form">
                              <div class="mb-3">
                                <label class="form-label-title">여행지 명</label>
                                <input
                                  class="form-control"
                                  type="text"
                                  placeholder="Menu Name"
                                />
                              </div>

                              <div class="mb-3">
                                <label class="form-label-title ">
                                    이미지 업로드
                                  </label>
                                  <div class="bootstrap-tagsinput">
                                  <div className="input-group">
                                    <input
                                      type="file"
                                      className="form-control"
                                      id="image-upload"
                                    />
                                  </div>
                                </div>
                                <input
                                  class="form-control"
                                  type="text"
                                  name="tags"
                                  value="pfTag1,pfTag2,pfTag3"
                                  data-role="tagsinput"
                                  style={{ display: "none" }}
                                />
                              </div>
                              
                              <div className="row">
                                <div className="col-md-6">
                                  <div className="mb-3">
                                    <label className="form-label-title ">
                                      여행지 설명
                                    </label>
                                    <textarea
                                    style={{ height:'400px' }}
                                      className="form-control"
                                      placeholder="여행지 설명"
                                    ></textarea>
                                  </div>
                                </div>

                                <div className="col-md-6">
                                  <div className="mb-3">
                                    <label className="form-label-title ">
                                      여행지 주소(위치)
                                    </label>
                                    <textarea
                                    style={{height:'174px' }}
                                      className="form-control"
                                      placeholder="여행지 주소(위치)"
                                    ></textarea>
                                  </div>
                                  <div className="mb-3">
                                    <label className="form-label-title ">
                                      여행지 공식 사이트 주소
                                    </label>
                                    <textarea
                                    style={{height:'174px' }}
                                      className="form-control"
                                      placeholder="여행지 공식 사이트 주소"
                                    ></textarea>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div className="card-footer d-flex justify-content-end">
                            <button className="btn btn-primary btn-sm me-2"
                            style={{ fontSize: '12px', padding: '5px 10px' }}>Submit</button>
                            <button className="btn btn-outline-primary btn-sm ml-2"
                            style={{ fontSize: '12px', padding: '5px 10px' }}>Cancel</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* <!-- End Dashboard Inner --> */}
        </div>
      </div>
    </div>
  );
}

export default NotificationsCom;
