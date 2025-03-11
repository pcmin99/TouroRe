import React, { useState } from "react";
import SelectInput from "../form/SelectInput";
import jsVectorMap from "jsvectormap";
import "jsvectormap/dist/maps/world.js";
// import "jsvectormap/dist/maps/korea.js";
import "jsvectormap/dist/maps/south-korea.js";
import { useEffect } from "react";
import axios from 'axios';


function Map() {
  // var markers = [
  //   { name: 'South-Korea' },
  // ];

  const baseUrl = 'http://localhost:8080';
  const [mapData, setMapData] = useState([]);
  const [mapName, setMapName] = useState([]);
  const [percentage, setPercentage] = useState([]);

  const getCountryName = (countryCode) => {
    let name = ""
    switch(countryCode) {
      case 'KR-31':
        name = "울산"
        break;
      case 'KR-49':
        name = "제주"
        break;
      case 'KR-48':
        name = "경상남도"
        break;
      case 'KR-45':
        name = "전라북도"
        break;
      case 'KR-44':
        name = "충청남도"
        break;
      case 'KR-47':
        name = "경상북도"
        break;
      case 'KR-46':
        name = "전라남도"
        break;
      case 'KR-41':
        name = "경기도"
        break;
      case 'KR-43':
        name = "충청남도"
        break;
      case 'KR-42':
        name = "강원특별자치도"
        break;
      case 'KR-27':
        name = "대구"
        break;
      case 'KR-11':
        name = "서울"
        break;
      case 'KR-50':
        name = "세종특별자치시"
        break;
      case 'KR-29':
        name = "광주"
        break;
      case 'KR-28':
        name = "인천"
        break;
      case 'KR-30':
        name = "대전"
        break;
      case 'KR-26':
        name = "부산"
        break;

    }
    return name;
  };

  axios.get(baseUrl + '/dashboard/locPrefer').then((response) => {
    // 지도 코드 가져와서 담기 - 4개
    const mapCodes = response.data.map((item) => {
      let mapcode = "";
      switch (item.locCode) {
        case '1.0': // 서울
          mapcode = 'KR-11';
          break;
        case '2.0': // 인천
          mapcode = 'KR-28';
          break;
        case '3.0': // 대전
          mapcode = 'KR-30';
          break;
        case '31.0': // 경기도
          mapcode = 'KR-41';
          break;
        case '32.0': // 강원특별자치도
          mapcode = 'KR-42';
          break;
        case '33.0': // 충청북도
          mapcode = 'KR-43';
          break;
        case '34.0': // 충청남도
          mapcode = 'KR-44';
          break;
        case '35.0': // 경상북도
          mapcode = 'KR-47';
          break;
        case '36.0': // 경상남도
          mapcode = 'KR-48';
          break;
        case '37.0': // 전라북도
          mapcode = 'KR-45';
          break;
        case '38.0': // 전라남도
          mapcode = 'KR-46';
          break;
        case '39.0': // 제주도
          mapcode = 'KR-49';
          break;
        case '4.0': // 대구
          mapcode = 'KR-27';
          break;
        case '5.0': // 광주
          mapcode = 'KR-29';
          break;
        case '6.0': // 부산
          mapcode = 'KR-26';
          break;
        case '7.0': // 울산
          mapcode = 'KR-31';
          break;
        case '8.0': // 세종특별자치시
          mapcode = 'KR-50';
          break;
      }
      return mapcode;
    });
    // 지도 코드 가져와 이름 변경
     const mapNames = response.data.map((item) => {
      let mapname = "";
      switch (item.locName) {
        case '1.0': // 서울
          mapname = '서울';
          break;
        case '2.0': // 인천
          mapname = '인천';
          break;
        case '3.0': // 대전
          mapname = '대전';
          break;
        case '31.0': // 경기도
          mapname = '경기도';
          break;
        case '32.0': // 강원특별자치도
          mapname = '강원특별자치도';
          break;
        case '33.0': // 충청북도
          mapname = '충청북도';
          break;
        case '34.0': // 충청남도
          mapname = '충청남도';
          break;
        case '35.0': // 경상북도
          mapname = '경상북도';
          break;
        case '36.0': // 경상남도
          mapname = '경상남도';
          break;
        case '37.0': // 전라북도
          mapname = '전라북도';
          break;
        case '38.0': // 전라남도
          mapname = '전라남도';
          break;
        case '39.0': // 제주도
          mapname = '제주도';
          break;
        case '4.0': // 대구
          mapname = '대구';
          break;
        case '5.0': // 광주
          mapname = '광주';
          break;
        case '6.0': // 부산
          mapname = '부산';
          break;
        case '7.0': // 울산
          mapname = '울산';
          break;
        case '8.0': // 세종특별자치시
          mapname = '세종특별자치시';
          break;
      }
      return mapname;
    });

    // 상위 4개 지역 % 계산
    const per = response.data.map((item) => {
      let pers = ((item.locCount)/(item.totalCount) * 100).toFixed(1);
      return pers;
    })



  setPercentage(per);
  setMapName(mapNames);
  setMapData(mapCodes);
});

  
  let map = undefined;
  useEffect(() => {
    if (map === undefined && mapData.length > 0 && mapName.length > 0) {
      map = new jsVectorMap({
        map: "kr_merc",
        // markers: ,
        regionsSelectableOne: true,
        regionsSelectable: true,
        markersSelectable: true,
        labels: {
          regions: {
            // The render's region receives region `code`
            render(code) {
              return mapData.indexOf(code) > -1 ? getCountryName(code) : null
            }
          }
        },
        selectedRegions: mapData,
        selector: "#world-map",
        backgroundColor: "transparent",
        // panControl: false,
        zoomControl: false,
        regionStyle: {
          initial: {
            fill: "#DDEDFF",
          },
          hover: {
            fill: "#0A82FD",
          },
        },
        showTooltip: true,
      });
    }
  }, [mapData, mapName]);
  return (
    <div className="col-lg-6 col-12">
      {/* <!-- Charts One --> */}
      <div className="charts-main charts-home-four mg-top-30">
        {/* <!-- Top Heading --> */}
        <div className="charts-main__heading  mg-btm-20">
          <h4 className="charts-main__title">사용자 여행 선호 지역 Top4</h4>
          {/* <SelectInput
            options={[" Last 7 Days", " Last 15 Days", "Last Month"]}
          /> */}
        </div>
        <div className="charts-main__one">
          <div className="tab-content" id="nav-tabContent">
            <div
              className="tab-pane fade show active"
              id="crancy-chart__country"
              role="tabpanel"
              aria-labelledby="crancy-chart__country"
            >
              <div className="crancy-vector-map">
                <div
                  id="world-map"
                  style={{ width: "100%", height: "270px", overflow: "hidden" }}
                ></div>
              </div>
              <div className="mg-top-20 crancy-progress-list--group">
                <ul className="crancy-progress-list crancy-progress-list__space crancy-progress-list__inline">
                {mapData.map((country, index) => (
                  <li key={index}>
                    <span className="crancy-progress-list__color crancy-color1__bg"></span>
                    <p>
                      <span>{getCountryName(country)}</span> <b>:</b> {percentage[index]}%
                    </p>
                  </li>
                ))}
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Map;
