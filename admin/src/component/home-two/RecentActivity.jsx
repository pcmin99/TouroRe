import React, { useEffect, useRef, useState } from "react";
import calenderIcon from "../../assets/img/calendar-icon-3.svg";
import arrowDown from "../../assets/img/arrow-down.svg";
import LineChart from "../chart/LineChart";
import PieChart from "../chart/PieChart";
import { myChart_Three } from "../../data/chartSettings";
import axios from "axios";
function RecentActivity() {
  const baseUrl = "http://localhost:8080";

  const chartRef = useRef(null);
  const [chartData, setCharData] = useState(myChart_Three);

  const createGradient = (ctx) => {
    const gradient = ctx.createLinearGradient(0, 0, 0, 150);
    gradient.addColorStop(0, gradientColor[0]);
    gradient.addColorStop(0.5, gradientColor[1]);
    return gradient;
  };

  useEffect(() => {
    // // Get canvas context and create gradient
    const ctx = chartRef?.current?.getContext("2d")?.chart.ctx;
    if (ctx) {
      const gradient = createGradient(ctx);
      // Update chart data and options
      chartRef.current.data.datasets[0].backgroundColor = gradient;
      chartRef.current.update();
    }
  }, []);


  axios.get(baseUrl + '/dashboard/getAgeUser').then((result) => {
    const agedatas = result.data;

    console.log(agedatas)
    const myChart_seven2 =  {
          type: 'pie',
          data: {
            labels: [
              "0~19세",
              "20~30세",
              "31~40세",
              "41~50세",
              "51~60세",
              "60~세",
            ],
            datasets: [{
              label: '연령대',
              data: [
                agedatas.age_0_19,
                agedatas.age_20_30,
                agedatas.age_31_40,
                agedatas.age_41_50,
                agedatas.age_51_60,
                agedatas.age_61_and_above
              ],
              // borderColor: '#0A82FD',
              backgroundColor: [
                'rgba(255, 99, 132, 0.6)',  // 0~19세 배경색
                'rgba(54, 162, 235, 0.6)', // 20~30세 배경색
                'rgba(255, 206, 86, 0.6)', // 31~40세 배경색
                'rgba(75, 192, 192, 0.6)', // 41~50세 배경색
                'rgba(153, 102, 255, 0.6)',// 51~60세 배경색
                'rgba(255, 159, 64, 0.6)', // 60~세 배경색
              ],
              borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              fill: false,
            }],
          },
        }

        setCharData(myChart_seven2)



    
  })
  return (
    <div className="col-lg-6  col-12">
      {/* <!-- Charts Three --> */}
      <div className="charts-main  mg-top-30">
        <div className="charts-main__heading mg-btm-30">
          <h4 className="charts-main__title">연령별 접속자 통계</h4>
          {/* <div className="charts-main-dates">
            <img src={calenderIcon} />
            <input
              id="date-input"
              className="charts-main-dates__input"
              placeholder="23 Jun"
              type="text"
            />
            <img src={arrowDown} />
          </div> */}
        </div>
        <div className="charts-main__three">
          <div className="tab-content" id="nav-tabContent">
            <div
              className="tab-pane fade show active "
              id="m_history"
              role="tabpanel"
              aria-labelledby="nav-home-tab"
            >
              <div className="crancy-chart__inside crancy-chart__activity">
                <PieChart
                  data={chartData.data}
                  options={chartData.options}
                  refer={chartRef}
                />
              </div>
            </div>
            <div
              className="tab-pane fade"
              id="m_history"
              role="tabpanel"
              aria-labelledby="nav-home-tab"
            >
              <div className="crancy-chart__inside crancy-chart__activity">
                {/* <LineChart
                    data={myChart_Three.data}
                    options={myChart_Three.options}
                    refer={chartRef}
                  /> */}
              </div>
            </div>
          </div>
        </div>
      </div>
      {/* <!-- End Charts Three --> */}
    </div>
  );
}

export default RecentActivity;
