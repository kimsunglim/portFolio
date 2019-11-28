package com.kimteam

import org.apache.spark.api.java
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.{DataFrame, Row, SQLContext, SaveMode}
import org.apache.spark.sql.SQLContext

object quiz0627 {
  def main(args: Array[String]): Unit = {

    ////////////////////////////////////  Spark-session definition  ////////////////////////////////////
    // var spark = SparkSession.builder().config("spark.master","local").getOrCreate()
    val conf = new SparkConf().setAppName("Test").setMaster("local[4]")
    var sc = new SparkContext(conf)
    val spark = new SQLContext(sc)


    // 접속정보 설정(kopo_channel_seasonality_new)
    var staticUrl = "jdbc:oracle:thin:@192.168.110.112:1521/orcl"
    var staticUser = "kopo"
    var staticPw = "kopo"
    var selloutDb = "KOPO_CHANNEL_SEASONALITY_NEW"

    // 접속한 데이터베이스에서 테이블 가져오기
    val seasonalityDF = spark.read.format("jdbc"). //데이터프레임 구분을 위해서 변수명에 DF를 붙임
      option("url", staticUrl).
      option("dbtable", selloutDb).
      option("user", staticUser).
      option("password", staticPw).load

    // 테이블 출력
    println(seasonalityDF.show)

    // 스파크에 tempview로 테이블 저장
    seasonalityDF.createOrReplaceTempView("kopodata")

    println(seasonalityDF.show(5))

    // 컬럼 인덱스 변수에 저장
    var seasonalityColumns = seasonalityDF.columns.map(x=>{
      x.toUpperCase
    })

    var regionidNo = seasonalityColumns.indexOf("REGIONID")
    var productNo = seasonalityColumns.indexOf("PRODUCT")
    var yearweekNo = seasonalityColumns.indexOf("YEARWEEK")
    var qtyNo = seasonalityColumns.indexOf("QTY")

    // rdd로 변환
    var seasonalityRdd = seasonalityDF.rdd

    // groupBy함수를 사용하여 지역/상품별로 판매량 합계를 구하기
    var seasonMapResult = seasonalityRdd.groupBy(x => {
      (x.getString(regionidNo), x.getString(productNo))
    }).map(x => {
      var key = x._1
      var data = x._2
      var qtySum = data.map(x=>{String.valueOf(x.get(qtyNo)).toDouble}).sum
      (x._1._1, x._1._2, qtySum)
    })

//    var seasonMapResult = seasonalityRdd.groupBy(x=>{
//      (x.getString(regionidNo), x.getString(productNo))
//    }).map(x=> {
//      // 그룹별 분산처리가 수행됨
//      var key = x._1
//      var data = x._2
//      var qtySum = data.map(x=>{x.getString(qtyNo).toDouble}).sum
//      BigDecimal cannot be cast to java.lang.String 오류가 남
//      qtyNo 이 number 타입인데 String으로 변환할 때 나는 오류 -> 아래처럼 변환
//      var qtySum = data.map(x=>{String.valueOf(x.get(qtyNo)).toDouble}).sum
//      (x._1, x._2, qtySum) // (key, qtySum) key들을 array처럼 인식해서 오류가 남
//    })


    // df로 변환
    var middleTable = seasonMapResult.toDF("REGIONID", "PRODUCT", "QTY")
    println(middleTable.show)


    // 데이터베이스 주소 및 아이디, 비밀번호
    var outputUrl = "jdbc:oracle:thin:@192.168.110.111:1521/orcl"
    var outputUser = "KIMSUNGLIM"
    var outputPw = "kimsunglim"

    // 데이터베이스에 저장
    val prop = new java.util.Properties
    prop setProperty("driver", "oracle.jdbc.OracleDriver")
    prop.setProperty("user", outputUser)
    prop.setProperty("password", outputPw)
    val table = "KOPO_2019_SUNGLIM"
    //append
    middleTable.write.mode("overwrite").jdbc(outputUrl, table, prop)

    middleTable.createOrReplaceTempView("KIM_MIDDLETABLE")

  }
}











