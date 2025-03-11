import React, { useEffect, useState } from "react";
import HistoryCard from "../cards/HistoryCard";
import sales from "../../assets/img/sales-graph-1.svg";
import visit from "../../assets/img/sales-graph-2.svg";
import click from "../../assets/img/sales-graph-3.svg";
import inspirations from "../../assets/img/sales-graph-4.svg";
import axios from "axios";

import {
  myChart_eight,
  myChart_nine,
  myChart_seven,
  myChart_ten,
} from "../../data/chartSettings";

function History() {

  const baseUrl = "http://localhost:8080";
  const [userCount, setUserCount] = useState(0);
  const [touroviewCount, setTouroviewCount] = useState(0);
  const [reviewCount, setReveiwCount] = useState(0);
  const [receiptReviewCount, setReceiptReveiwCount] = useState(0);

  const [monthData, setMonthData] = useState([]);
  const [countData, setCountData] = useState([]);
  
  // 여행친구 찾기
  const [matemonthData, setMateMonthData] = useState([]);
  const [matecountData, setMateCountData] = useState([]);

  // 여행후기
  const [viewmonthData, setViewMonthData] = useState([]);
  const [viewcountData, setViewCountData] = useState([]);

  // 영수증 리뷰 수
  const [receiptmonthData, setReceiptMonthData] = useState([]);
  const [receiptcountData, setReceiptCountData] = useState([]);

  const [chartData2, setCharData2] = useState(myChart_seven);
  const [chartData3, setCharData3] = useState(myChart_eight);
  const [chartData4, setCharData4] = useState(myChart_nine);
  const [chartData5, setCharData5] = useState(myChart_ten);
    // 회원 수 가져오기
    axios.get(baseUrl + '/dashboard/userCount').then((result) => {
      // console.log(result)
      setUserCount(result.data);
    });

    // 회원 수 데이터 가져오기
    // 데이터를 가져와서 월과 월별 회원가입 수 가져오기
    axios.get(baseUrl + '/dashboard/userCountGraph').then((result) => {
      const monthdatas = result.data;
      console.log(monthdatas)
      const months = monthdatas.map((month) => {
        return month.month;
      })
      const countdatas = monthdatas.map((count) => {
        return count.count_month;
      })
      setMonthData(months);
      setCountData(countdatas);
      
      // myChart_seven.data.labels = monthData;
      // myChart_seven.data.datasets[0].data = countData;

      const myChart_seven2 =  {
        type: 'line',
        data: {
          labels: monthData,
          datasets: [{
            label: '회원 수',
            data: countData,
            borderColor: '#0A82FD',
            fill: false,
          }],
        },
      }

      setCharData2(myChart_seven2)
      
      
    
    });

    // console.log(monthData);
    // console.log(countData);
    // console.log(myChart_seven.data.datasets[0].data);

    // 여행친구찾기 게시글 수 가져오기
    axios.get(baseUrl + '/dashboard/touroviewCount').then((result) => {
      // console.log(result)
      setTouroviewCount(result.data);
    });

    // 여행친구찾기 데이터 가져오기
    // 데이터를 가져와서 월과 월별 여행친구찾기 수 가져오기
    axios.get(baseUrl + '/dashboard/touromateCountGraph').then((result) => {
      const monthdatas = result.data;
      // console.log(monthdatas)
      const months = monthdatas.map((month) => {
        return month.month;
      })
      const countdatas = monthdatas.map((count) => {
        return count.count_month;
      })
      setMateMonthData(months);
      setMateCountData(countdatas);
      
      
      // setChartData(result.data);
      // console.log(setChartData.data)
      // myChart_eight.data.labels = matemonthData;
      // myChart_eight.data.datasets[0].data = matecountData;
      // console.log(myChart_eight.data.labels)

      const myChart_seven2 =  {
        type: 'line',
        data: {
          labels: matemonthData,
          datasets: [{
            label: '여행친구 찾기',
            data: matecountData,
            borderColor: '#EF5DA8',
            fill: false,
          }],
        },
      }

      setCharData3(myChart_seven2)
    
    });



    // 후기 게시글 수 가져오기
    axios.get(baseUrl + '/dashboard/reviewCount').then((result) => {
      // console.log(result)
      setReveiwCount(result.data);
    })

    // 후기 게시글 데이터 가져오기
    // 데이터를 가져와서 월과 월별 후기 게시글 수 가져오기
    axios.get(baseUrl + '/dashboard/touroviewCountGraph').then((result) => {
      const monthdatas = result.data;
      // console.log(monthdatas)
      const months = monthdatas.map((month) => {
        return month.month;
      })
      const countdatas = monthdatas.map((count) => {
        return count.count_month;
      })
      setViewMonthData(months);
      setViewCountData(countdatas);
      
      // setChartData(result.data);
      // console.log(setChartData.data)
      // myChart_nine.data.labels = viewmonthData;
      // myChart_nine.data.datasets[0].data = viewcountData;
      // console.log(myChart_seven.data.datasets[0].data)

      const myChart_seven2 =  {
        type: 'line',
        data: {
          labels: viewmonthData,
          datasets: [{
            label: '여행후기게시글수',
            data: viewcountData,
            borderColor: '#27AE60',
            fill: false,
          }],
        },
      }

      setCharData4(myChart_seven2)
      
    
    });

    // 영수증 리뷰 수 가져오기
    axios.get(baseUrl + '/dashboard/receiptReviewCount').then((result) => {
      // console.log(result)
      setReceiptReveiwCount(result.data);
    })

    // 영수증 리뷰 수 데이터 가져오기
    // 데이터를 가져와서 월과 영수증 리뷰 수 가져오기
    axios.get(baseUrl + '/dashboard/receiptCountGraph').then((result) => {
      const monthdatas = result.data;
      // console.log(monthdatas)
      const months = monthdatas.map((month) => {
        return month.month;
      })
      const countdatas = monthdatas.map((count) => {
        return count.count_month;
      })
      setReceiptMonthData(months);
      setReceiptCountData(countdatas);
      
      // setChartData(result.data);
      // console.log(setChartData.data)
      // myChart_ten.data.labels = receiptmonthData;
      // myChart_ten.data.datasets[0].data = receiptcountData;
      // console.log(myChart_seven.data.datasets[0].data)

      const myChart_seven2 =  {
        type: 'line',
        data: {
          labels: receiptmonthData,
          datasets: [{
            label: '영수증리뷰수',
            data: receiptcountData,
            borderColor: '#9B51E0',
            fill: false,
          }],
        },
      }

      setCharData5(myChart_seven2)
    
    });


  return (
    <div className="row crancy-gap-30">
      <HistoryCard
        title="회원 수"
        count={userCount}
        img={sales}
        color="#0A82FD"
        chartData={chartData2}
        gradientColor={["rgba(10, 130, 253, 0.18) ", "rgba(10, 130, 253, 0) "]}
      />
      <HistoryCard
        title="여행친구 찾기"
        count={touroviewCount}
        img={visit}
        color="#EF5DA8"
        chartData={chartData3}
        gradientColor={["rgba(239, 93, 168, 0.40)", "rgba(239, 93, 168, 0.00)"]}
      />
      <HistoryCard
        title="여행 후기"
        count={reviewCount}
        img={click}
        color="#27AE60"
        chartData={chartData4}
        gradientColor={["rgba(89, 190, 89, 0.40)", "rgba(89, 190, 89, 0.00)"]}
      />
      <HistoryCard
        title="영수증 리뷰 수"
        count={receiptReviewCount}
        img={inspirations}
        color="#9B51E0"
        chartData={chartData5}
        gradientColor={["rgba(155, 81, 224, 0.40)", "rgba(155, 81, 224, 0.00)"]}
      />
    </div>
  );
}

export default History;
