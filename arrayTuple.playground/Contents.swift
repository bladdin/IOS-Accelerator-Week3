//: Playground - noun: a place where people can play

import UIKit

var tupleArray = [12,13,5,6,9,34,59,1]

func highLowArray(highLowArray : [Int]) -> (min: Int, max: Int){
  var ran = highLowArray[0]
  var min = highLowArray[0]
  var max = highLowArray[0]
  for i in highLowArray{
    if i < min{
      min = i
    }
    else if i > max{
      max = i
    }
  }
  println(max)
  
  return (min, max)
}

let minMax = highLowArray(tupleArray)